import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_bloc.dart';
import 'package:week8_task/presentation/widgets/input_field.dart';

import '../../bloc/app_event.dart';
import '../../theme/app_colors.dart';
import '../payment/payment_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  
  final con1=TextEditingController();
  final con2=TextEditingController();
  final con3=TextEditingController();
  final con4=TextEditingController();
  
  final fK=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: white,
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

        title: Text("Add Card",style: TextStyle(
            color: black,
            fontSize: 18
        ),),
      ),

      backgroundColor: white,
      
      body: Padding(padding: EdgeInsets.all(16.w),
      child: Form(
        key: fK,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("CARD HOLDER NAME",style: TextStyle(
                  color: black,
                  fontSize: 15
              ),),

              SizedBox(height: 8.w,),

              InputField(name: "Abdul Samad", con: con1, isVisible: false),

              SizedBox(height: 16.h,),

              Text("CARD NUMBER",style: TextStyle(
                  color: black,
                  fontSize: 15
              ),),

              SizedBox(height: 8.w,),

              InputField(name: "2134 ____ ____", con: con2, isVisible: false),

              SizedBox(height: 16.h,),

              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CARD EXPIRE DATE",style: TextStyle(
                            color: black,
                            fontSize: 15
                        ),),

                        SizedBox(height: 8.h,),

                        InputField(name: "mm/yyyy", con: con3, isVisible: false),

                      ],
                    ),
                  ),


                  SizedBox(width: 16.h,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVC",style: TextStyle(
                            color: black,
                            fontSize: 15
                        ),),

                        SizedBox(height: 8.h,),

                        InputField(name: "***", con: con4, isVisible: false),

                      ],
                    ),
                  ),


                ],
              ),


              SizedBox(height: 100.h,),



              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      if(fK.currentState!.validate()) {

                        context.read<AppBloc>().add(AddCard(name:con1.text,num:con2.text,exp:con3.text,cvc:con4.text,));

                      Navigator.pop(context);
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
        ),
      ),
      ),
      
    );
  }
}
