import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:swychr_kyc_sdk/kyc/common/cfunction.dart';

import 'common/master_color.dart';
import 'doc_scanner/doc_scanner_success.dart';




class DocumentScannerScreen extends StatefulWidget {
  String api_key;
  String email;
  Color primaryColor;

  DocumentScannerScreen({Key? key,  required this.api_key, required this.email, required this.primaryColor})
      : super(key: key);

  @override
  _AfterSState createState() => _AfterSState();
}

class _AfterSState extends State<DocumentScannerScreen> {

  ProgressDialog? pd;





  ui.Image? image;
  List<String> _pictures = [];

  XFile? pickedFile;
  final picker = ImagePicker();


  bool isStoragePermission = true;
  bool isVideosPermission = true;
  bool isPhotosPermission = true;



  @override
  void initState() {
    super.initState();
  }





  @override
  Widget build(BuildContext context) {



    pd = ProgressDialog(context, showLogs: true);
    pd!.style(message: 'Please wait...');



    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xFFEBF2F2),
      appBar: appBarCommonToHome(context, "Document Scanner"),
      body: _bodyItem(),



    );



  }


  Future<bool> ensureCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }

    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      showMsgAlert(context);
    }

    return false;
  }

  Widget _bodyItem() {
    List<String> pictures;
    Size size = MediaQuery.of(context).size;
    final buttons = Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () async {

                  try {
                    if (await ensureCameraPermission(context)) {
                      pictures = await CunningDocumentScanner.getPictures(
                          iosScannerOptions: IosScannerOptions(
                            imageFormat: IosImageFormat.jpg,
                            jpgCompressionQuality: 0.5,
                          )) ??
                          [];
                      if (!mounted) return;

                      _pictures = pictures;
                      print ('8888');
                      print(pictures);
                      if (_pictures.isEmpty){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return DocumentScannerScreen( api_key: widget.api_key, email: widget.email, primaryColor: widget.primaryColor,);
                        }));
                      }else{
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return DocScannerSuccessScreen(img_list: pictures, api_key: widget.api_key, email: widget.email, primaryColor: widget.primaryColor,);
                        }));
                      }
                    }
                  } catch (exception) {
                    showMsgAlert(context);
                    // Handle exception here
                  }


                },
                child: Container(
                  width: 150,
                  height: 125,
                  decoration: BoxDecoration(
                    color: LightColor.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_camera.png",
                        package: "swychr_kyc_sdk",
                        width: 180,
                        height: 60,
                      ),
                      const Text(
                        "Camera Scan",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                )),
            // GestureDetector(
            //     onTap: () {
            //       // scanImage();
            //     },
            //     child: Container(
            //       width: 150,
            //       height: 125,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Image.asset(
            //             "assets/images/icon-image.png",
            //             width: 90,
            //             height: 60,
            //           ),
            //           const Text(
            //             "Image Scan",
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(fontSize: 16, color: Colors.white),
            //           )
            //         ],
            //       ),
            //     ))
          ],
        ));
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          SizedBox(height: 10),
          Image.asset(
            "assets/doc_scan.jpeg",
            package: "swychr_kyc_sdk",
            width: size.width * 0.9,
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 5, bottom: 0),
            child: Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //       color: ListTheme.grey.withOpacity(0.1),
                //       offset: Offset(1.1, 1.1),
                //       blurRadius: 10.0),
                // ],
              ),
              child: Column(
                children: <Widget>[


                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 5),
                      child: Center(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 0, top: 3, right: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Document Scanner',
                                      style:
                                      TextStyle(fontSize: 18, fontFamily: 'Roboto-Light.ttf', color: LightColor.kPrimaryColor),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_circle_down_outlined,
                                      color: LightColor.kPrimaryColor,
                                      size: 24.0,
                                      semanticLabel: 'Text to announce in accessibility modes',
                                    ),

                                  ],
                                )),
                            Divider(thickness: 0.5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                              child: Text("Our robust technology makes it easy to extract texts from National ID and Driver License into digital formats in only a fraction of time. You no longer have to write them down. Let our AI- powered OCR detect and write them for you. We support National ID, Passport and Driving License.", textAlign: TextAlign.justify, style: const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),),
                            ),


                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                              child: Text("Please choose one of the following options", textAlign: TextAlign.justify, style:  TextStyle(
                                  color: LightColor.kPrimaryColor, fontWeight: FontWeight.normal, fontSize: 17),),
                            ),
                            Divider(thickness: 0.5)
                          ],
                        ),
                      )),



                ],
              ),
            ),
          ),
          buttons

        ],
      ),
    );
  }

  void showMsgAlert(BuildContext context) {
    AwesomeDialog(
      context: context,
      keyboardAware: true,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      btnOkText: 'Confirm',
      title: 'Provide Permission',
      padding: const EdgeInsets.all(16.0),
      desc: "Please provide the read permission of photos",
      btnOkOnPress: () async {
        await openAppSettings();
        // submitWithdrawalSimple(context, selection,  orderId,  itemIndexList,  reasonText, concernid);
      },
    ).show();
  }









}
