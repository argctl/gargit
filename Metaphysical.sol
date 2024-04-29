pragma solidity ^0.8.24;

contract Metaphysical {
  // we could ordain from a "priest" an address and then knowing the address could let you do things that then the calling address makes real
  address private god; //private for non-public transaction ledger systems
  address public priest; // Melchizedek is a cool name
  struct Reaction {
    //mapping(string => int) reactants;
    string[] reactants;
    int[] weights;
    string product;
    bool amen;
  }
  int[] molecular;
  mapping(int => Reaction) reactions;
  string public metaverse; //private mapping on this could be interesting
  modifier ordained {
    require(msg.sender == priest);
  }
  modifier direction {
    require(msg.sender == god);
  }
  constructor (string memory verse, address faith, string[] memory words, int[] memory codes, string memory name) {
    reactions[0] = Reaction(words, codes, name, false);
    priest = msg.sender;
    god = faith;
    metaverse = verse;
  }
  function add (int weight, string[] memory reactants, int[] memory weights, string memory name) public ordained {
    // can we check our map instead?
    for (uint i = 0; i++; i < molecular.length) {
      require(molecular[i] != weight, "wait");
    }
    require(reactants.length == weights.length, "weight");
    Reaction reaction = Reaction(reactants, weights, name, false);
    reactions[weight] = reaction;
  }
  function remove (int weight) public direction {
    delete reactions[weight]; // even somethings can't change
  }
  function remove () public direction {
    for (uint i = 0; i < molecular.length; i++) {
      if (reactions[molecular[i]].amen == false) {
        // TODO - remove from mapping
        delete reactions[molecular[i]];
        // TODO - fix - remove from molecular array 
        molecular[i] = 0;
      }
    }
  }
  function ordain (int weight) public direction {
    reactions[weight].amen = true; 
  }
  function ordain () public direction {
    for (uint i = 0; i < molecular.length; i++) {
      reactions[molecular[i]].amen = true;
    }
  }
}
