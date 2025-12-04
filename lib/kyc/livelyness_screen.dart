import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter_liveness_detection_randomized_plugin/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:swychr_kyc_sdk/kyc/common/cfunction.dart';
import 'common/master_color.dart';
import 'livelyness/livelyness_success_screen.dart';


class livelynessScreen extends StatefulWidget {
  String? email;
  String? api_key;
  Color? primaryColor;

  livelynessScreen({Key? key, this.email, this.primaryColor, this.api_key})
      : super(key: key);

  @override
  _AfterSState createState() => _AfterSState();
}

class _AfterSState extends State<livelynessScreen> {

  ProgressDialog? pd;
  double amount = 0;


  String? currencyCode;
  final picker = ImagePicker();
  String value = "";



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
      appBar: appBarCommonToHome(context, "Livelyness "),
      body: _bodyItem(),


      // FutureBuilder<int>(
      //     future: loadData(),
      //     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      //       if (!snapshot.hasData) {
      //         return ADShimmerBuilder(
      //           shimmerBuilderType: ShimmerBuilderType.container,
      //           shimmerWidget: ShimmerWidget.shimmerShape(
      //             type: ShimmerType.rectangleFull,
      //             height: 150,
      //             width:  MediaQuery.of(context).size.width ,
      //           ),
      //
      //         ); // Loading indicator
      //       }else{
      //         return _bodyItem();
      //       }
      //     }),
    );



  }


  // void scanImage() async {
  //   XFile? photo = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (photo == null) {
  //     return;
  //   }
  //
  //   if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
  //     File rotatedImage =
  //     await FlutterExifRotation.rotateImage(path: photo.path);
  //     photo = XFile(rotatedImage.path);
  //   }
  //
  //   Uint8List fileBytes = await photo.readAsBytes();
  //
  //   ui.Image image = await decodeImageFromList(fileBytes);
  //
  //   ByteData? byteData =
  //   await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  //   if (byteData != null) {
  //     List<DocumentResult>? results = await docScanner.detectBuffer(
  //         byteData.buffer.asUint8List(),
  //         image.width,
  //         image.height,
  //         byteData.lengthInBytes ~/ image.height,
  //         ImagePixelFormat.IPF_ARGB_8888.index);
  //
  //     if (results != null && results.isNotEmpty) {
  //       openResultPage(
  //           DocumentData(
  //             image: image,
  //             documentResults: results,
  //           ),
  //           true);
  //     } else {
  //       double padding = 100;
  //       List<Offset> points = <Offset>[
  //         Offset(padding, padding),
  //         Offset(image.width.toDouble() - padding, padding),
  //         Offset(image.width.toDouble() - padding,
  //             image.height.toDouble() - padding),
  //         Offset(padding, image.height.toDouble() - padding)
  //       ];
  //       openResultPage(
  //           DocumentData(
  //             image: image,
  //             documentResults: <DocumentResult>[DocumentResult(0, points, 0)],
  //           ),
  //           false);
  //     }
  //   }
  // }

  Widget _bodyItem() {

    String? imgPath;
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              "Livelyness Detection",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "We are going to compare this selfie with the mandatory photo on the submitted ID",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  child: Lottie.asset(
                    "assets/livelyness-start.json",
                    package: "swychr_kyc_sdk",
                    animate: true,
                    repeat: true,
                    reverse: false,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2.5,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Container(
                              child: _buildPointWidget(
                                index: 1,
                                title: "Good Lighting",
                                subTitle: "Make sure you are in a well lit area and both ears are uncovered",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: _buildPointWidget(
                              index: 2,
                              title: "Look Straight",
                              subTitle:
                              "Hold your phone at eye level and look straight to the camera",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final String? response =
                  await FlutterLivenessDetectionRandomizedPlugin.instance
                      .livenessDetection(
                    context: context,
                    config: LivenessDetectionConfig(
                      cameraResolution: ResolutionPreset
                          .medium, // adjust the quality of image processing
                      imageQuality: 100, // adjust your image quality result
                      isEnableMaxBrightness:
                      true, // enable disable max brightness when taking face photo
                      durationLivenessVerify:
                      60, // default duration value is 45 second
                      showDurationUiText:
                      false, // show or hide duration remaining when perfoming liveness detection
                      startWithInfoScreen: true, // show or hide tutorial screen
                      useCustomizedLabel:
                      true, // set to true value for enable 'customizedLabel', set to false to use default label
                      // provide an empty string if you want to pass the liveness challenge
                      customizedLabel: LivenessDetectionLabelModel(
                        blink: 'Please Blink',
                        smile: '',// add empty string to skip/pass this liveness challenge
                        lookLeft: '',
                        lookRight: '',
                        lookDown: '',
                        lookUp: '', // example of customize label name for liveness challenge. it will replace default 'look up'
                        // example of customize label name for liveness challenge. it will replace default 'look up'
                         // null value to use default label name
                      ),
                    ),
                    isEnableSnackBar:
                    true, // snackbar to notify either liveness is success or failed
                    shuffleListWithSmileLast:
                    true, // put 'smile' challenge always at the end of liveness challenge, if `useCustomizedLabel` is true, this automatically set to false
                    isDarkMode: false, // enable dark/light mode
                    showCurrentStep: true, // show number current step of liveness
                  );
                  if (mounted) {
                    setState(() {
                      imgPath = response; // result liveness
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LivelynessSuccessScreen(pic_value: imgPath, api_key: widget.api_key!, primaryColor: widget.primaryColor!, email: widget.email!,);
                        },
                      ),
                    );
                  }


                },
                style: TextButton.styleFrom(
                  elevation: 3,
                  backgroundColor: LightColor.kPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "PROCEED",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      );

  }

  Widget _buildPointWidget({
    required int index,
    required String title,
    required String subTitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green.shade900,
          child: Text(
            "$index",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}

