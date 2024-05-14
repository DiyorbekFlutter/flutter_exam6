class ProductModel {
  // backandda snac caseda yozilgan ekan
  String name;
  num calories;
  num serving_size_g;
  num fat_total_g;
  num fat_saturated_g;
  num protein_g;
  num sodium_mg;
  num potassium_mg;
  num cholesterol_mg;
  num carbohydrates_total_g;
  num fiber_g;
  num sugar_g;

  ProductModel({
    required this.name,
    required this.calories,
    required this.serving_size_g,
    required this.fat_total_g,
    required this.fat_saturated_g,
    required this.protein_g,
    required this.sodium_mg,
    required this.potassium_mg,
    required this.cholesterol_mg,
    required this.carbohydrates_total_g,
    required this.fiber_g,
    required this.sugar_g,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json['name'] as String,
    calories: json['calories'] as num,
    serving_size_g: json['serving_size_g'] as num,
    fat_total_g: json['fat_total_g'] as num,
    fat_saturated_g: json['fat_saturated_g'] as num,
    protein_g: json['protein_g'] as num,
    sodium_mg: json['sodium_mg'] as num,
    potassium_mg: json['potassium_mg'] as num,
    cholesterol_mg: json['cholesterol_mg'] as num,
    carbohydrates_total_g: json['carbohydrates_total_g'] as num,
    fiber_g: json['fiber_g'] as num,
    sugar_g: json['sugar_g'] as num,
  );

  Map<String, dynamic> get toJson => {
    "name": name,
    "calories": calories,
    "serving_size_g": serving_size_g,
    "fat_total_g": fat_total_g,
    "fat_saturated_g": fat_saturated_g,
    "protein_g": protein_g,
    "sodium_mg": sodium_mg,
    "potassium_mg": potassium_mg,
    "cholesterol_mg": cholesterol_mg,
    "carbohydrates_total_g": carbohydrates_total_g,
    "fiber_g": fiber_g,
    "sugar_g": sugar_g
  };
}
