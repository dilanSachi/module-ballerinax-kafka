// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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


public type Person record {|
    readonly string name;
    int age;
    string address;
    boolean married;
|};

Person personRecord1 = {
    name: "Anne",
    age: 25,
    address: "Palm Grove",
    married: false
};

Person personRecord2 = {
    name: "Jane",
    address: "Unknown",
    age: 12,
    married: false
};

Person personRecord3 = {
    name: "John",
    address: "Col-10",
    age: 22,
    married: true
};

map<Person> personMap = {
    "P1": personRecord1,
    "P2": personRecord2,
    "P3": personRecord3
};

json jsonData = personMap.toJson();

int receivedIntValue = 0;
float receivedFloatValue = 0;
decimal receivedDecimalValue = 0;
boolean receivedBooleanValue = false;
string receivedStringValue = "";
xml receivedXmlValue = xml ``;
Person? receivedPersonValue = ();
map<Person> receivedMapValue = {};
table<Person> receivedTableValue = table [];
json receivedJsonValue = {};
int receivedIntPayload = 0;
float receivedFloatPayload = 0;
decimal receivedDecimalPayload = 0;
boolean receivedBooleanPayload = false;
string receivedStringPayload = "";
xml receivedXmlPayload = xml ``;
Person? receivedPersonPayload = ();
map<Person> receivedMapPayload = {};
table<Person> receivedTablePayload = table [];
json receivedJsonPayload = {};
json receivedPayloadConsumerRecordValue = {};
boolean errorReceived = false;
string errorMsg = "";
boolean isConsumerRecordReadonly = false;
boolean isPayloadReadonly = false;
anydata[] readOnlyPayloads = [];
int receivedSeekedValidRecordListenerCount = 0;
string recordCastErrorConsumerRecordError = "";
string recordCastErrorPayloadError = "";
boolean receivedAutoSeekError = false;
int receivedAutoSeekPayloadValue = 0;

public type IntConsumerRecord record {|
    int key?;
    int value;
    int timestamp;
    PartitionOffset offset;
|};

public type FloatConsumerRecord record {|
    *AnydataConsumerRecord;
    float key?;
    float value;
|};

public type DecimalConsumerRecord record {|
    *AnydataConsumerRecord;
    decimal value;
    decimal key?;
|};

public type BooleanConsumerRecord record {|
    *AnydataConsumerRecord;
    boolean key?;
    boolean value;
|};

public type StringConsumerRecord record {|
    *AnydataConsumerRecord;
    string key?;
    string value;
|};

public type PersonConsumerRecord record {|
    *AnydataConsumerRecord;
    Person value;
|};

public type MapConsumerRecord record {|
    *AnydataConsumerRecord;
    byte[] key?;
    map<Person> value;
|};

public type XmlConsumerRecord record {|
    *AnydataConsumerRecord;
    xml key?;
    xml value;
|};

public type TableConsumerRecord record {|
    string key?;
    table<Person> value;
    int timestamp;
    PartitionOffset offset;
|};

public type JsonConsumerRecord record {|
    PartitionOffset offset;
    json key?;
    int timestamp;
    json value;
|};

public type PayloadConsumerRecord record {|
    string key?;
    string value;
    int timestamp;
    record {|
        int offset;
        record {|
            string topic;
            int partition;
        |} partition;
    |} offset;
|};

PayloadConsumerRecord payloadConsumerRecord = {
    key: "test-key",
    offset: {
        offset: 12,
        partition: {
            topic: "test-topic",
            partition: 2
        }
    },
    timestamp: 124125124,
    value: "test-value"
};
