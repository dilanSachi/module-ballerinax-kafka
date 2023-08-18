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

import ballerina/constraint;

public type StringConstraintConsumerRecord record {|
    *AnydataConsumerRecord;
    @constraint:String {
        maxLength: 10
    }
    string key?;
    @constraint:String {
        minLength: 10
    }
    string value;
|};

public type IntConstraintConsumerRecord record {|
    int key?;
    @constraint:Int {
        maxValue: 100,
        minValue: 10
    }
    int value;
    int timestamp;
    PartitionOffset offset;
|};

@constraint:Float {
    maxValue: 100,
    minValue: 10
}
public type Price float;

@constraint:Number {
    maxValue: 100,
    minValue: 10
}
public type Weight decimal;

@constraint:Array {
    minLength: 2,
    maxLength: 5
}
public type NameList int[];

public type Child record {|
    @constraint:String {
        maxLength: 25
    }
    string name;
    @constraint:Int {
        maxValue: 100,
        minValue: 10
    }
    int age;
|};

const validationErrorMessage = "Failed to validate payload. If needed, please seek past the record to continue consumption.";

string receivedIntMaxValueConstraintError = "";
string receivedIntMinValueConstraintError = "";
string receivedNumberMaxValueConstraintError = "";
string receivedNumberMinValueConstraintError = "";
int receivedValidRecordCount = 0;
int receivedSeekedValidRecordCount = 0;
