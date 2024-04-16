pragma solidity ^0.8.24
import "World.sol";

contract Location {
  int public xx;
  int public yy;
  int public zz;
  int public dxx;
  int public dyy;
  int public dzz; 
  mapping(address => address) moves;
  bool private locked = true;
  constructor (int x, int y, int z, int dx, int dy, int dz) {
    xx = x; 
    yy = y;
    zz = z;
    dxx = dx;
    dyy = dy;
    dzz = dz;
  }
  function unlock () {
    require(World.access(msg.sender), "raid,rate,rain"); // world can break or impose ownership to other objects or addresses
    locked = !locked;
  }
  function use(int time, int timer, uint deadline, bool dead) public returns (bool) {
  }
  function move(address location) public returns (bool) {
     
  }
}
