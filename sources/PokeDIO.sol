// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDIO is ERC721 {

    struct Pokemon {
        string name;
        uint   level;
        string img;
    }

    Pokemon[] public pokemons;
    address public gameOwner;

    constructor () ERC721 ("PokeDIO", "PKD") {
        gameOwner = msg.sender;
    } 

    modifier onlyOwnerOf(uint _monsterId) {
        require(_monsterId < pokemons.length, unicode"O Pokemon não existe");
        require(ownerOf(_monsterId) == msg.sender, unicode"Apenas o dono pode batalhar com este Pokemon");
        _;
    }

        function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
        require(_defendingPokemon < pokemons.length, unicode"O Pokemon defensor não existe");
        require(_attackingPokemon < _defendingPokemon, unicode"O Pokemon atacante deve ser diferente do pokemon defensor");

        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

         if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level++;
        } else {
            attacker.level++;
            defender.level += 2;
        }
    }

    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, unicode"Apenas o dono do jogo pode criar novos Pokemons");

        pokemons.push(Pokemon(_name, 1, _img));
        _safeMint(_to, pokemons.length);
    }
}
