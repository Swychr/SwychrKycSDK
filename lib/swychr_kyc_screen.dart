
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'kyc/basic_info.dart';
import 'kyc/basic_info_edit.dart';
import 'kyc/common/app_repository.dart';
import 'kyc/common/cfunction.dart';
import 'kyc/common/master_color.dart';
import 'kyc/common/models.dart';
import 'kyc/common/rounded_button.dart';
import 'kyc/document_scanner_screen.dart';
import 'kyc/livelyness_screen.dart';
import 'kyc/shimmer_box/shimmer_builder.dart';
import 'kyc/shimmer_box/shimmer_widget.dart';


class SwychrKycScreen extends StatefulWidget {
  final Color primaryColor;
  String? email;
  String? api_key;
  SwychrKycScreen({Key? key, required this.email, required this.primaryColor, required this.api_key})
      : super(key: key);
  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<SwychrKycScreen> {
  TextEditingController coinController = TextEditingController();
  String? enteredText;
  double totalBalance =0;
  TextEditingController emailController = TextEditingController();
  ProgressDialog? pd;

  double currencyShown = 0;
  double walletAED = 0;
  var shownSymbol = "pUSD";
  int grpval = 0;
  int istep =0;



  @override
  void initState()  {
    super.initState();
    LightColor.setPrimary(widget.primaryColor);

  }

  @override
  void dispose() {
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    pd = ProgressDialog(context);
    return Scaffold(
      backgroundColor: Color(0xFFEBF2F2),
      appBar: appBarCommonToHome(context, "User KYC Status"),
      body: _bodyItem(),
    );
  }

  void showInvalidApiKeyCupertino(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Invalid API Key"),
          content: const Text("Your API key is incorrect. Please verify and try again."),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }


  Widget _bodyItem() {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<CurrentKycStatus>(
      future: AppRepository.getCurrentKYCStatus(widget.email, widget.api_key),
      builder: (context, snapshot) {
        print (snapshot);
        if (snapshot.hasData) {
          CurrentKycStatus groupItem = snapshot.data!;
          print(groupItem.status);
          if (groupItem.status == 400){
            istep = 0;
          }else if (groupItem.status == 200){
            istep = 0;
          }else if (groupItem.status ==201){
            istep = 0;
          }else if(groupItem.status ==202){
            istep = 1;
          }else if(groupItem.status ==203){
            istep = 2;
          }else if(groupItem.status ==204){
            istep = 3;
          }else if(groupItem.status ==205){
            istep = 5;
          }else{
            istep = 4;
          }
          if (groupItem.status == 400) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.lock_slash,
                      size: 60,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "Invalid API Key",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "The API key provided is invalid. "
                          "Please verify your credentials or contact support.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Optional reload button
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                      child: const Text(
                        "BACK",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);// reload API
                      },
                    )
                  ],
                ),
              ),
            );
          }else if (groupItem.status == "") {
            return Center(
                child: Text(
                  "No record found",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ));
          } else {
            return Stack(children: <Widget>[
              SingleChildScrollView(
                child: new Column(
                  children: <Widget>[

                    SizedBox(height: size.height * 0.005),
                    groupItem.status ==300? Center(
                      child: Container(

                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Image.asset(
                            'assets/kyc_proof.png',
                            package: 'swychr_kyc_sdk',),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                                child: Text(groupItem.message!, textAlign: TextAlign.center, style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: _OrderTitle(
                                  orderInfo: _data(0),
                                ),
                              ),
                              Divider(height: 1.0),
                              _DeliveryProcesses(processes: _data(0).deliveryProcesses, istep: istep, resp_data: groupItem, email: widget.email, primaryColor: widget.primaryColor, api_key: widget.api_key),
                              Divider(height: 1.0),
                              // Padding(
                              //   padding: const EdgeInsets.all(20.0),
                              //   child: _OnTimeBar(driver: _data(0).driverInfo),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ): Center(
                      child: Container(

                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Image.asset("assets/kyc_proof.png", package: "swychr_kyc_sdk",),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                                child: Text(groupItem.message!, textAlign: TextAlign.center, style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: _OrderTitle(
                                  orderInfo: _data(0),
                                ),
                              ),
                              Divider(height: 1.0),
                              _DeliveryProcesses(processes: _data(0).deliveryProcesses, istep: istep, resp_data: groupItem, email: widget.email, primaryColor: widget.primaryColor, api_key: widget.api_key),
                              Divider(height: 1.0),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: _OnTimeBar(driver: _data(0).driverInfo, email: widget.email, primaryColor: widget.primaryColor, api_key: widget.api_key,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),







                  ],
                ),
              )]);
          }
        } else if (snapshot.hasError) {
          return Center(
            child:
            Text("Some thing went wrong", textAlign: TextAlign.center),
          );
        }
        return  ADShimmerBuilder(
          shimmerBuilderType: ShimmerBuilderType.container,
          shimmerWidget: ShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleFull,
            height: 150,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),

        );;
      },
    );


  }


}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'KYC PROCESS STEPS ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final List<_DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
            thickness: 1.0,
          ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
            size: 10.0,
            position: 0.5,
          ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
          !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
          isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
   _DeliveryProcesses({Key? key, required this.processes, required this.istep, required this.resp_data, required this.email, required this.primaryColor, required this.api_key })
      : super(key: key);

  final List<_DeliveryProcess> processes;
  final CurrentKycStatus resp_data;
  final int istep;
  String? email;
  String? api_key;
  Color? primaryColor;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    istep==5?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                          color: LightColor.kPrimaryColor,
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        ShowToastMsg("Once approved you cannot edit the data!");
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.check,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep==0 && processes[index].step==1?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BasicInfoScreen(email: email, primaryColor: primaryColor, api_key: api_key)));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.start, color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep>=1 && (processes[index].step==1)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                            color: LightColor.kPrimaryColor
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BasicInfoEditScreen(
                          name: resp_data.kyc_attri!.name!, dob: resp_data.kyc_attri!.dob!, phone_no: resp_data.kyc_attri!.mobile!, gender: resp_data.kyc_attri!.gender!, address: resp_data.kyc_attri!.address!,  street: resp_data.kyc_attri!.street!,city: resp_data.kyc_attri!.city!, postal_code: resp_data.kyc_attri!.postal_code!, country: resp_data.kyc_attri!.country!, email: email, primaryColor: primaryColor, api_key: api_key
                        )));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.edit,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep==1 && (processes[index].step==2)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentScannerScreen(api_key: api_key!, email: email!, primaryColor: primaryColor!,)));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.start,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep>=2 && (processes[index].step==2)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                            color: LightColor.kPrimaryColor
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentScannerScreen(api_key: api_key!, email: email!, primaryColor: primaryColor!,)));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.edit,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep==2 && (processes[index].step==3)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => livelynessScreen(email: email, primaryColor: primaryColor, api_key: api_key)));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.start,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep>=3 && (processes[index].step==3)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                            color: LightColor.kPrimaryColor
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => livelynessScreen(email: email, primaryColor: primaryColor, api_key: api_key)));

                        // Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationScreen()));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.edit,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):
                    istep<=3 && (processes[index].step==4)?
                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                        ),),
                      Spacer(),
                      InkWell(onTap: () async {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationScreen()));
                      }, child:Container(
                          height: 30,
                          width: 30,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child:  Icon(Icons.timer,color: LightColor.kPrimaryColor,)
                      ))

                    ] ):

                    Row(children: [
                      Text(
                        processes[index].name,
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 18.0,
                        ),),
                      Spacer(),

                    ] ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].step==1) {
                if (istep < 1){
                  return DotIndicator(
                    color: LightColor.grey,
                    child: Icon(
                      Icons.not_started,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );

                }else{
                  return DotIndicator(
                    color: LightColor.kPrimaryColor,
                    child: Icon(
                      Icons.not_started,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
              }else if (processes[index].step==2) {
                if (istep < 2)
                  return DotIndicator(
                    color: Colors.grey,
                    child: Icon(
                      Icons.document_scanner,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                else{
                  return DotIndicator(
                    color: LightColor.kPrimaryColor,
                    child: Icon(
                      Icons.document_scanner,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
              }else if (processes[index].step==3) {
                if (istep< 3 ){
                  return DotIndicator(
                    color: LightColor.grey,
                    child: Icon(
                      Icons.safety_check_outlined,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
                else{
                  return DotIndicator(
                    color: LightColor.kPrimaryColor,
                    child: Icon(
                      Icons.safety_check_outlined,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
              }else if (processes[index].step==4) {
                if (istep< 4 ){
                  return DotIndicator(
                    color: LightColor.grey,
                    child: Icon(
                      Icons.incomplete_circle,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
                else{
                  return DotIndicator(
                    color: LightColor.kPrimaryColor,
                    child: Icon(
                      Icons.incomplete_circle,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }
              } else {
                if (istep==5){
                  return DotIndicator(
                    color: LightColor.kPrimaryColor,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }else{
                  return  DotIndicator(
                    color: LightColor.grey,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                }

              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
                color: istep==0 ?
                LightColor.grey:
                istep==1 &&  processes[index].step < 3?


                LightColor.kPrimaryColor:
                istep==2 &&  processes[index].step < 4?
                LightColor.kPrimaryColor:
                istep==3 &&  processes[index].step <=4?
                LightColor.kPrimaryColor:
                istep==5?
                LightColor.kPrimaryColor:
                LightColor.grey
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
   _OnTimeBar({Key? key, required this.driver, required this.email, required this.primaryColor, required this.api_key}) : super(key: key);

  final _DriverInfo driver;
  String? email;
  Color primaryColor;
  String? api_key;

  @override
  Widget build(BuildContext context) {
    return
      Row(children: [Padding(
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child : RoundedButtonSmall(
            text: "BACK",
            color: LightColor.kPrimaryColor,
            press: () {
              FocusManager.instance.primaryFocus!.unfocus();
              Navigator.pop(context);



            },

          )


      ),Spacer(), Padding(
    padding: EdgeInsets.fromLTRB(5,5,5,5),
    child : RoundedButtonSmall(
    text: "REFRESH",
    color: LightColor.kPrimaryColor,
    press: () {
    FocusManager.instance.primaryFocus!.unfocus();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SwychrKycScreen(email: email, primaryColor: primaryColor, api_key: api_key,)));



    },

    )


    )]);
  }
}

_OrderInfo _data(int id) => _OrderInfo(
    id: id,
    date: DateTime.now(),
    driverInfo: _DriverInfo(
      name: 'Philipe',
      thumbnailUrl:
      'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
    ),
    deliveryProcesses: [
      _DeliveryProcess(
        'Basic Information',
        1,
        3,
        messages: [

          _DeliveryMessage('', 'Getting Name, address and dob'),
        ],
      ),
      _DeliveryProcess(
        'Document Verification',
        2,
        3,
        messages: [
          _DeliveryMessage('', 'Uploading the required document'),
        ],
      ),
      _DeliveryProcess(
        'Liveliness Verification',
        3,
        3,
        messages: [
          _DeliveryMessage('', 'Selfy with eyes blinking and other points'),
        ],
      ),
      _DeliveryProcess(
        'Compliance Verification',
        4,
        3,
        messages: [
          _DeliveryMessage('', 'Pending review and verification by  compliance team. You shall be notified by email once approved'),
        ],
      ),
      _DeliveryProcess.complete(),
    ]
);

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DriverInfo {
  const _DriverInfo({

    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class _DeliveryProcess {
  const _DeliveryProcess(
      this.name,
      this.step,
      this.istep,
      {
        this.messages = const [],
      });

  const _DeliveryProcess.complete()
      : this.name = '',
        this.step=5,
        this.istep = 5,
        this.messages = const [];

  final String name;
  final int step;
  final int istep;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => istep == 5;
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
