// Copyright (c) 2014 Mohit Shridhar, David Lee

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


#include "namespace_mux.h"

NamespaceMux::NamespaceMux()
{
	parseParams();
	setupMuxers();
	setupController();
}

NamespaceMux::~NamespaceMux()
{
	rosNode->shutdown();
	delete rosNode;
}

void NamespaceMux::setupController()
{
	// Setup mux controller:
	control_sub = rosNode->subscribe<std_msgs::String>(MUX_CONTROL_TOPIC, 2, &NamespaceMux::mux_control_callback, this);
	
}

void NamespaceMux::parseParams()
{
	rosNode = new ros::NodeHandle("");	

	rosNode->getParam("/namespace_mux/incoming_ns_prefix", incoming_ns_prefix);
	ROS_INFO("PARAM: incoming_ns_prefix - %s\n", incoming_ns_prefix.c_str());

	rosNode->getParam("/namespace_mux/outgoing_ns", outgoing_ns);
	ROS_INFO("PARAM: outgoing_ns - %s\n", outgoing_ns.c_str());

	rosNode->getParam("/namespace_mux/active_bots", active_bots);
	rosNode->getParam("/namespace_mux/subscribed_topics", subscribed_topics);
	rosNode->getParam("/namespace_mux/published_topics", published_topics);

	if (active_bots.empty()) {
		ROS_ERROR("No bots are active. Dynamic Topic relay disabled\n");
		std::exit(EXIT_FAILURE);
	} 

	// Default namespace: first bot
	else {
		currRobotNs = active_bots.begin()->c_str();
		ROS_INFO("Current Robot Namespace: %s\n", currRobotNs.c_str());
	}
}

void NamespaceMux::setupMuxers()
{
	setupSubscribers();
	setupPublishers();
}

void NamespaceMux::setupSubscribers()
{
	for (std::vector<std::string>::iterator it = subscribed_topics.begin(); it != subscribed_topics.end(); ++it) {
		std::string mainTopic = (*it).c_str();
		std::string inputTopic = "/" + currRobotNs + mainTopic;
		std::string outputTopic = "/" + outgoing_ns + mainTopic;
		
		DynamicTopicRelay* relayedSubTopic = new DynamicTopicRelay(rosNode, mainTopic, inputTopic, outputTopic); 
		ros::Subscriber inputSubscription = rosNode->subscribe<topic_tools::ShapeShifter>(relayedSubTopic->getInputTopic(), 10, &DynamicTopicRelay::in_cb, relayedSubTopic);
		
		inputSubscriptions.push_back(inputSubscription);
		relayedSubs.push_back(relayedSubTopic);
	}
}

void NamespaceMux::setupPublishers()
{
	for (std::vector<std::string>::iterator it = published_topics.begin(); it != published_topics.end(); ++it) {
		std::string mainTopic = (*it).c_str();
		std::string inputTopic = "/" + outgoing_ns + mainTopic;
		std::string outputTopic = "/" + currRobotNs + mainTopic;

		DynamicTopicRelay* relayedPubTopic = new DynamicTopicRelay(rosNode, mainTopic, inputTopic, outputTopic);

		ros::Subscriber inputPublication = rosNode->subscribe<topic_tools::ShapeShifter>(relayedPubTopic->getInputTopic(), 10, &DynamicTopicRelay::in_cb, relayedPubTopic);

		inputPublications.push_back(inputPublication);
		relayedPubs.push_back(relayedPubTopic);
	}
}

void NamespaceMux::mux_control_callback(const std_msgs::String::ConstPtr& cmd)
{
	std::string newBotNs = cmd->data;

	// Ensure that robot namespace exists:
	if (std::find(active_bots.begin(), active_bots.end(), newBotNs) != active_bots.end()) {
		currRobotNs = newBotNs;
		switchMuxes();
		ROS_INFO("Current namespace: %s\n", currRobotNs.c_str());
	} else {
		ROS_ERROR("The namespace '%s' does exist. Check that it was properly initialized in your launch file\n", newBotNs.c_str());
	}
}

void NamespaceMux::manageTopics()
{
	ros::spin();
}

void NamespaceMux::switchMuxes()
{
	switchSubscribers();
	switchPublishers();
}

void NamespaceMux::switchPublishers()
{	
	for (std::vector<ros::Subscriber>::iterator it = inputPublications.begin(); it != inputPublications.end(); ++it) {
		(*it).shutdown();
	}

	inputPublications.clear();
	setupPublishers();
}

void NamespaceMux::switchSubscribers()
{
	for (std::vector<ros::Subscriber>::iterator it = inputSubscriptions.begin(); it != inputSubscriptions.end(); ++it) {
		(*it).shutdown();
	}

	inputSubscriptions.clear();
	setupSubscribers();
}

int main(int argc, char **argv)
{	
	ros::init(argc, argv, "outgoing_ns_mux");

	NamespaceMux nsMux;
	nsMux.manageTopics();

	return 0;
}
