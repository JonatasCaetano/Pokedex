class Converter {
  static String convertPokemonTypeToPortugues({required String type}) {
    switch (type.toLowerCase()) {
      case 'normal':
        return 'Normal';
      case 'fire':
        return 'Fogo';
      case 'water':
        return 'Água';
      case 'grass':
        return 'Grama';
      case 'flying':
        return 'Voador';
      case 'fighting':
        return 'Lutador';
      case 'poison':
        return 'Veneno';
      case 'electric':
        return 'Elétrico';
      case 'ground':
        return 'Terra';
      case 'rock':
        return 'Pedra';
      case 'psychic':
        return 'Psíquico';
      case 'ice':
        return 'Gelo';
      case 'bug':
        return 'Inseto';
      case 'ghost':
        return 'Fantasma';
      case 'steel':
        return 'Ferro';
      case 'dragon':
        return 'Dragão';
      case 'dark':
        return 'Sombrio';
      case 'fairy':
        return 'Fada';
      default:
        return 'Desconhecido';
    }
  }

  static String convertPokemonTypeToEnglish({required String type}) {
    switch (type.toLowerCase()) {
      case 'normal':
        return 'normal';
      case 'fogo':
        return 'fire';
      case 'água':
        return 'water';
      case 'grama':
        return 'grass';
      case 'voador':
        return 'flying';
      case 'lutador':
        return 'fighting';
      case 'veneno':
        return 'poison';
      case 'elétrico':
        return 'electric';
      case 'terra':
        return 'ground';
      case 'pedra':
        return 'rock';
      case 'psíquico':
        return 'psychic';
      case 'gelo':
        return 'ice';
      case 'inseto':
        return 'bug';
      case 'fantasma':
        return 'ghost';
      case 'ferro':
        return 'steel';
      case 'dragão':
        return 'dragon';
      case 'sombrio':
        return 'dark';
      case 'fada':
        return 'fairy';
      default:
        return 'unknown';
    }
  }


  
}
