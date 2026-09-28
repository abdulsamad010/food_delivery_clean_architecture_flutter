import 'package:week8_task/data/datasources/food_data.dart';
import 'package:week8_task/data/models/food_model.dart';

import '../../domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository{

  List<FoodModel> getFood(){

    List<FoodModel> allFood=[];

    for(var food in foods){
      allFood.add(
        FoodModel(id: food["id"], name: food["name"], restaurantId: food["restaurantId"], restaurant: food["restaurant"], category: food["category"], price: food["price"], rating: food["rating"], reviews: food["reviews"], deliveryFee: food["deliveryFee"], deliveryTime: food["deliveryTime"], image: food["image"], description: food["description"], ingredients: food["ingredients"], sizes: food["sizes"])
      );
    }

    return allFood;
  }

}