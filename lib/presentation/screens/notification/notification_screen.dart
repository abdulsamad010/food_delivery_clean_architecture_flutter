import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';

import '../../bloc/app_bloc.dart';
import '../../theme/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
      leading: Padding(
        padding:EdgeInsets.only(bottom: 4.w,top:4.w,left: 4.w),
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

            child: Center(child: Icon(Icons.arrow_back_ios_new,size: 14.sp,)),
          ),
        ),
      ),

      title: Text("Notifications",style: TextStyle(
          color: black,
          fontSize: 18
      ),),
        backgroundColor: white,
    ),


      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<AppBloc,AppState>(builder:(context,state)=> ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context,index){

              return Padding(padding: EdgeInsets.only(bottom: 32.w),
              child: Row(
                children: [

                  ClipOval(
                    child: Image.network("${state.notifications[index]["image"]}",fit: BoxFit.cover,height: 85.h,width: 70.w,


                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 70.w,
                      height: 85.h,
                      color: black,
                      child: Icon(
                        Icons.fastfood,
                        size: 55,
                        color: orange,
                      ),
                    );}),
                  ),
                  SizedBox(width: 8.w,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("${state.notifications[index]["name"]}",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: black,
                          fontSize: 18,
                      ),),

                      Text("${state.notifications[index]["message"]}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkGrey,
                        fontSize: 15,
                      ),),

        SizedBox(height: 8.h,),

                      Text("${state.notifications[index]["time"]}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkGrey,
                        fontSize: 15,
                      ),),
                    ],
                  ),

                  Spacer(),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network("${state.notifications[index]["foodImage"]}",fit: BoxFit.cover,height: 70.h,width: 70.w,


                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 70.w,
                          height: 70.h,
                          color: black,
                          child: Icon(
                            Icons.fastfood,
                            size: 55,
                            color: orange,
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
              );
        })),
      ),

    );
  }
}
