pragma solidity ^0.8.24;
import "./Ingredient.sol";

// item object could be used to require basic facts like container volume and number of containers
// could just use storage

contract Bottle {
  string public label = "Pepsi";
  Food public food;
  function _food (address food_) {
    food = Food(food_);
  }
}

contract Food {
  string public name;
   
  constructor (string memory _name, string[] memory recipe, address memory ingredients, int[] memory amounts,  uint caloric) {
     
  }
  function prepare (address[] memory materials) public returns (uint) {
     
  }

  function consume (

}

