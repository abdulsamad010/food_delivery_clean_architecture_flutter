class Food {
  final int id;
  final String name;
  final int restaurantId;
  final String restaurant;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final double deliveryFee;
  final String deliveryTime;
  final String image;
  final String description;
  final List<String> ingredients;
  final List<Map<String, dynamic>> sizes;

  Food({
    required this.id,
    required this.name,
    required this.restaurantId,
    required this.restaurant,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.image,
    required this.description,
    required this.ingredients,
    required this.sizes,
  });
}