import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/data/datasources/food_data.dart';
import 'package:week8_task/presentation/screens/cart/cart_screen.dart';
import 'package:week8_task/presentation/screens/category_posts/category_posts_screen.dart';
import 'package:week8_task/presentation/screens/chat/chat_screen.dart';
import 'package:week8_task/presentation/screens/edit_address/edit_address_screen.dart';
import 'package:week8_task/presentation/screens/login/login_screen.dart';
import 'package:week8_task/presentation/screens/payment/payment_screen.dart';
import 'package:week8_task/presentation/screens/restaurant/restaurant_screen.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/widgets/input_field.dart';
import 'package:week8_task/presentation/widgets/restaurant_card.dart';

import '../../bloc/app_bloc.dart';
import '../../bloc/app_event.dart';
import '../../bloc/app_state.dart';
import '../notification/notification_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final con=TextEditingController();

  @override
  void initState() {

    super.initState();

    context.read<AppBloc>().add(GetFoodData());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              SizedBox(height: 32.h,),
          
              ClipOval(
                child: Image.asset("assets/images/img.png",height: 110.h,width: 90.w,fit: BoxFit.cover,),
              ),
          
              SizedBox(height: 16.h,),
          
              Text("Robert F",style: TextStyle(fontWeight: FontWeight.bold,
              color: black,
                fontSize: 18,
                letterSpacing: 1
              ),),
          
              Text("robertf@gmail.com",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkGrey,
                  fontSize: 13,
                  letterSpacing: 3
              ),),
          
          
              Divider(),
          
              SizedBox(height: 16.h,),
          
          
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: lightBlueGrey
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                        },
                        title: Text("Cart",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            fontSize: 13,
                            letterSpacing: 3
                        ),),
                        leading: SvgPicture.asset("assets/icons/Group 2730.svg"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                      ),
          
                      SizedBox(height: 16.h,),
          
          
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                        },
                        title: Text("Chat",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            fontSize: 13,
                            letterSpacing: 3
                        ),),
                        leading: SvgPicture.asset("assets/icons/Vector-1.svg"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                      ),
          
                      SizedBox(height: 16.h,),
          
          
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                        },
                        title: Text("Notifications",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            fontSize: 13,
                            letterSpacing: 3
                        ),),
                        leading: SvgPicture.asset("assets/icons/Group 2731.svg"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                      ),
          
                      SizedBox(height: 16.h,),
          
          
          
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                        },
                        title: Text("Payment Method",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            fontSize: 13,
                            letterSpacing: 3
                        ),),
                        leading: SvgPicture.asset("assets/icons/Group 2732.svg"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                      ),
          
                      SizedBox(height: 16.h,),
          
                    ],
                  ),
                ),
              ),

          
          
                Padding(
                      padding: EdgeInsets.only(bottom:16.w,left: 16.w,right: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: lightBlueGrey
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddressScreen()));
                              },
                              title: Text("Address",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: darkGrey,
                                  fontSize: 13,
                                  letterSpacing: 3
                              ),),
                              leading: SvgPicture.asset("assets/icons/map.svg"),
                              trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                            ),

                            SizedBox(height: 16.h,),



                            ListTile(
                              onTap: (){


                                showDialog(context: context, builder: (context){
                                  return AlertDialog(

                                    title: Text("FAQs",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: black,
                                        fontSize: 18,
                                        letterSpacing: 3
                                    ),),

                                    content: Text(
                                      '''
Some Frequently Asked Questions:

1. How can I place an order?
Browse the available restaurants and food items, select your preferred items, add them to your cart, and proceed to checkout.

2. Can I customize my food order?
Yes. You can select available options such as food size or other available choices before adding the item to your cart.

3. How can I change the quantity of an item?
Open your cart and use the + and − buttons to increase or decrease the quantity of an item.

4. Can I remove an item from my cart?
Yes. You can decrease the item's quantity or remove it from your cart before completing your order.

5. What payment methods are available?
You can select from the available payment methods during checkout, including saved cards when applicable.

6. Can I add a new payment card?
Yes. You can add a new card by selecting the Add Card option and entering the required card details.

7. How can I track my order?
After placing an order, you can use the order tracking feature to view the current status of your delivery.

8. How can I contact support?
You can use the chat or messaging feature available in the app to contact support.

9. Can I save my delivery address?
Yes. You can save and manage your delivery addresses for easier checkout.

10. What should I do if I have a problem with my order?
Please contact support through the app and provide your order details so the issue can be reviewed.
''',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        height: 1.3,
                                      ),
                                    ),

                                    actionsAlignment: MainAxisAlignment.center,

                                    actions: [

                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      },
                                        child: Text("OK",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: darkGrey,
                                            fontSize: 13,
                                            letterSpacing: 3
                                        ),),),

                                    ],

                                  );
                                });


                                    },
                              title: Text("FAQs",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: darkGrey,
                                  fontSize: 13,
                                  letterSpacing: 3
                              ),),
                              leading: SvgPicture.asset("assets/icons/Group 2733.svg"),
                              trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                            ),

                            SizedBox(height: 16.h,),

                          ],
                        ),
                      ),),

              Padding(
                padding: EdgeInsets.only(bottom:16.w,left: 16.w,right: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: lightBlueGrey
                  ),
                  child: ListTile(
                    onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(

                         title: Text("Are You Sure To Logout?",style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: darkGrey,
                             fontSize: 18,
                             letterSpacing: 3
                         ),),
                          
                          content: Icon(Icons.logout,color: Colors.red,size: 100,),

                          actionsAlignment: MainAxisAlignment.spaceBetween,

                          actions: [

                            ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            },
                              child: Text("No",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkGrey,
                                fontSize: 13,
                                letterSpacing: 3
                            ),),),

                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: orange,
                              ),
                              child: Text("Yes",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 13,
                                  letterSpacing: 3
                              ),),),

                          ],

                        );
                      });
                         },
                    title: Text("Logout",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkGrey,
                        fontSize: 13,
                        letterSpacing: 3
                    ),),
                    leading: Icon(Icons.logout,color: Colors.red,),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,color: darkGrey,size: 15.sp,),
                  ),
                ),)

              ],
            ),
            ),
      ),


      appBar: AppBar(
        backgroundColor: white,

        leading: Builder(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(8.w),
                child: GestureDetector(
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset("assets/icons/Menu (1).svg",)),
              );
            }
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0, 10),
              child: Text("Delivery To",style: TextStyle(
                  color: orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1
              ),),
            ),

            DropdownButton(
                underline: DropdownButtonHideUnderline(child: SizedBox()),
                items: [
              DropdownMenuItem(child:Text("Halal Lab office",style: TextStyle(
            color:darkGrey,
            fontWeight: FontWeight.bold,
              fontSize: 10,
            ),))
            ], onChanged: (i){

            }),

           // Expanded(child: SizedBox()),

          ],
        ),

        actionsPadding: EdgeInsets.all(8.w),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            child: Stack(children:[
              SvgPicture.asset("assets/icons/Ellipse 1294.svg"),

              Padding(
                padding:  EdgeInsets.all(6.w),
                child: Center(child: Icon(Icons.card_travel_rounded,color: white,)),
              ),

              Transform.translate(
                offset: Offset(15, -3),
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              )
            ]),
          ),
        ],

      ),


      backgroundColor: white,

        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocBuilder<AppBloc,AppState>(
            builder:(context,state)=> SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text("Hey Halal,",style: TextStyle(
                        color: black,
                        fontSize: 14,
                        letterSpacing: 1.5
                    ),),


                    Text("Good Afternoon",style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1
                    ),),
                  ],
                ),

                SizedBox(height: 16.h,),

                Container(
                  padding: EdgeInsets.only(left: 16.w),
                  decoration: BoxDecoration(
                    color: lightBlueGrey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:Row(
                    children: [

                      Icon(Icons.search,color:grey,),

                      SizedBox(width: 8.w,),

                      SizedBox(
                          width: MediaQuery.sizeOf(context).width/1.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: TextField(
                              textInputAction: TextInputAction.done,
                              controller: con,
                                onSubmitted:(val){

                                int index=-1;
                                if (con.text == "All") {
                                  index = 0;
                                } else if (con.text == "Burger") {
                                  index = 1;
                                } else if (con.text == "Pizza") {
                                  index = 2;
                                } else if (con.text == "Breakfast") {
                                  index = 3;
                                } else if (con.text == "Pasta") {
                                  index = 4;
                                } else if (con.text == "Lunch") {
                                  index = 5;
                                }

                                  context.read<AppBloc>().add(SelectCategory(index));
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetailsScreen(category: state.appCategories[index]["name"],)));

                                },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightBlueGrey,
                                  border: InputBorder.none,
                                  hint: Padding(
                                    padding:EdgeInsets.all(8.w),
                                    child: Text("write something",style: TextStyle(color: darkGrey),),
                                  )
                              ),
                            ),
                          ),

                      )],
                  ),
                ),

                SizedBox(height: 22.h,),

                Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Categories",style: TextStyle(
                        color: black,
                        fontSize: 20,
                        letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),),

                    IconButton(onPressed: (){
                      context.read<AppBloc>().add(SelectCategory(0));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetailsScreen(category: state.appCategories[0]["name"],)));
                    }, icon: Row(
                      children: [
                        Text("See All",style: TextStyle(
                            color: black,
                            fontSize: 15,
                            letterSpacing: 1,
                          fontWeight: FontWeight.w500
                        ),),

                        SizedBox(width: 8.w,),

                        Icon(Icons.arrow_forward_ios,color: grey,size: 15.sp,)
                      ],
                    )),
                  ],
                ),



                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                      itemCount: state.appCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){

                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(

                            onTap: (){
                              context.read<AppBloc>().add(SelectCategory(index));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetailsScreen(category: state.appCategories[index]["name"],)));
                            },

                            child: Container(
                              padding: EdgeInsets.fromLTRB(16.w,8.w,16.w,8.w),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: lightGrey,spreadRadius: 2,blurRadius: 8,offset: Offset(5, 5))
                                ],
                                borderRadius: BorderRadiusGeometry.circular(35.r),
                                color: state.appCategories[index]["color"]
                              ),

                              child:Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipOval(
                                    child: Image.network("${state.appCategories[index]["icon"]}",height: 50.h,width: 50.h,fit: BoxFit.cover,

                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: 50.w,
                                          height: 50.h,
                                          color: lightGrey,
                                          child: Icon(
                                            Icons.fastfood,
                                            size: 40,
                                            color: Colors.redAccent,
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  SizedBox(width: 12.w,),

                                  Text("${state.appCategories[index]["name"]}",style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        );

                  }),
                ),


                SizedBox(height: 4.h,),

                Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Open Restaurants",style: TextStyle(
                      color: black,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),),

                    IconButton(onPressed: (){

                    }, icon: Row(
                      children: [
                        Text("See All",style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(width: 8.w,),

                        Icon(Icons.arrow_forward_ios,color: grey,size: 15.sp)
                      ],
                    )),

                  ],
                ),


                SizedBox(height: 8.h,),




                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.restaurants.length,
                    itemBuilder: (context,index){

                      return Padding(
                        padding:EdgeInsets.only(bottom: 32.h),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantScreen(resId: index),));
                            },
                            child: RestaurantCard(res: state.restaurants[index])),
                      );

                    })

              ],
              ),
            ),
          ),
        ),

    );
  }
}
