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

import ballerina/lang.runtime as runtime;
import ballerina/test;
import ballerina/log;

string messagesReceivedInOrder = "";
string receivedGracefulStopMessage = "";
string receivedImmediateStopMessage = "";
string saslMsg = "";
string saslIncorrectCredentialsMsg = "";
string sslMsg = "";
string detachMsg1 = "";
string detachMsg2 = "";
string incorrectEndpointMsg = "";
string receivedTimeoutConfigValue = "";

int receivedMsgCount = 0;

@test:Config {enable: true}
function consumerServiceTest() returns error? {
    string topic = "service-test-topic";
    kafkaTopics.push(topic);
    check sendMessage(TEST_MESSAGE.toBytes(), topic);
    ConsumerConfiguration consumerConfiguration = {
        topics: [topic],
        offsetReset: OFFSET_RESET_EARLIEST,
        groupId: "listener-test-group",
        clientId: "test-listener-01"
    };
    Listener consumer = check new (DEFAULT_URL, consumerConfiguration);
    check consumer.attach(consumerService);
    check consumer.'start();

    runtime:sleep(3);
    test:assertEquals(receivedMessage, TEST_MESSAGE);
    check consumer.gracefulStop();
}
Service consumerService =
service object {
    remote function onConsumerRecord(ConsumerRecord[] records) returns error? {
        foreach var kafkaRecord in records {
            byte[] value = kafkaRecord.value;
            string message = check 'string:fromBytes(value);
            log:printInfo("Message received: " + message);
            receivedMessage = message;
        }
    }
};