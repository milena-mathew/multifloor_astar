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


#include "dynamic_topic_relay.h"

#include <topic_tools/shape_shifter.h>
#include <topic_tools/parse.h>

#include <std_msgs/String.h>

#define MUX_CONTROL_TOPIC "/namespace_mux/control"

class DynamicTopicRelay;

class NamespaceMux
{
	private:
		ros::NodeHandle* rosNode;
		ros::Subscriber control_sub;
		std::string incoming_ns_prefix, outgoing_ns;
		
		std::vector<std::string> active_bots, subscribed_topics, published_topics;
		std::vector<DynamicTopicRelay*> relayedSubs, relayedPubs;
		std::vector<ros::Subscriber> inputSubscriptions, inputPublications;

		std::string currRobotNs;

		void parseParams();
		void mux_control_callback(const std_msgs::String::ConstPtr& msg);
		void setupController();

	public:
		NamespaceMux();
		~NamespaceMux();

		void manageTopics();
		
		void setupMuxers();
		void setupSubscribers();
		void setupPublishers();

		void switchMuxes();
		void switchSubscribers();
		void switchPublishers();

};