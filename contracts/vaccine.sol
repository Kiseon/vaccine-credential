// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Vaccine {
    struct Credential {
        uint256 id;
        address issuer;
        VaccineType vaccineType;
        uint256 createDate;
        bool status;
    }

    // address public owner;

    constructor() {
        // owner = msg.sender;
    }

    mapping(address => Credential) private credentials;
    //Credential private _credential;

    uint256 internal idCount = 0;
    enum VaccineType {PF, MD, AZ}

    function claimCredential(address  _addr, VaccineType _vaccineType) public returns(bool) {        
        require(credentials[_addr].status == false, "Already Registered" );

        credentials[_addr].id = idCount;
        credentials[_addr].issuer = _addr;
        credentials[_addr].vaccineType = _vaccineType;
        credentials[_addr].createDate = block.timestamp;
        credentials[_addr].status = true;

        idCount += 1;

        return true;
    }

    function isCredential(address  _addr) public view returns(bool) {
        // require(owner == msg.sender, "No Permission to Check Credentials");

        if (credentials[_addr].status == true) return true;

        return false;
    }

    function getVaccineType(address  _addr) public view returns(VaccineType) {
        // require(owner == msg.sender, "No Permission to Check Vaccine Type");

        return credentials[_addr].vaccineType;
    }
}