class UserSettings {
  const UserSettings({
    this.budget = 6,
    this.prepTime = 15,
    this.vegan = false,
    this.vegetarian = false,
    this.allergies,
  });

  final double budget; // CHF
  final double prepTime; // min
  final bool vegetarian;
  final bool vegan;
  final List<Allergy> allergies;
}

enum Allergy { nuts, gluten, lactose, milk, eggs }
