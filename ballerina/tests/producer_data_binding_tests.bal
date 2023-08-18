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


public type IntProducerRecord record {|
    *AnydataProducerRecord;
    int key?;
    int value;
|};

public type FloatProducerRecord record {|
    *AnydataProducerRecord;
    float value;
    float key?;
|};

public type DecimalProducerRecord record {|
    *AnydataProducerRecord;
    decimal key?;
    decimal value;
|};

public type BooleanProducerRecord record {|
    *AnydataProducerRecord;
    boolean key?;
    boolean value;
|};

public type StringProducerRecord record {|
    *AnydataProducerRecord;
    string key?;
    string value;
|};

public type PersonProducerRecord record {|
    *AnydataProducerRecord;
    string key?;
    Person value;
|};

public type MapProducerRecord record {|
    *AnydataProducerRecord;
    map<Person> value;
    string key?;
|};

public type XmlProducerRecord record {|
    *AnydataProducerRecord;
    string key?;
    xml value;
|};

public type TableProducerRecord record {|
    *AnydataProducerRecord;
    string key?;
    table<Person> value;
|};

public type JsonProducerRecord record {|
    *AnydataProducerRecord;
    string key?;
    json value;
|};
