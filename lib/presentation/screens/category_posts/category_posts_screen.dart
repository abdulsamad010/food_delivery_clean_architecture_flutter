import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/data/datasources/food_data.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';
import 'package:week8_task/presentation/screens/category_post_details/category_posts_details_screen.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/app_bloc.dart';
import '../../bloc/app_event.dart';


class CategoryDetailsScreen extends StatefulWidget {
  String category;
  CategoryDetailsScreen({super.key,required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(
      builder:(context,state)=> Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          leading: Padding(
            padding:EdgeInsets.only(top:4.w,left: 4.w),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                context.read<AppBloc>().add(SelectCategory(0));
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

          title: Material(
            color: white,
            borderRadius: BorderRadius.circular(35),
            child: InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: (){

              },

              child: Container(
                padding: EdgeInsets.only(left:8.w,right: 8.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: grey)
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    DropdownButton(

                      value: widget.category,

                      items: [
                        DropdownMenuItem(
                          value: "All",
                          child: Text("All"),
                        ),
                        DropdownMenuItem(
                          value: "Burger",
                          child: Text("Burger"),
                        ),
                        DropdownMenuItem(
                          value: "Pizza",
                          child: Text("Pizza"),
                        ),
                        DropdownMenuItem(
                          value: "Breakfast",
                          child: Text("Breakfast"),
                        ),
                        DropdownMenuItem(
                          value: "Pasta",
                          child: Text("Pasta"),
                        ),
                        DropdownMenuItem(
                          value: "Lunch",
                          child: Text("Lunch"),
                        ),
                      ],

                      onChanged: (i) {

                        int index = 0;

                        if (i == "All") {
                          index = 0;
                        } else if (i == "Burger") {
                          index = 1;
                        } else if (i == "Pizza") {
                          index = 2;
                        } else if (i == "Breakfast") {
                          index = 3;
                        } else if (i == "Pasta") {
                          index = 4;
                        } else if (i == "Lunch") {
                          index = 5;
                        }


                        if(i!=null) {
                          context.read<AppBloc>().add(SelectCategory(index));
                          widget.category = (i);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),

          actions: [
            Padding(padding: EdgeInsets.all(4.w),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.search,color: white,),
              ),

            ),

            /*Padding(padding: EdgeInsets.all(4.w),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: lightBlueGrey,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/Group 1757.svg"),
              ),

            )*/

          ],

        ),


        backgroundColor: white,

        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Popular ${widget.category}",style: TextStyle(
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
                  return state.appCategoryFoods[index].category==widget.category || widget.category=="All"?
                  GestureDetector(
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
                                borderRadius: BorderRadiusGeometry.circular(28.r),
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
                    ),
                  ) : SizedBox();
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
