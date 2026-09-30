import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_event.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/screens/cart/cart_screen.dart';
import '../../bloc/app_bloc.dart';
import '../../theme/app_colors.dart';
import '../category_post_details/category_posts_details_screen.dart';

class RestaurantScreen extends StatefulWidget {
  int resId;
  RestaurantScreen({super.key,required this.resId});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  void initState() {
    super.initState();

    context.read<AppBloc>().add(SelectRestaurant(index: widget.resId,sizeIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
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

        title: Text("Restaurant View",style: TextStyle(
            color: black,
            fontSize: 18
        ),),



        actions: [

          Padding(
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

                child: Center(child: SvgPicture.asset("assets/icons/More.svg")),
              ),
            ),
          ),


        ],


      ),

      body: BlocBuilder<AppBloc,AppState>(
        builder: (context,state)=>Padding(padding: EdgeInsets.only(left:16.w,right: 16.w,top: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
          
              ClipRRect(
                  borderRadius: BorderRadius.circular(45.r),
                  child: Image.network("${state.restaurants[widget.resId]["image"]}",width: double.infinity,fit: BoxFit.cover,
                  height: 350.h,

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 350.h,
                        color: lightGrey,
                        child: Icon(
                          Icons.store,
                          size: 40,
                          color: Colors.green,
                        ),
                      );
                    },
                  )),

              SizedBox(height: 16.h,),

              Text("${state.restaurants[widget.resId]["name"]}",style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),),

              SizedBox(height: 4.h,),

              Text("${state.restaurants[widget.resId]["description"]}",style: TextStyle(
                  color:grey,
                  fontSize: 18,
                letterSpacing: 1
              ),),

              SizedBox(height: 16.h,),



              Row(
                mainAxisSize: MainAxisSize.max,

                children: [

                  Icon(Icons.star_border,color: orange,size: 25.sp,),
                  Text("${state.restaurants[widget.resId]["rating"]}",style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                  Expanded(child: SizedBox()),

                  Icon(Icons.delivery_dining,color: orange,size: 25,),
                  Text("${state.restaurants[widget.resId]["delivery"] == 0.0 ? "Free" : state.restaurants[widget.resId]["delivery"]}",style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                  Expanded(child: SizedBox()),

                  Icon(Icons.watch_later_outlined,color: orange,size: 25,),
                  Text("${state.restaurants[widget.resId]["deliveryTime"]}",style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                ],
              ),

              SizedBox(height: 16,),

              SizedBox(
                height: 60.h,
                width: double.infinity,
                child:
                    Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                              itemCount: state.restaurants[widget.resId]["categories"].length,
                              itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: GestureDetector(
                                  onTap: (){
                                    context.read<AppBloc>().add(SelectRestaurant(index: widget.resId, sizeIndex: index));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(16.w,8.w,16.w,8.w),
                                    decoration: BoxDecoration(
                                      color:  state.restaurants[widget.resId]["categories"][index] !=state.appCategoryFoods[0].category ? white :orange,
                                      border: Border.all(color: grey),
                                      borderRadius: BorderRadius.circular(45)
                                    ),

                                    child:Center(
                                      child: Text("${state.restaurants[widget.resId]["categories"][index]}",style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold,
                                      color: black,
                                      ),),
                                    ),
                                  ),
                                ),
                              );
                          }),
                        ),
                      ],
                    )


              ),
              
              SizedBox(height: 12.h,),



              Padding(
                padding: EdgeInsets.all(16.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Burgers",style: TextStyle(
                        color: black,
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),),


                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.appCategoryFoods.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 25
                          ), itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder:(context)=>CategoryPostsDetailsScreen(index:index)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: grey,spreadRadius: -10,blurRadius: 20,offset: Offset(10, 15))
                                ],
                                borderRadius: BorderRadiusGeometry.circular(18.r),
                                color: white
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [


                                Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadiusGeometry.circular(15.r),
                                      child: Image.network("${state.appCategoryFoods[index].image}",height: 250.h,width: double.infinity,fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            height: 250.h,width: double.infinity,
                                            color: lightGrey,
                                            child: Icon(
                                              Icons.fastfood,
                                              size: 40,
                                              color: Colors.red,
                                            ),
                                          );
                                        },
                                      )),
                                ),

                                SizedBox(height: 8.w,),

                                Text("${state.appCategoryFoods[index].name}",style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),),

                                SizedBox(height: 4.w,),

                                Text("${state.appCategoryFoods[index].restaurant}",style: TextStyle(
                                    color: darkGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11
                                ),),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Row(
                                      children: [
                                        Icon(Icons.attach_money_sharp,size: 12.sp,color: black,fontWeight: FontWeight.bold,),

                                        Transform.translate(
                                          offset: Offset(-5, 0),
                                          child: Text("${state.appCategoryFoods[index].price}",style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15
                                          ),),
                                        ),
                                      ],
                                    ),


                                    Icon(Icons.add_circle_rounded,color: orange,size: 20.sp,)


                                  ],
                                )


                              ],
                            ),
                          ));
                      })

                    ],
                  ),
                ),
              ),



          ]),
        ),
        ),
      ),

      backgroundColor: white,
    );
  }
}
