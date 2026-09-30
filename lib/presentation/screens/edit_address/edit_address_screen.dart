import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../widgets/input_field.dart';
import '../cart/cart_screen.dart';
class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {

  final con1=TextEditingController();
  final con2=TextEditingController();
  final con3=TextEditingController();
  final con4=TextEditingController();
  final con5=TextEditingController();

  final fK=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: fK,
            child: Column(
              children: [
                Stack(
                    children:[

                      Image.asset("assets/images/map.jpg",fit: BoxFit.cover,height: MediaQuery.sizeOf(context).height/2.9,width: MediaQuery.sizeOf(context).width,),




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

                              Text("Edit Address",style: TextStyle(
                                  color: black,
                                  fontSize: 18
                              ),),

                            ],
                          ),


                          SvgPicture.asset("assets/icons/Track Order.svg",height: 200,width: double.infinity,),




                        ],
                      ),
                    ]),

                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Address",style: TextStyle(
                          color: black,
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold
                      ),),

                      SizedBox(height: 12.h,),

                      InputField(name: "3335 Royal Ln. Mesa, New jersy 34567", con: con1, isVisible: false),


                      SizedBox(height: 32.h,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Street",style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold
                              ),),

                              SizedBox(height: 12.h,),

                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width/2.3,
                                  child: InputField(name: "Hasan Nagar", con: con2, isVisible: false)),

                            ],
                          ),

                          SizedBox(width: 8.w,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Postel Code",style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold
                              ),),

                              SizedBox(height: 12.h,),

                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width/2.3,
                                  child: InputField(name: "34567", con: con3, isVisible: false)),

                            ],
                          )


                        ],
                      ),

                      SizedBox(height: 32.h,),


                      Text("Apartment",style: TextStyle(
                          color: black,
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold
                      ),),

                      SizedBox(height: 12.h,),

                      InputField(name: "345", con: con4, isVisible: false),



                    ],


                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(onPressed: (){
                      if(fK.currentState!.validate()) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      }},
                        style: ElevatedButton.styleFrom(backgroundColor: orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))
                        ),
                        child: Text("Save Location",
                          style: TextStyle(color: white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 17),
                        )),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),

    );
  }
}
