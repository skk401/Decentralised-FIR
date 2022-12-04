// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract FIR {

    uint256 totalCases;

    event NewWave(address indexed from, uint256 timestamp, string message);

    // struct CaseDetails {
    //     string district;
    //     string PS;
    //     string sectionsApplied;
    //     string nameApplicant;
    //     uint UID;
    //     string officerInc;
    //     string dateOfIncident;
    //     string desc;
    //     uint firTime;
        //other details of FIR
   // }

    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

     Wave[] waves;

         constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

   // mapping(uint => CaseDetails) Case;

    function Case(
        string memory _message
        // uint _caseno,
        // string memory _nameApplicant,
        // string memory _district,
        // string memory _desc,
        // string memory _officerInc,
        // uint _UID
    ) public {
        // Case[_caseno].nameApplicant = _nameApplicant;
        // Case[_caseno].officerInc = _officerInc;
        // Case[_caseno].district = _district;
        // Case[_caseno].desc = _desc;
        // Case[_caseno].UID = _UID;
        // Case[_caseno].firTime = block.timestamp;
        totalCases += 1;
        console.log("%s has registered a case with message %s.", msg.sender,_message);


        waves.push(Wave(msg.sender, _message, block.timestamp));


        emit NewWave(msg.sender, block.timestamp, _message);
    }


    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    // function GetCaseDetails(uint _caseno)
    //     public
    //     view
    //     returns (
    //         string memory,
    //         string memory,
    //         uint,
    //         string memory,
    //         string memory,
    //         uint,
    //         string memory
    //     )
    // {
    //     return (
    //         Case[_caseno].district,
    //         Case[_caseno].nameApplicant,
    //         Case[_caseno].firTime,
    //         Case[_caseno].desc,
    //         Case[_caseno].officerInc,
    //         Case[_caseno].UID,
    //         Case[_caseno].district
    //     );
    // }
function getTotalCases() public view returns (uint256) {
        console.log("We have %d total cases!", totalCases);
        return totalCases;
    }


}
