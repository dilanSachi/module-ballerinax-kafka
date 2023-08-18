// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/lang.'string;
import ballerina/test;

string MESSAGE_KEY = "TEST-KEY";


@test:Config {enable: true}
function producerSendStringTest() returns error? {
    string topic = "send-string-test-topic";
    kafkaTopics.push(topic);
    Producer stringProducer = check new (DEFAULT_URL, producerConfiguration);
    string message = "Hello, Ballerina";
    Error? result = stringProducer->send({ topic: topic, value: message.toBytes() });
    test:assertFalse(result is error, result is error ? result.toString() : result.toString());
    result = stringProducer->send({ topic: topic, value: message.toBytes(), key: MESSAGE_KEY.toBytes() });
    check stringProducer->close();

    ConsumerConfiguration consumerConfiguration = {
        topics: [topic],
        offsetReset: OFFSET_RESET_EARLIEST,
        groupId: "producer-send-string-test-group",
        clientId: "test-consumer-46"
    };
    Consumer consumer = check new (DEFAULT_URL, consumerConfiguration);
    ConsumerRecord[] consumerRecords = check consumer->poll(3);
    test:assertEquals(consumerRecords.length(), 2);
    byte[] messageValue = consumerRecords[0].value;
    string messageConverted = check 'string:fromBytes(messageValue);
    test:assertEquals(messageConverted, TEST_MESSAGE);
    check consumer->close();
}
