import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:http/http.dart' as http;
import 'package:swychr_kyc_sdk/kyc/common/cfunction.dart';
import '../swychr_kyc_screen.dart';
import 'address/address_form.dart';
import 'common/app_repository.dart';
import 'common/master_color.dart';
import 'common/rounded_button.dart';
import 'common/rounded_input.dart';
import 'common/rounded_small_button.dart';
import 'common/swychr_text_button.dart';


class BasicInfoEditScreen extends StatefulWidget {
  String? email;
  String? name;
  String? dob;
  String? phone_no;
  String? gender;
  String? address;
  String? street;
  String? city;
  String? postal_code;
  String? country;
  Color? primaryColor;
  String? api_key;
  String? mobile_code;
  String? country_iso_code;


  BasicInfoEditScreen({Key? key, this.email, this.name, this.dob, this.phone_no, this.gender, this.address, this.street, this.postal_code, this.city, this.country, this.primaryColor, this.api_key, this.mobile_code, this.country_iso_code})
      : super(key: key);
  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<BasicInfoEditScreen> {
  TextEditingController dobController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? address2Controller = TextEditingController();
  TextEditingController? zipController=TextEditingController();
  TextEditingController? cityController= TextEditingController();
  TextEditingController? countryController= TextEditingController();
  String? enteredText;
  double totalBalance =0;
  int _value = 0;
  String? dob;
  TextEditingController emailController = TextEditingController();
  ProgressDialog? pd;

  double currencyShown = 0;
  double walletAED = 0;
  var shownSymbol = "pUSD";
  int grpval = 0;



  String gender="";
  String country_name = "INDIA";
  String phone_code = "";
  String country_iso_code = "IN";
  String? phoneNo = "";




  @override
  void initState() {
    super.initState();
    print (widget.mobile_code);
    nameController.text = widget.name!;
    dobController.text= widget.dob!;
    phoneNo = widget.phone_no;
    gender = widget.gender!;
    addressController!.text = widget.address!;
    address2Controller!.text = widget.street!;
    cityController!.text = widget.city!;
    zipController!.text = widget.postal_code!;
    countryController!.text = widget.country!;
    country_iso_code = widget.country_iso_code!;
    phone_code = widget.mobile_code!;







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
      appBar: appBarCommonToHome(context, "Basic Information Edit"),
      body: _bodyItem(),
    );
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => dobController.text = "${picked.year}-${picked.month}-${picked.day}");
  }


  Widget _bodyItem() {
    final mainKey = GlobalKey<AddressFormState>();
    Size size = MediaQuery.of(context).size;
    return Stack(children: <Widget>[ SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                color: ListTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: ListTheme.grey.withOpacity(0.1),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding:EdgeInsets.only(top: 10,left: 0),child:Icon(Icons.person_pin_outlined,color: LightColor.primaryColor,)),
                        Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: Text('Personal Info:-',style: TextStyle(fontSize: 15,
                            fontFamily: 'Roboto-Light.ttf',color: Colors.grey[600]),)),


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 5),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: ListTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter Full Name (as per  document)',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),

                          Spacer(),

                        ],
                      )
                  ),
                  SizedBox(height: 3),
                  RoundedInputFieldWithBorder(
                    hintText: "Enter Name",
                    icon: Icons.person,
                    textInputType: TextInputType.text,
                    controller: nameController,
                  ),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter Mobile Number',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),
                          Spacer(),

                        ],
                      )
                  ),
                  SizedBox(height: 3),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      width: size.width * 0.8,

                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: IntlPhoneField(
                          initialValue: widget.phone_no,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            focusColor: Color(0xFF7B1FA2),
                            hoverColor: Color(0xFF7B1FA2),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFF7B1FA2)),


                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFF7B1FA2)),


                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFF7B1FA2)),


                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFF7B1FA2)),


                            ),


                          ),

                          initialCountryCode: widget.country_iso_code,

                          onChanged: (phone) {
                            try {
                              if (phone.isValidNumber()) {
                                phoneNo = phone.number;
                                phone_code = phone.countryCode;
                                country_iso_code = phone.countryISOCode;
                              } else {
                                phoneNo = "";
                                phone_code = "";
                                country_iso_code = "";
                              }
                            } catch (e) {
                              print('Phone validation error: $e');
                              phoneNo = "";
                              phone_code = "";
                              country_iso_code = "";
                            }
                          },
                          onCountryChanged: (country){
                            phoneNo = "";
                            country_name = country.name;
                            country_iso_code = country.code;
                            countryController!.text = country_name;
                            setState(() {

                            });


                          }

                      )),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 0, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Select Gender',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),


                        ],
                      )
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                    child:  DropdownButtonFormField2<String>(
                      value: widget.gender,
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.

                        contentPadding: const EdgeInsets.symmetric(vertical: 20),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: LightColor.kPrimaryColor, width: 0.0),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: LightColor.kPrimaryColor, width: 0.0),

                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: LightColor.kPrimaryColor, width: 0.0),

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: LightColor.kPrimaryColor, width: 0.0),

                        ),

                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Select Your Gender',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: ["Male", "Female", "Other"].map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        gender = value.toString();
                        //Do something when selected item is changed.
                      },
                      onSaved: (value) {
                        gender = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),

                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter Dob',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),
                          Spacer(),


                        ],
                      )
                  ),

                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child:Row(
                          children: [


                            InkWell(
                                onTap: () {
                                  _selectDate();   // Call Function that has showDatePicker()
                                },
                                child: RoundedInputSmalllineDate(
                                  hintText: "Dob",
                                  icon: Icons.calendar_month,
                                  onTap: _selectDate,
                                  controller: dobController,
                                )
                            )])),



                  SizedBox(height: 5),

                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding:EdgeInsets.only(top: 10,left: 0),child:Icon(Icons.place_outlined,color: LightColor.primaryColor,)),
                        Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child: Text('Address Info:-',style: TextStyle(fontSize: 15,
                            fontFamily: 'Roboto-Light.ttf',color: Colors.grey[600]),)),
                        Spacer(),




                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 5),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: ListTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter Full Address ',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),
                          Spacer(),


                        ],
                      )
                  ),
                  SizedBox(height: 3),
                  RoundedInputTextAreaWithBorder(
                    hintText: "Enter Address",
                    icon: Icons.place_outlined,
                    textInputType: TextInputType.text,
                    controller: addressController,
                  ),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter City',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),
                          SizedBox(width: size.width * 0.25),
                          RichText(
                            text: TextSpan(
                                text: 'Enter Pincode',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [

                                ]),

                          ),


                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            RoundedInputSmallWithBorder(
                              hintText: "Enter City",
                              icon: Icons.location_city_sharp,
                              textInputType: TextInputType.text,
                              controller: cityController,
                            ),
                            Spacer(),
                            RoundedInputSmallWithBorder(
                              hintText: "Enter Zip code",
                              icon: Icons.code_sharp,
                              textInputType: TextInputType.text,
                              controller: zipController,
                            ),
                          ]
                      )
                  ),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.only(left: 24, top: 3, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'Enter Country',
                                style: TextStyle(
                                    fontSize: 15, color: LightColor.kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))
                                ]),

                          ),
                          Spacer(),

                        ],
                      )
                  ),
                  SizedBox(height: 3),
                  RoundedInputFieldWithBorder(
                    hintText: "Enter Country",
                    icon: Icons.countertops_outlined,
                    textInputType: TextInputType.text,
                    controller: countryController,
                  ),


                  SizedBox(height: 10),
                  RoundedButton(
                    color: LightColor.kPrimaryColor,

                    text: "NEXT",
                    press: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      if (nameController.text == ""){
                        ShowToastMsg("Please enter name");
                      }else if (phoneNo == ""){
                        ShowToastMsg("Please enter valid phone number with country code");
                      }else if (gender == ""){
                        ShowToastMsg("Please select gender");
                      }else if (dobController.text  == ""){
                        // print(addressController!.text!);
                        ShowToastMsg("Please select dob");
                      }else if (addressController!.text!  == ""){
                        ShowToastMsg("Please enter address");

                      }else if (cityController!.text!  == ""){
                        ShowToastMsg("Please enter city");

                      }else if (countryController!.text!  == ""){
                        ShowToastMsg("Please enter country");

                      }
                      else {
                        print (phoneNo);
                        showConfirmationAlert(context,nameController.text, phoneNo!, gender, dobController.text, addressController!.text, address2Controller!.text!, cityController!.text!, zipController!.text!, countryController!.text!, phone_code, country_iso_code, widget.email!, widget.primaryColor!, widget.api_key!);

                      }


                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return DocumentScannerScreen();
                      //     },
                      //   ),
                      // );

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return livelynessScreen();
                      //     },
                      //   ),
                      // );







                    },

                  ),
                  SizedBox(height: 25),


                ],
              ),
            ),
          ),









          // Padding(
          //     padding: EdgeInsets.only(left: 45, top: 3, right: 45),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           'Unlock the secrets!',
          //           style:
          //           TextStyle(fontSize: 18, fontFamily: 'Roboto-Light.ttf', color: LightColor.kPrimaryColor),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_circle_down_outlined,
          //           color: LightColor.kPrimaryColor,
          //           size: 24.0,
          //           semanticLabel: 'Text to announce in accessibility modes',
          //         ),
          //
          //       ],
          //     )),
          // SizedBox(height: 10),
          //
          // Padding(
          //   padding: EdgeInsets.only(left: 45, top: 3, right: 45),
          //   child: TextContainerWithBorder(child:  YoutubePlayer(
          //       controller: _controller,
          //       showVideoProgressIndicator: true,
          //       liveUIColor: LightColor.primaryJumpTheQColor,
          //       onReady: () {
          //         _isPlayerReady = true;
          //       },
          //
          //
          //
          //     ))),

        ],
      ),
    )]);
  }

  void showConfirmationAlert(BuildContext context, String name, String phoneNo, String gender, String dob, String address, String street_address, String city, String zip_code, String country, String mobile_code, String country_iso_code, String email, Color primaryColor, String api_key) {
    AwesomeDialog(
      context: context,
      keyboardAware: true,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      btnCancelText: 'Cancel',
      btnOkText: 'Confirm',
      title: 'Are you sure you want to proceed?',
      padding: const EdgeInsets.all(16.0),
      desc: "Take note that once you confirm this action cannot be reversed",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        submitBasicInfoRequest(context, name,  phoneNo,  gender,  dob,  address,  street_address,  city,  zip_code,  country, mobile_code, country_iso_code, email,primaryColor, api_key);
        // submitWithdrawalSimple(context, selection,  orderId,  itemIndexList,  reasonText, concernid);
      },
    ).show();
  }



  Future<void> submitBasicInfoRequest(BuildContext context, String name, String phoneNo, String gender, String dob, String address, String street_address, String city, String zip_code, String country, String mobile_code, String country_iso_code, String email,Color primaryColor, String api_key) async {
    await pd!.show();
    final body = {
      "email": email,
      "name": name,
      "mobile": phoneNo,
      "gender": gender,
      "dob": dob,
      "address": address,
      "street": street_address,
      "city" : city,
      "postal_code": zip_code,
      "country": country,
      "mobile_code": mobile_code,
      "country_iso_code": country_iso_code


    };
    AppRepository.addKYCBasicInfo(body, api_key).then((response) async {
      await pd!.hide();
      if (response["status"] == 200) {
        CommonShowSuccessKycDailog(context, response["message"], email, primaryColor, api_key );
      } else {
        ShowAlertDialogSorry(context, response["message"], email, primaryColor, api_key);
      }

    });
  }

  void CommonShowSuccessKycDailog(BuildContext context, String message, String email, Color primaryColor, String api_key){
    Dialogs.materialDialog(
        color: Colors.white,
        msg: message,
        msgAlign: TextAlign.center,
        barrierDismissible: false,
        title: 'Congratulations',
        lottieBuilder: Lottie.asset(
          'assets/animation.json',
          package: 'swychr_kyc_sdk',
          fit: BoxFit.contain,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              // if (Navigator !=null){
              Navigator.pop(context);
              // }
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SwychrKycScreen(
                    email: widget.email,
                    primaryColor: widget.primaryColor!,
                    api_key: widget.api_key,
                  ),
                ),
                    (Route<dynamic> route) => false, // This removes all previous routes
              );},
            text: 'Ok',
            iconData: Icons.done,
            color: LightColor.kPrimaryColor,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void ShowAlertDialogSorry(BuildContext context, String message, String email, Color primaryColor, String api_key) {
    Widget okButton = SwychrTextButton(
      padding: EdgeInsets.all(5.0),
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sorry"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
