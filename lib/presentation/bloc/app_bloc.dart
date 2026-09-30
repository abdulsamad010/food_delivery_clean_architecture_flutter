import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8_task/data/datasources/food_data.dart';
import 'package:week8_task/data/repositories/food_repository_impl.dart';
import 'package:week8_task/domain/entities/food.dart';
import 'package:week8_task/domain/repositories/food_repository.dart';
import 'package:week8_task/domain/usecases/get_foods.dart';
import 'package:week8_task/presentation/bloc/app_event.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';

import '../theme/app_colors.dart';


class AppBloc extends Bloc<AppEvent,AppState>{

  AppBloc():super(AppState(
    cards: [],
      selectPaymentIndex: 0,
      price: 0,cart: [],appCategories: [
    {
      "id": 1,
      "name": "All",
      "icon":
      "https://images.unsplash.com/photo-1547592180-85f173990554?w=200",
      "color": lightOrange,
    },
    {
      "id": 2,
      "name": "Burger",
      "icon":
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200",
      "color": white,
    },
    {
      "id": 3,
      "name": "Pizza",
      "icon":
      "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=200",
      "color": white,
    },
    {
      "id": 4,
      "name": "Breakfast",
      "icon":
      "https://images.unsplash.com/photo-1563379091339-03246963d51a?w=200",
      "color": white,
    },
    {
      "id": 5,
      "name": "Pasta",
      "icon":
      "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=200",
      "color": white,
    },
    {
      "id": 6,
      "name": "Lunch",
      "icon":
      "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=200",
      "color": white,
    },
  ],appCategoryFoods: [],paymentOptions: [
    {
      "name":"Cash",
      "borderColor":orange,
      "icon":"assets/icons/Cash.svg"
    },
    {
      "name":"Visa",
      "borderColor":lightBlueGrey,
      "icon":"assets/icons/Group.svg"
    },
    {
      "name":"MasterCard",
      "borderColor":lightBlueGrey,
      "icon":"assets/icons/Group 2361.svg"
    },
    {
      "name":"PayPal",
      "borderColor":lightBlueGrey,
      "icon":"assets/icons/paypal-icon 1.svg"
    },
  ])){

    on<GetFoodData>((event,emit){

      FoodRepository fR=FoodRepositoryImpl();
      final GetFoods f=GetFoods(fR);

      List<Food> foods1=f.call();

      emit(
        AppState(
          cards: state.cards,
          selectPaymentIndex: state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
          price: state.price,
        foods:foods1,
          appCategories: state.appCategories,
          appCategoryFoods:state.appCategoryFoods,
          cart: state.cart
                ));
    });


    on<SelectCategory>((event, emit) {

      List appCategoryFoods1=[];

      List<Map<String, dynamic>> appCategories1 =
      List<Map<String, dynamic>>.from(state.appCategories);

      for (int i = 0; i < appCategories1.length; i++) {

        if (i == event.index) {
          appCategories1[i]["color"] = lightOrange;

        } else {
          appCategories1[i]["color"] = white;
        }
      }


      if(appCategories1[event.index]["name"]=="All"){
        appCategoryFoods1=List.from(state.foods);
      }
      else {
        for (int i = 0; i < foods.length; i++) {
          if (state.foods[i].category == appCategories1[event.index]["name"]) {
            appCategoryFoods1.add(state.foods[i]);
          }
        }
      }


      emit(
        AppState(
            cards: state.cards,
          selectPaymentIndex: state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
          price: state.price,
          foods: state.foods,
          appCategories: appCategories1,
          appCategoryFoods:appCategoryFoods1,
          cart: state.cart
        ),
      );
    });



    on<UpdateCart>((event,emit){

      List<Map<String,dynamic>> cart1=List.from(state.cart);
      bool isContain=false;

      for(int i=0; i<state.cart.length;i++) {
        if(cart1[i]["id"]==event.id) {
          cart1[i]["quantity"]=event.quantity;
          cart1[i]["price"]=event.price;
          isContain=true;
        }
      }

      if(isContain==false){
        cart1.add({
          "id": event.id,
          "quantity": event.quantity,
          "price":event.price,
        });
      }



      double price1 = 0;

      for (int i = 0; i < cart1.length; i++) {
        for (int j = 0; j < state.foods.length; j++) {
          if (state.foods[j].id == cart1[i]["id"]) {
            price1 += cart1[i]["price"] * cart1[i]["quantity"];
          }
        }
      }


      emit(
          AppState(
            size: state.size,
              cards: state.cards,
            selectPaymentIndex: state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
            price: price1,
              foods:state.foods,
              appCategories: state.appCategories,
              appCategoryFoods:state.appCategoryFoods,
              cart: cart1
          ));
    });






    on<SelectRestaurant>((event, emit) {
      List appCategoryFoods1 = [];

      List<Map<String, dynamic>> appCategories1 =
      List<Map<String, dynamic>>.from(state.appCategories);

      for (int i = 0; i < state.foods.length; i++) {
        if (state.restaurants[event.index]["id"] == state.foods[i].restaurantId && state.foods[i].category==state.restaurants[event.index]["categories"][event.sizeIndex]) {
          appCategoryFoods1.add(state.foods[i]);
        }
      }

      emit(
        AppState(
            cards: state.cards,
          selectPaymentIndex: state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
          price: state.price,
            foods: state.foods,
            appCategories: appCategories1,
            appCategoryFoods:appCategoryFoods1,
            cart: state.cart
        ),
      );
    });


    on<SelectSize>((event, emit) {
      final size1=event.index;
      emit(
        AppState(
          size: size1,
            cards: state.cards,
            selectPaymentIndex: state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
            price: state.price,
            foods: state.foods,
            appCategories: state.appCategories,
            appCategoryFoods:state.appCategoryFoods,
            cart: state.cart
        ),
      );
    });






    on<SelectPayment>((event, emit) {


      List paymentOptions1=List.from(state.paymentOptions);
      int selectPaymentIndex1=0;

      for (int i = 0; i < state.paymentOptions.length; i++) {

        if (i == event.index) {
          paymentOptions1[i]["borderColor"] = orange;
          selectPaymentIndex1=i;

        } else {
          paymentOptions1[i]["borderColor"] = lightBlueGrey;
        }
      }


      emit(
        AppState(
            cards: [],
            selectPaymentIndex:selectPaymentIndex1,
            paymentOptions: state.paymentOptions,
            price: state.price,
            foods: state.foods,
            appCategories: state.appCategories,
            appCategoryFoods:state.appCategoryFoods,
            cart: state.cart
        ),
      );
    });



    on<AddCard>((event, emit) {

      final List<Map<String,dynamic>> cards1=List.from(state.cards);

      cards1.removeRange(0, cards1.length);

      cards1.add({
        "selectedPaymentTypeIndex":state.selectPaymentIndex,
        "name":event.name,
        "number":event.num,
        "exp":event.exp,
        "cvc":event.cvc,
        "borderColor":lightBlueGrey
      });



      emit(
        AppState(
            cards: cards1,
            selectPaymentIndex:state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
            price: state.price,
            foods: state.foods,
            appCategories: state.appCategories,
            appCategoryFoods:state.appCategoryFoods,
            cart: state.cart
        ),
      );
    });




    on<UpdateChat>((event, emit) {

      final List<Map<String,dynamic>> chat1=List.from(state.chat);

      chat1.add(
        {
          "name":"${event.name}",
          "message":"${event.mes}",
          "time":"${event.date}"
        },
      );




      emit(
        AppState(
          chat: chat1,
            cards: state.cards,
            selectPaymentIndex:state.selectPaymentIndex,
            paymentOptions: state.paymentOptions,
            price: state.price,
            foods: state.foods,
            appCategories: state.appCategories,
            appCategoryFoods:state.appCategoryFoods,
            cart: state.cart
        ),
      );
    });







  }



}