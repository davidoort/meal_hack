class UserSettings {
  // Dietary restrictions
  static List<Restriction> restrictions = [];

  // Other
  static double budget = double.maxFinite;
  static double prepTime = double.maxFinite;

}

enum Restriction { vegetarian, vegan, nutAllergy, glutenFree, dairyFree }
