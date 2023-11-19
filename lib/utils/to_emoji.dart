extension EmojiWeather on String {
  String get tdaadEmoji {
    switch (this) {
      case '(MainEnum.Clear)':
        return 'assets/images/sunny.png';
      case '(MainEnum.Rain)':
        return 'assets/images/rain.png';
      case '(MainEnum.Clouds)':
        return 'assets/images/cloudy.png';
      case '(MainEnum.Wind)':
        return 'assets/images/windy.png';
      default:
        return '?';
    }
  }
}
