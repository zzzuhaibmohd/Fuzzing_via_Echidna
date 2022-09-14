pragma experimental ABIEncoderV2;

/*
isPwned checks for hash collisions, returns true if collision exists

echidna-test contracts/Dynamic.sol

Call sequence:                                                                                                       │               
1.isPwned("pwned","")    

*/

contract Dynamic {

    string s1;
    string s2;
    bool cond = false;

    function isPwned(string memory s1, string memory s2) public returns (bool) {
        //Missing check for empty strings
        //require(bytes(s1).length != 0 && bytes(s2).length != 0 );

        if (keccak256(abi.encodePacked(s1, s2)) == keccak256(abi.encodePacked("pwned"))) {
        cond = true;
        }
        return(false);
    }


    function echidna_test() public returns (bool) {
        return(!cond);
    }
}