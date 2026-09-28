abstract class AppEvent{}

class GetFoodData extends AppEvent{}

class SelectCategory extends AppEvent{
  final index;
  SelectCategory(this.index);
}

class SelectRestaurant extends AppEvent{
  final index;
  SelectRestaurant(this.index);
}

class UpdateCart extends AppEvent{
  final int id;
  final quantity;
  UpdateCart({required this.id,required this.quantity});
}

class SelectPayment extends AppEvent{
  final index;
  SelectPayment(this.index);
}

class AddCard extends AppEvent{
  final name,num,exp,cvc;
AddCard({required this.name,required this.num,required this.exp,required this.cvc});
}

class UpdateChat extends AppEvent{
  final String name,mes,date;
  UpdateChat({required this.name,required this.mes,required this.date});
}