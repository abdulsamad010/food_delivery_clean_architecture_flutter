import '../../domain/entities/food.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';

class AppState {

  final List<Food> foods;
  final List<Map<String,dynamic>> restaurants;
  final List appCategoryFoods;
  final List<Map<String,dynamic>> cards;
  final List<Map<String,dynamic>> notifications;
  final price;
  final size;
  final List<Map<String,dynamic>> chat;
  final List<Map<String,dynamic>> appCategories;
  final List<Map<String,dynamic>> cart;
  final List<Map<String,dynamic>> paymentOptions;
  final selectPaymentIndex;
  AppState({
    this.size=0,
    this.notifications = const [
      {
        "id": 1,
        "name": "Tembir Ahmed",
        "message": "Placed an order",
        "time": "10 min ago",
        "image": "https://randomuser.me/api/portraits/men/1.jpg",
        "foodImage":
        "https://images.unsplash.com/photo-1563379091339-03246963d51a?w=200&q=40",
        "isRead": false,
      },
      {
        "id": 2,
        "name": "Sorin Smith",
        "message": "sent you a message",
        "time": "15 min ago",
        "image": "https://randomuser.me/api/portraits/women/2.jpg",
        "foodImage":
        "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=200&q=40",
        "isRead": false,
      },
      {
        "id": 3,
        "name": "Royal Bangl",
        "message": "agreed to your order",
        "time": "20 min ago",
        "image": "https://randomuser.me/api/portraits/men/3.jpg",
        "foodImage":
        "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=200&q=40",
        "isRead": true,
      },
      {
        "id": 4,
        "name": "Pabel Velov",
        "message": "placed a new order",
        "time": "30 min ago",
        "image": "https://randomuser.me/api/portraits/women/4.jpg",
        "foodImage":
        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200&q=40",
        "isRead": true,
      },
    ],

    this.chat = const [
      {
        "name": "Rober F",
        "message": "Are you coming?",
        "time": "8:10"
      },
      {
        "name": "Delivery Man",
        "message": "Hay, congratulation for order",
        "time": "8:11"
      },
      {
        "name": "Rober F",
        "message": "Hey where are you now?",
        "time": "8:11"
      },
      {
        "name": "Delivery Man",
        "message": "I am coming, just wait",
        "time": "8:12"
      },
      {
        "name": "Rober F",
        "message": "Hurry up, Man",
        "time": "8:12"
      },
    ],

    required this.cards,
    required this.selectPaymentIndex,
    required this.paymentOptions,
    required this.price,
    required this.cart,
    required this.appCategoryFoods,

    this.foods = const [],

    required this.appCategories,

    this.restaurants = const [
      {
        "id": 1,
        "name": "Uttora Coffee House",
        "rating": 4.7,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=70",
        "categories": ["Burger", "Chicken", "Rice", "Wings"],
        "description":
        "A cozy restaurant serving delicious burgers, chicken, rice, and wings with fresh ingredients.",
      },
      {
        "id": 2,
        "name": "Cafesio Restaurant",
        "rating": 4.6,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=500&q=70",
        "categories": ["Pizza", "Burger", "Pasta"],
        "description":
        "A welcoming restaurant offering flavorful pizzas, juicy burgers, and freshly prepared pasta.",
      },
      {
        "id": 3,
        "name": "Rose Garden Restaurant",
        "rating": 4.7,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=70",
        "categories": ["Burger", "Chicken", "Rice"],
        "description":
        "A family-friendly restaurant serving tasty burgers, chicken dishes, and flavorful rice meals.",
      },
      {
        "id": 4,
        "name": "Kjafis Film House",
        "rating": 4.8,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500&q=70",
        "categories": ["Burger", "Pizza"],
        "description":
        "A modern restaurant offering delicious burgers and freshly prepared pizzas in a comfortable setting.",
      },
      {
        "id": 5,
        "name": "Kenthary Kitchen",
        "rating": 4.9,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=500&q=70",
        "categories": ["Breakfast", "Chicken", "Rice"],
        "description":
        "A kitchen-style restaurant serving satisfying breakfast, chicken dishes, and flavorful rice meals.",
      },
      {
        "id": 6,
        "name": "Spicy Restaurant",
        "rating": 4.7,
        "delivery": "Free",
        "deliveryTime": "20 min",
        "image":
        "https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=500&q=70",
        "categories": ["Burger", "Sandwich", "Pizza"],
        "description":
        "A vibrant restaurant serving spicy and flavorful burgers, sandwiches, and pizzas.",
      },
    ],
  });
}