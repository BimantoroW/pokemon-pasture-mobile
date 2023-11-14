class Pokemon {
  String name;
  int amount;
  String description;
  static List<Pokemon> pokemons = [];

  Pokemon(this.name, this.amount, this.description) {
    Pokemon.pokemons.add(this);
  }   
}
