pragma solidity ^0.8.24

contract World {
  address universe;
  string metaverse
  // chunking? 
  uint[] xl;
  uint[] yl;
  uint[] zl;
  mapping(uint => uint) xd;
  mapping(uint => uint) yd;
  mapping(uint => uint) zd;
  constructor (string memory verse) {
    universe = msg.sender;
    metaverse = verse;
  }
  function location (uint x, uint y, uint z, uint dx, uint dy, uint dz) public returns (bool) {
    
    uint xx = x + dx;
    uint yy = y + dy;
    uint zz = z + dz;
    for (uint i = 0; i < xl.length; i++) {
      
    }
    uint xs;
    uint ys;
    uint zs;
    for (uint i = 0; i < xl.length; i++) {
      if (x > xl[i]) {
        xs = xl[i];
        xl[i] = x;
      }
      if (y > ys) {
        ys = yl[i];
        yl[i] = y
      }
      if (x > xs) {
        xs = xl[i];
        xl[i] = x
      }
    }
    xl.push(xs);
    yl.push(y);
    zl.push(z);
    xd[x] = xx;
    yd[y] = yy;
    zd[z] = zz;
    return
  }
}
