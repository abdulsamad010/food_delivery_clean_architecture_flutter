import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_event.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/screens/card/card_screen.dart';
import 'package:week8_task/presentation/screens/order_confiremd/order_confirmed_screen.dart';
import '../../bloc/app_bloc.dart';
import '../../bloc/app_state.dart';
import '../../theme/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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

                child: Center(child: Icon(Icons.arrow_back_ios,size: 14.sp,)),
              ),
            ),
          ),

          title: Text("Payment",style: TextStyle(
              color: black,
              fontSize: 18
          ),),
        ),

            backgroundColor: white,

      body: BlocBuilder<AppBloc,AppState>(
        builder: (context,state)=>Padding(padding: EdgeInsetsGeometry.all(16.w),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.paymentOptions.length,
                    itemBuilder: (context, index){
                      return Padding(padding: EdgeInsets.only(right: 8.w,top: 8.w,bottom: 8.w),
                      child: GestureDetector(
                        onTap: (){
                          context.read<AppBloc>().add(SelectPayment(index));
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children:[
                            Column(
                            children: [
                              Container(
                                height: 70.h,
                                width: 80.w,
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  color: lightBlueGrey,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: state.paymentOptions[index]["borderColor"],)
                                ),
                                child: SvgPicture.asset("${state.paymentOptions[index]["icon"]}"),
                              ),

                              Text("${state.paymentOptions[index]["name"]}",style: TextStyle(
                                  color:darkGrey,
                                  fontSize: 15
                              ),),
                            ],
                          ),


                            state.paymentOptions[index]["borderColor"]==orange ?
                            Transform.translate(
                                offset: Offset(4, -4),
                                child: Icon(Icons.verified,color: orange,))
                                :
                                SizedBox(),
                        ]
                        ),
                      ),
                      );
                    }),
              ),



                  state.cards.isEmpty ?
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: lightBlueGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:state.selectPaymentIndex!=0 ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SvgPicture.asset("assets/icons/Clipped.svg",height: 100.h,width: double.infinity,),

                        SizedBox(height: 8.h,),

                        Text("No ${state.paymentOptions[state.selectPaymentIndex]["name"]} payment option is added",style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),

                        SizedBox(height: 8.h,),

                        Text("You can add a mastercard and save it for later",style: TextStyle(
                            color: darkGrey,
                            fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ): Center(child: Text("Pay in Cash",style: TextStyle(
                      color: darkGrey,
                      fontSize: 15,
                    ),)),
                  )
              :
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: lightBlueGrey,
                  borderRadius: BorderRadius.circular(15),

              ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("${state.paymentOptions[state.cards[0]["selectedPaymentTypeIndex"]]["name"]}",style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),

                    SizedBox(height: 4.h,),

                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/Group 2361.svg",height: 20,),

                        Text("*********436",style: TextStyle(
                            color: darkGrey,
                            fontSize: 13
                        ),),

                      ],
                    )

                  ],
                ),
              ),


              SizedBox(height: 16.h,),

              state.selectPaymentIndex!=0 ?
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      if(state.price!=0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      side: BorderSide(color: darkGrey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(Icons.add,color: orange,),

                        Text("ADD NEW",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: orange),),
                      ],
                    )),
              ): SizedBox(),

              Expanded(child: SizedBox()),


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
                    fontSize: 15,
                  ),),
                ],
              ),




              SizedBox(height: 16.h,),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      if(state.price!=0) {
                        if(state.cards.isNotEmpty || state.selectPaymentIndex==0) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => OrderConfirmedScreen()));
                        }
                        }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text("PAY & CONFIRM",style: TextStyle(color: white),)),
              )

            ],
          ),
        ),
        ),
      ),

    );
  }
}
