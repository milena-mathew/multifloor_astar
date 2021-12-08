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

DynamicTopicRelay::DynamicTopicRelay(ros::NodeHandle* rosNode, std::string mainTopic, std::string inputTopic, std::string outputTopic)
{	
	g_node = rosNode;
	g_advertised = false;

	g_main_topic = mainTopic;
	g_output_topic = outputTopic;
	g_input_topic = inputTopic;
}

DynamicTopicRelay::~DynamicTopicRelay()
{
	g_node->shutdown();
	delete g_node;	
}

void DynamicTopicRelay::in_cb(const boost::shared_ptr<topic_tools::ShapeShifter const>& msg)
{
  if (!g_advertised)
  {
    g_pub = msg->advertise(*g_node, g_output_topic, 100);
    g_advertised = true;
    ROS_INFO("%s advertised as %s\n", g_input_topic.c_str(), g_output_topic.c_str());
  }

  g_pub.publish(msg);
}

std::string DynamicTopicRelay::getInputTopic()
{
	return g_input_topic;
}

std::string DynamicTopicRelay::getOutputTopic()
{
	return g_output_topic;
}

std::string DynamicTopicRelay::getMainTopic()
{
	return g_main_topic;
}
