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
}