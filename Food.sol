pragma solidity ^0.8.24;
import "./Ingredient.sol";

// item object could be used to require basic facts like container volume and number of containers
// could just use storage

// Bottle will have label, the label will verify ingredients in a trust network, preperation in a manufacture network
contract Bottle {
  //string public label = "Pepsi";
  string public label = "Redbull";
  Food public food;
  function _food (address food_) {
    food = Food(food_);
  }
}

// Burnable instead of food or food extends burnable?
contract Food {
  string public name;
  string[] recipe;
  mapping(string => int) amounts;
  uint caloric;
  // we might provide recipe and amounts as a map, but it makes mass difficult in order/execution environment
  constructor (string memory _name, string[] memory _recipe, int[] memory _amounts,  uint _caloric) {
    name = _name;
    recipe = _recipe;
    caloric = _caloric;
    for (uint i = 0; i < recipe.length; i++) {
      amounts[_recipe[i]] = _amounts[i];
    }
  }
  function prepare (address[] memory materials) public returns (uint) {
    for (uint i = 0; i < recipe.length; i++) {
      Ingredient ingredient = Ingredient(materials[i]);
      require(ingredient.name == recipe[i], "colloquial");
      ingredient.use(amounts[recipe[i]]);
    }   
  }

  function consume (uint burn) returns (uint caloric) {
    require(caloric - burn >= 0);
    caloric = caloric - burn;
    return caloric;
  }

}

