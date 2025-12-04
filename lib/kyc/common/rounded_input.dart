import 'package:flutter/material.dart';
import 'package:swychr_kyc_sdk/kyc/common/text_container.dart';

import 'master_color.dart';



class RoundedInputFieldWithBorder extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;



  const RoundedInputFieldWithBorder({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.prefixText,
    this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextContainerWithBorder(
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,



        decoration: InputDecoration(
          prefixText: prefixText,
          counterText: '',
          icon: Icon(
            icon,
            color: LightColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedInputFieldBigWithBorder extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;



  const RoundedInputFieldBigWithBorder({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.prefixText,
    this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigTextContainerWithBorder(
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,



        decoration: InputDecoration(
          prefixText: prefixText,
          counterText: '',
          icon: Icon(
            icon,
            color: LightColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}



class RoundedInputTextAreaWithBorder extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;



  const RoundedInputTextAreaWithBorder({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.prefixText,
    this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextContainerTextAreaBorder(
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,



        decoration: InputDecoration(
          prefixText: prefixText,
          counterText: '',
          icon: Icon(
            icon,
            color: LightColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}


class RoundedInputSmallWithBorder extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;



  const RoundedInputSmallWithBorder({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.prefixText,
    this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallTextContainerWithBorder(
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,



        decoration: InputDecoration(
          prefixText: prefixText,
          counterText: '',
          icon: Icon(
            icon,
            color: LightColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}