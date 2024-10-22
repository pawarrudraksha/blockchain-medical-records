// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecords {
    struct Record {
        uint id;
        string patientName;
        string medicalData;
        address doctor;
        uint timestamp;
    }

    uint public recordCount = 0;
    mapping(uint => Record) public records;

    // Event to notify when a record is added
    event RecordAdded(
        uint id,
        string patientName,
        string medicalData,
        address doctor,
        uint timestamp
    );

    event ContractDeployed(string message);

    // Constructor for debugging
    constructor() {
        emit ContractDeployed("MedicalRecords contract deployed successfully");
    }

    // Function to add a new medical record
    function addRecord(string memory _patientName, string memory _medicalData) public {
        recordCount++;
        records[recordCount] = Record(recordCount, _patientName, _medicalData, msg.sender, block.timestamp);
        emit RecordAdded(recordCount, _patientName, _medicalData, msg.sender, block.timestamp);
    }

    // Function to retrieve a medical record by id
    function getRecord(uint _id) public view returns (uint, string memory, string memory, address, uint) {
        Record memory record = records[_id];
        return (record.id, record.patientName, record.medicalData, record.doctor, record.timestamp);
    }
}
