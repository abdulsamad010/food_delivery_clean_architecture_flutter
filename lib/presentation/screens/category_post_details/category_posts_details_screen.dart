import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_event.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/screens/cart/cart_screen.dart';
import '../../bloc/app_bloc.dart';
import '../../theme/app_colors.dart';

class CategoryPostsDetailsScreen extends StatefulWidget {
  int index;
  CategoryPostsDetailsScreen({super.key,required this.index});

  @override
  State<CategoryPostsDetailsScreen> createState() => _CategoryPostsDetailsScreenState();
}

class _CategoryPostsDetailsScreenState extends State<CategoryPostsDetailsScreen> {

  int quantity=0,location=-1;

  int check(){
    int mainListId=context.read<AppBloc>().state.appCategoryFoods[widget.index].id;
    for(int i=0;i<context.read<AppBloc>().state.cart.length;i++){
      if(context.read<AppBloc>().state.cart[i]["id"]==mainListId){
        location=i;
        quantity=context.read<AppBloc>().state.cart[i]["quantity"];
        return i;
      }
    }
    return -1;
  }

  @override
  void initState() {
    super.initState();

    check();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          leading: Padding(
            padding:EdgeInsets.only(top:4.w,left: 4.w),
            child: GestureDetector(
              onTap: (){
                quantity=0;
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

        title: Text("Details",style: TextStyle(
            color: black,
            fontSize: 18
        ),),

      ),

      body: BlocBuilder<AppBloc,AppState>(
        builder: (context,state)=>Padding(padding: EdgeInsets.only(left:16.w,right: 16.w,top: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
          
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children:[ Image.network("${state.appCategoryFoods[widget.index].image}",width: double.infinity,fit: BoxFit.cover,
                    height: 350.h,

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 350.h,
                          color: lightGrey,
                          child: Icon(
                            Icons.fastfood,
                            size: 40,
                            color: grey,
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding:EdgeInsets.all(12.w),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightBlueGrey
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: IconButton(onPressed: (){}, icon:Icon(
                              Icons.favorite_border,
                              color: Colors.redAccent,
                            )),
                          ),
                        ),
                      ),
                    ),

                    ])),

              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: grey)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    SvgPicture.asset("assets/icons/Ellipse 1295.svg"),

                    SizedBox(width: 4.w,),

                    Text("${state.appCategoryFoods[widget.index].restaurant}",style: TextStyle(
                        color: black,
                        fontSize: 20
                    ),),

                  ],
                ),
              ),


              SizedBox(height: 8.h,),

              Text("${state.appCategoryFoods[widget.index].name}",style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),),

              SizedBox(height: 4.h,),

              Text("${state.appCategoryFoods[widget.index].description}",style: TextStyle(
                  color:grey,
                  fontSize: 18,
                letterSpacing: 1
              ),),

              SizedBox(height: 8.h,),



              Row(
                mainAxisSize: MainAxisSize.max,

                children: [

                  Icon(Icons.star_border,color: orange,size: 25.sp,),
                  Text("${state.appCategoryFoods[widget.index].rating}",style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                  Expanded(child: SizedBox()),

                  Icon(Icons.delivery_dining,color: orange,size: 25,),
                  Text("${state.appCategoryFoods[widget.index].deliveryFee == 0.0 ? "Free" : state.appCategoryFoods[widget.index].deliveryFee}",style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                  Expanded(child: SizedBox()),

                  Icon(Icons.watch_later_outlined,color: orange,size: 25,),
                  Text("${state.appCategoryFoods[widget.index].deliveryTime}",style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),),

                ],
              ),

              SizedBox(height: 8,),

              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: Row(
                  children: [

                    Text("SIZE:",style: TextStyle(
                        color: darkGrey,
                        fontSize: 20,
                        letterSpacing: 1
                    ),),

                    SizedBox(width: 16.w,),

                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                          itemCount: state.appCategoryFoods[widget.index].sizes.length,
                          itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Container(
                              width: 70.h,
                              height: 80.h,
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: lightBlueGrey,
                                shape: BoxShape.circle
                              ),

                              child:Center(
                                child: Text("${state.appCategoryFoods[widget.index].sizes[index]["name"]}",style: TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold,
                                color: black,
                                ),),
                              ),
                            ),
                          );
                      }),
                    )

                  ],
                ),
              ),
              
              SizedBox(height: 12.h,),
              
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),
                ),
                  color: lightBlueGrey
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Row(
                          children: [
                            
                            Icon(Icons.attach_money,fontWeight: FontWeight.bold,),
                            Transform.translate(
                              offset: Offset(-6, 0),
                              child: Text("${state.appCategoryFoods[widget.index].price}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              ),
                            ),
                          ],
                        ),
                        
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: black
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.w),
                                child: GestureDetector(
                                    onTap: (){
                                      if(quantity>0) {
                                        quantity--;
                                        context.read<AppBloc>().add(UpdateCart(
                                            id: state.appCategoryFoods[widget
                                                .index].id,
                                            quantity: quantity));
                                      }
                                      },
                                    child: Icon(Icons.minimize,color: white,)),
                              ),
                              SizedBox(width: 8.w,),
                              
                              Text("${check()!= -1 ? state.cart[location]["quantity"] : 0 }",style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 20),),

                              SizedBox(width: 8.w,),
                              GestureDetector(
                                  onTap: (){
                                    quantity++;
                                    context.read<AppBloc>().add(UpdateCart(id: state.appCategoryFoods[widget.index].id, quantity: quantity));
                                  },
                                  child: Icon(Icons.add,color: white,)),
                            ],
                          ),
                        ),

                      ],
                    ),


                    SizedBox(height: 8.h,),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Text("View Cart",style: TextStyle(color: white),)),
                    )


                  ],
                ),

              )],
          ),
        ),
        ),
      ),

    );
  }
}
