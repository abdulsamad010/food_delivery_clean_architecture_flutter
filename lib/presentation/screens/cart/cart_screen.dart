import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';
import 'package:week8_task/presentation/screens/edit_address/edit_address_screen.dart';
import 'package:week8_task/presentation/screens/payment/payment_screen.dart';

import '../../bloc/app_bloc.dart';
import '../../bloc/app_event.dart';
import '../../theme/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {




  @override
  Widget build(BuildContext context) {



    print("hi : ${context.read<AppBloc>().state.cart}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor:black,
        leading: Padding(
          padding:EdgeInsets.all(8.w),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(

              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightGrey
              ),

              child: Center(child: Icon(Icons.arrow_back_ios,size: 14.sp,)),
            ),
          ),
        ),

        title: Text("Cart",style: TextStyle(
            color: black,
            fontSize: 18
        ),),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Text("EDIT ITEMS",style: TextStyle(
                color: orange,
                decoration: TextDecoration.underline,
                decorationColor: orange,
                fontSize: 15
            ),),
          ),
        ],
      ),

      backgroundColor: black,

      body: BlocBuilder<AppBloc,AppState>(
        builder:(context,state){




          return Padding(
          padding: EdgeInsets.fromLTRB(16.w,16.w,16.w,0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(

                  itemCount: state.cart.length,
                  itemBuilder: (context,index) {





                    int foodIdIndex=0;
                    for(int i=0;i<state.foods.length;i++){
                      if(state.foods[i].id==state.cart[index]["id"]){
                        foodIdIndex=i;
                        break;
                      }
                    }

                    return Padding(
                      padding:EdgeInsets.only(bottom: 32.h),
                      child: Row(
                        children: [

                          Container(

                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: darkBlue
                            ),

                            child: ClipOval(

                                child: Image.network("${state.foods[foodIdIndex].image}",fit: BoxFit.cover,width: 80.w,
                                  height: 100.h,

                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 100.w,
                                      height: 100.h,
                                      color: lightGrey,
                                      child: Icon(
                                        Icons.fastfood,
                                        size: 40,
                                        color: Colors.redAccent,
                                      ),
                                    );
                                  },

                                )),
                          ),

                          SizedBox(width: 8.w,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${state.foods[foodIdIndex].name}",style: TextStyle(
                                  color: grey,
                                  letterSpacing: 1,
                                  fontSize: 20
                              ),),

                              SizedBox(height: 8.h,),

                              Row(
                                children: [
                                  Icon(Icons.attach_money,color: white,),

                                  Transform.translate(
                                    offset: Offset(-6, 0),
                                    child: Text("${state.cart[index]["price"]}",style: TextStyle(
                                        color: white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ],
                              ),

                              SizedBox(height: 8.h,),

                              SizedBox(
                                height: 40.h,
                                width: MediaQuery.sizeOf(context).width/1.6,
                                child: Row(

                                  children: [

                                    Text("${state.foods[foodIdIndex].sizes[0]["name"]}",style: TextStyle(
                                        color: grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),),

                                    Expanded(child: SizedBox()),





                                    Container(

                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: darkBlue
                                      ),

                                      child: Transform.translate(
                                        offset: Offset(0, -7),
                                        child: GestureDetector(
                                                        onTap: (){
                                                        if(state.cart[index]["quantity"]>0) {

                                                          int newQuantity=state.cart[index]["quantity"];
                                                          newQuantity--;

                                                        context.read<AppBloc>().add(UpdateCart(
                                                        id: state.cart[index]["id"],
                                                        quantity: newQuantity,
                                                        price: state.cart[index]["price"]
                                                        ));
                                                        }
                                                        },
                                                        child: Icon(Icons.minimize,color: white,)),
                                      ),
                                    ),

                                                    SizedBox(width: 8.w,),

                                                    Text("${state.cart[index]["quantity"]}",style: TextStyle(color: white),),

                                                    SizedBox(width: 8.w,),
                                                    GestureDetector(
                                                    onTap: (){
                                                      int newQuantity=state.cart[index]["quantity"];
                                                      newQuantity++;

                                                      context.read<AppBloc>().add(UpdateCart(
                                                          id: state.cart[index]["id"],
                                                          quantity: newQuantity,
                                                          price: state.cart[index]["price"]
                                                      ));   },
                                                    child: Container(
                                                        padding: EdgeInsets.all(4.w),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: darkBlue
                                                        ),
                                                        child: Icon(Icons.add,color: white,))),

                                  ],

                                ),
                              )

                            ],
                          ),

                        ],
                      ),
                    );
                  }
                ),
              ),




              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r),topRight: Radius.circular(25.r))
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DELIVERY ADDRESS",style: TextStyle(
                            color: darkGrey,
                            fontSize: 15,
                        ),),


                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddressScreen()));
                          },
                          child: Text("EDIT",style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: orange,
                            color: orange,
                            fontSize: 13,
                          ),),
                        ),

                      ],
                    ),


                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: lightBlueGrey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("2118 Thornridge Cir. Syracuse",style: TextStyle(
                        color: darkGrey,
                        fontSize: 12,
                      ),),
                    ),

                    SizedBox(height: 16.h,),

                    Row(
                      children: [
                        Text("TOTAL:",style: TextStyle(
                          color: darkGrey,
                          fontSize: 12,
                        ),),


                        SizedBox(width: 4.w,),

                        Icon(Icons.attach_money,color: black,
                        fontWeight: FontWeight.bold,
                        ),

                        Text("${state.price}",style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),

                        Expanded(child: SizedBox()),


                        Text("Breakdown",style: TextStyle(
                          color: orange,
                          fontSize: 12,
                        ),),

                        Icon(Icons.arrow_forward_ios_outlined,size: 12,color: orange,),


                      ],
                    ),



                    SizedBox(height: 8.h,),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            if(state.price!=0) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Text("PLACE ORDER",style: TextStyle(color: white),)),
                    ),




                  ],

                ),

              )


            ],
          ),
                    ),




      );}
          ));
  }
}
