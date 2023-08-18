// SPDX-License-Identifier: MIT

pragma solidity =0.8.20;

contract StorageSlot{
    struct Slot {
        uint128 slot_1;
        uint128 slot_2;
    }

    uint128 slot0_1;
    uint96 slot0_2;
    uint slot1;
    uint slot2;
    Slot slot3;
    Slot slot4;
    uint256 slot5;
    uint128 slot6;
    Slot slot7;
    Slot slot8;
    Slot slot9;
    struct Slot10 {
        uint slot_1;
        uint slot_2;
    }
    Slot10 slot10;

    constructor() {
        slot10.slot_1 = 7;
        slot10.slot_2 = 8;
    }


    function packed() external {
        slot0_1 = 7;
        slot0_2 = 7; 
    } 
    //  23856  ·      43756  ·      33806

    function unpacked() external {
        slot1 = 7;
        slot2 = 7;
    } 
    //  25680  ·      65480  ·      4558

    function structPackedV1() external {
        slot3.slot_1 = 7;
        slot3.slot_2 = 7;
    } 
    //  23800  ·      43700  ·      33750

    function structPackedV2() external {
        Slot storage _slot4 = slot4;
        _slot4.slot_1 = 7;
        _slot4.slot_2 = 7;
    } 
    // 23813  ·      43713  ·      3376

    function full() external {
        slot5 = 7;
    } 
    // 23510  ·      43410  ·      33460

    function half() external {
        slot6 = 7;
    } 
    // 23561  ·      43461  ·      33511
    

    function testCase1() external {
        Slot memory _slot7 = slot7;
        uint a = _slot7.slot_1;
        uint b = _slot7.slot_2;
        slot7.slot_1 = 7; 
        slot7.slot_2 = 7;
    } 
    //  24306  ·      44206  ·      34256 

    function testCase2() external {
        Slot storage _slot8 = slot8;
        uint a = _slot8.slot_1;
        uint b = _slot8.slot_2;
        slot8.slot_1 = 7;
        slot8.slot_2 = 7;
    } 
    //  24223  ·      44123  ·      34173 

    function testCase3() external {
        uint a = slot9.slot_1;
        uint b = slot9.slot_2;
        slot9.slot_1 = 7;
        slot9.slot_2 = 7;
    } 
    // 24233  ·      44133  ·      34183 

    function structSlot() external view returns(bytes32 ret1, bytes32 ret2) {
        assembly {
            let slotNum1 := slot9.slot
            ret1 := sload(slotNum1)
            ret2 := sload(add(slotNum1, 1))
        }
    }
}