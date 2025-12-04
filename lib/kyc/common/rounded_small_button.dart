import 'package:flutter/material.dart';
import 'package:swychr_kyc_sdk/kyc/common/text_container.dart';


import 'master_color.dart';


class RoundedInputSmallline extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;

  const RoundedInputSmallline({
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
    return TextFieldContainerline(
      child: TextField(

        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,

        style: TextStyle(fontSize:15),

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


class RoundedInputSmalllineDate extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? prefixText;
  final ValueChanged? changeFunc;
  final VoidCallback? onTap;

  const RoundedInputSmalllineDate({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.prefixText,
    this.changeFunc,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainerline(
      child: TextField(

        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        cursorColor: LightColor.kPrimaryColor,
        onChanged: changeFunc,

        style: TextStyle(fontSize:15),
        onTap: onTap,

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