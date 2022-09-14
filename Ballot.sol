pragma experimental ABIEncoderV2;

/*
add_voter returns false if Voter is "voted" is set to "true".

echidna-test Ballot.sol
*/
contract Ballot {

  struct Voter { // Struct for Voter
    uint weight;
    bool voted; //default value is false
    address delegate;
    uint vote;
  }

  bool cond = true;
  
  function add_voter(Voter memory voter) public returns (bool) {
    if (voter.voted == true) {
      cond = false;
    }
    return(true);
  }

  // check for invariant if exists, where cond == false
  function echidna_test() public returns (bool) {
    return(cond);
  }
}