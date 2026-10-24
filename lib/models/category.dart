enum Category {
  food('Food', '🍔', 0xFFE57373),
  transport('Transport', '🚕', 0xFF64B5F6),
  bills('Bills', '💡', 0xFFFFB74D),
  shopping('Shopping', '🛍️', 0xFFBA68C8),
  health('Health', '💊', 0xFF4DB6AC),
  other('Other', '📦', 0xFF90A4AE);

  const Category(this.label, this.emoji, this.colorValue);

  final String label;
  final String emoji;
  final int colorValue; // ARGB, converted to Color in the UI

  // Parses a stored name, falling back to [other].
  static Category fromName(String? name) =>
      Category.values.asNameMap()[name] ?? Category.other;
}
