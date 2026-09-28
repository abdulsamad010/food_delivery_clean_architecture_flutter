
import '../entities/food.dart';
import '../repositories/food_repository.dart';

class GetFoods {
  final FoodRepository repository;

  GetFoods(this.repository);

  List<Food> call() {
    return repository.getFood();
  }
}