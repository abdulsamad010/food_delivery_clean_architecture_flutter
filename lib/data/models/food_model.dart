import '../../domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel({
    required super.id,
    required super.name,
    required super.restaurantId,
    required super.restaurant,
    required super.category,
    required super.price,
    required super.rating,
    required super.reviews,
    required super.deliveryFee,
    required super.deliveryTime,
    required super.image,
    required super.description,
    required super.ingredients,
    required super.sizes,
  });
}