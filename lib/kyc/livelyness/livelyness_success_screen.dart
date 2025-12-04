import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:swychr_kyc_sdk/swychr_kyc_screen.dart';

import 'dart:io';

import '../common/app_repository.dart';
import '../common/master_color.dart';
import '../common/rounded_button.dart';




class LivelynessSuccessScreen extends StatefulWidget {

  String? pic_value;
  String email;
  Color primaryColor;
  String api_key;

  LivelynessSuccessScreen({super.key, this.pic_value, required this.email, required this.api_key, required this.primaryColor});

  @override
  State<LivelynessSuccessScreen> createState() => _AppState();
}

class _AppState extends State<LivelynessSuccessScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  int _showAnimation = 0;
  String msg = "";
  ProgressDialog? pd;



  @override
  void initState() {
    super.initState();
    submitFunction();

    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {

        }
      });
  }

  void submitFunction() async {



    var data = await AppRepository.uploadLivileyFiles(widget.pic_value!, widget.email, widget.api_key,);
    if (data['status'] == 200){
      setState(() {
        _showAnimation = 1;
      });
      msg = data['message'];
      // RechargeShowSuccessDailog(context, data['message']);
    }else{
      setState(() {
        _showAnimation = 2;
      });
      msg = data['message'];
    }

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    pd = ProgressDialog(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

        body:  Center(

            child:

            _showAnimation==0?
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Image.asset(
                    'assets/livelyness.gif',
                    package: "swychr_kyc_sdk",
                    width: size.width * 0.8,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Text(
                      "Checking liveliness of captured image",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: LightColor.kPrimaryColor,
                      ),
                    ),
                  )

                ]
            ): _showAnimation==1?
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [




                Lottie.asset(
                  width: size.width * 0.8,
                  'assets/animation.json',
                  package: "swychr_kyc_sdk",
                  controller: _animationController,
                  onLoaded: (composition) {
                    _animationController
                      ..duration = composition.duration
                      ..reset()
                      ..forward();
                  },
                ),
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Thank You!",
                  style: TextStyle(
                    color: LightColor.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Liveliness has been checked successfully",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "You will be redirected to the home page shortly\nor click here to return to home page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                RoundedButton(
                  text: "NEXT",
                  color: LightColor.kPrimaryColor,
                  press: () {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SwychrKycScreen(
                          email: widget.email,
                          primaryColor: widget.primaryColor,
                          api_key: widget.api_key,
                        ),
                      ),
                           // This removes all previous routes
                    );
                  },
                ),
                SizedBox(height: 25)

              ],
            ):
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Lottie.asset(
                  width: size.width * 0.8,
                  'assets/error.json',
                  controller: _animationController,
                  onLoaded: (composition) {
                    _animationController
                      ..duration = composition.duration
                      ..reset()
                      ..forward();
                  },
                ),
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Sorry!",
                  style: TextStyle(
                    color: LightColor.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Something went wrong",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Provider network is not available right now\nplease try again after sometime",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                RoundedButton(
                  text: "TRY AGAIN",
                  press: () async {


                  },
                ),
                SizedBox(height: 25)

              ],
            )
        ),
      ),

    );
  }
}