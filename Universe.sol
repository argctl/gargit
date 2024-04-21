pragma solidity ^0.8.24;

//elfs
contract Universe {
  uint time;
  int iteration;
  bytes seed;
  mapping(address => bytes) stamp; // competetive stamping between world and universe just makes two worlds or two universes?
  constructor (int t, bytes memory s) {
    time = t > 0 ? uint256(t) : 0;
    iteration = t;
    seed = s;
  } 
  function iterate (bool step) {
    if (step) require(iteration + time < block.timestamp);
    time = step ? time + iteration : block.timestamp - iteration; // without iteration subtracation we have a smaller universe
  }
}
