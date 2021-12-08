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


#include <cstdio>
#include <topic_tools/shape_shifter.h>
#include <topic_tools/parse.h>

#include <ros/callback_queue.h>

class DynamicTopicRelay
{
	private:

		ros::NodeHandle *g_node; //= NULL;

		bool g_advertised; //= false;
		std::string g_output_topic, g_input_topic, g_main_topic;
		ros::Publisher g_pub;

	public:
		DynamicTopicRelay(ros::NodeHandle* rosNode, std::string mainTopic, std::string inputTopic, std::string outputTopic);
		~DynamicTopicRelay();
		void setOutputTopic(std::string newOutputTopic);
		
		std::string getInputTopic();
		std::string getOutputTopic();
		std::string getMainTopic();

	public:
		void in_cb(const boost::shared_ptr<topic_tools::ShapeShifter const>& msg);
};