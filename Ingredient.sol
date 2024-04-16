pragma solidity ^0.8.24;
import "./Chemical.sol";
// for people who don't want to think about location, just have an infinite black hole in your pocket like its a videogame
import "./Location.sol";

contract Ingredient {
  string public name;
  Location private location;
  int public time;
  int public timer;
  uint private spoil; // could make this public so people can go compare the timestamps
  bool private spoiled;
  //mapping(string => bool) public chemicals; 
  bool public stable;
  //modifier - location access
  constructor (address _location,
    string memory _name,
    string[] memory _chemicals,
    address[] memory stash,
    int[] memory _amounts,
    int _timer, uint _spoil)
  {
    name = _name;
    timer = _timer;
    time = block.timestamp + timer; 
    spoil = _spoil;
    spoiled = spoil + block.timestamp > block.timestamp;
    require(_chemicals.length == _amounts.length, "mixture");
    for (uint i = 0; i < _chemicals.length; i++) {
      require(Chemical(_chemicals[i]).reaction(_chemicals[i], _amounts[i]), "reaction");
    }
  }
  function use () public returns (bool) {
    require(location.use(time, timer, spoil, spoiled), "HVAC");
  }
  function move () public returns (bool) {
    require(location.move(msg.sender), "lock");
    location = Location(msg.sender);
  }
}
