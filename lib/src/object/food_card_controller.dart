
import 'currency_food.dart';
import 'image_foods.dart';
class FoodCardController {
  FoodCardController({
    required this.foodName,
    required this.foodImage,
    required this.price,
    required this.currency,
  });

  final String foodName;
  final ImageFoods foodImage;
  final String price;
  final CurrencyFood currency;
}
