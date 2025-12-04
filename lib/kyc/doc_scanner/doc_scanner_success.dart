import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:swychr_kyc_sdk/swychr_kyc_screen.dart';


import '../common/app_repository.dart';
import '../common/master_color.dart';
import '../common/rounded_button.dart';




class DocScannerSuccessScreen extends StatefulWidget {

  List<String>? img_list;
  String api_key;
  String email;
  Color primaryColor;

  DocScannerSuccessScreen({super.key, this.img_list, required this.api_key, required this.email,required this.primaryColor});

  @override
  State<DocScannerSuccessScreen> createState() => _AppState();
}

class _AppState extends State<DocScannerSuccessScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  int _showAnimation = 0;
  String msg = "";
  ProgressDialog? pd;
  // final _firebaseStorage = FirebaseStorage.instance;



  Future<List<String>> uploadDocScanePages(List<String> img_list, String api_key, String email) async {
    // await pd!.show();
    print ("inside");
    var filename = "UserId/idProof_"+"_"+ DateFormat('ddMMyyhhmmss').format(DateTime.now())+".png";
    print (filename);
    List<String> result = [];
    var response = await AppRepository.uploadFiles(img_list, api_key, email);
    print(response);
    // var index = 0;
    // for (String url in img_list){
    //   index = index + 1;
    //   var filename = "UserId/idProof_"+index.toString()+"_"+"_"+ DateFormat('ddMMyyhhmmss').format(DateTime.now())+".png";
    //   final metadata = SettableMetadata(contentType: "image/png");
    //   var snapshot = await _firebaseStorage.ref()
    //       .child(filename)
    //       .putFile(File(url), metadata);
    //   var downloadUrl = await snapshot.ref.getDownloadURL();
    //   print(downloadUrl);
    //   result.add(downloadUrl);
    // }

    return result;

  }

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



      var data = await AppRepository.uploadFiles(widget.img_list!, widget.api_key, widget.email);
      if (data['status'] == 200){
        setState(() {
          _showAnimation = 1;
        });
        msg = data['message'];
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
                    'assets/extracting.gif', package: "swychr_kyc_sdk",
                    width: size.width * 0.8,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Text(
                      "Extracting data from uploaded image",
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
                  height: 240.0,
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
                  "Document has been uploaded Successfully",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "You will be redirected to the KYC Status page shortly\nor click here to return to same",
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

              ],
            )
        ),
      ),

    );
  }
}