// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AirdropDistribution {
    
    error ADDRESS_ZERO_DETECTED();
    error ADDRESS_ALREADY_EXISTS();
    error AIRDROP_HAS_ENDED();
    error ACTION_HAS_ALREADY_BEEN_DONE();

    struct User {
        uint id;
        bool isRegistered;
        bool hasFollowed;
        bool hasLikedPost;
        uint points;
        bool hasReachedMinEntryPoint;
    }

    uint trackUserId;

    uint8 constant followPoints = 10;
    uint8 constant sharePoints = 10;
    uint8 constant likePoints = 10;
    uint constant entryPoint = 20;

    bool hasAirdropEnded = false;

    mapping(address => User) users;

    uint[] participantsId;

    constructor() {}

    function registerUser() external {
    
        if (hasAirdropEnded = true) {
            revert AIRDROP_HAS_ENDED();
        }
        if (msg.sender == address(0)) {
            revert ADDRESS_ZERO_DETECTED();
        }
        _userAlreadyExists();

        uint _userId = trackUserId + 1;
        User memory _user = User(_userId, false, false, false, 0, false);

        users[msg.sender] = _user;

        trackUserId = trackUserId + 1;
    }

    function likePost() external {
        _userAlreadyExists();

        if (users[msg.sender].hasLikedPost == true) {
            revert ACTION_HAS_ALREADY_BEEN_DONE();
        }
        users[msg.sender].hasLikedPost = true;
        users[msg.sender].points = users[msg.sender].points + likePoints;
        _trackUserPoints();
    }

    function follow() external {
        _userAlreadyExists();

        if (users[msg.sender].hasFollowed == true) {
            revert ACTION_HAS_ALREADY_BEEN_DONE();
        }
        users[msg.sender].hasFollowed = true;
        users[msg.sender].points = users[msg.sender].points + followPoints;
        _trackUserPoints();
    }

    function distributeRewards() private {
        
        if (participantsId.length == 10) {
            
            hasAirdropEnded = true;
        }
    }

    function _userAlreadyExists() private view {
        if (users[msg.sender].isRegistered == true) {
            revert ADDRESS_ALREADY_EXISTS();
        }
    }

    function _trackUserPoints() private {
        if (users[msg.sender].hasReachedMinEntryPoint) {
            if (users[msg.sender].points >= entryPoint) {
                users[msg.sender].hasReachedMinEntryPoint = true;
                participantsId.push(users[msg.sender].id);
            }
        }
    }
}