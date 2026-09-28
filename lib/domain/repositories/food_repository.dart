import '../../data/models/food_model.dart';

abstract class FoodRepository {
  List<FoodModel> getFood();
}