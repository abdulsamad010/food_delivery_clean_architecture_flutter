import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/screens/calling/calling_screen.dart';
import 'package:week8_task/presentation/screens/chat/chat_screen.dart';
import 'package:week8_task/presentation/screens/home/home_screen.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/app_bloc.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool isOpen=false;
  final sheetController = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: lightBlueGrey,
      body: SafeArea(
        child: Stack(
            children:[

              Image.asset("assets/images/map.jpg",fit: BoxFit.cover,),




              Column(
            children: [

              Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(top:4.w,left: 8.w,right: 8.w),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(

                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: black
                        ),

                        child: Center(child: Icon(Icons.arrow_back_ios,color: white,size: 14.sp,)),
                      ),
                    ),
                  ),

                  Text("Track Order",style: TextStyle(
                      color: black,
                      fontSize: 18
                  ),),

                ],
              ),


                  SvgPicture.asset("assets/icons/Track Order.svg",height: 280,width: double.infinity,),


            ],
          ),
        ]),
      ),

      bottomSheet: DraggableScrollableSheet(
        controller: sheetController,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          expand: false,
          maxChildSize: 0.90,
          builder: (context,scrollController){
        return  ListView(
            controller: scrollController,
            children: [

              SizedBox(width: 16.h,),

              Padding(
                padding:  EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: lightBlueGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: Icon(Icons.no_food_outlined,color: orange,size: 50.sp,)),

                    SizedBox(width: 8.w,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order ID # 41324",style: TextStyle(color: black,
                            fontWeight: FontWeight.bold,fontSize: 18),),

                        SizedBox(height: 8.h,),

                        Text("Total Amount: ${context.read<AppBloc>().state.price} Dollar's",style: TextStyle(color: darkGrey,
                            fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),


                  ],
                ),
              ),


              SizedBox(height: 16.h,),

              Center(child: SvgPicture.asset("assets/icons/Track Order (1).svg")),

              SizedBox(height: 16.h,),

              Padding(
                padding:  EdgeInsets.all(16.w),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: darkGrey)
                  ),
                  child:Row(
                    children: [
                      ClipOval(
                        child: Image.asset("assets/images/img.png",height: 70.h,width: 55.w,fit: BoxFit.cover,),
                      ),

                    SizedBox(width: 8.w,),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Robert F",style: TextStyle(color: black,
                              fontWeight: FontWeight.bold,fontSize: 15),),

                          SizedBox(height: 8.h,),

                          Text("Robert F",style: TextStyle(color: darkGrey,
                              fontWeight: FontWeight.bold,fontSize: 13),),

                        ],
                      ),

                      Spacer(),

                     GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>CallingScreen()));
                         },
                         child: SvgPicture.asset("assets/icons/Call Icon.svg")),
                      SizedBox(width: 8.w,),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                            },
                            child: SvgPicture.asset("assets/icons/Chat icon.svg")),
                      ),

                    ],
                  ),
                ),
              ),



              Padding(
                padding:  EdgeInsets.all(16.w),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => HomeScreen()));


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text("Go to Home",style: TextStyle(color: white),)),
                ),
              )


            ],
          );

      })
    );
  }
}
