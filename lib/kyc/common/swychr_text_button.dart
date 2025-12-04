import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwychrTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? hoverColor;
  final Color? splashColor;
  // final double? elevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final double? focusElevation;
  final double? hoverElevation;

  SwychrTextButton({
    Key? key,
    this.onPressed,
    this.child,
    this.color,
    this.disabledColor,
    this.textColor,
    this.disabledTextColor,
    this.hoverColor,
    this.splashColor,
    // this.elevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.focusElevation,
    this.hoverElevation,
  }) : super(key: key);

  bool _isPressed(Set<MaterialState> states) => states.contains(MaterialState.pressed);
  bool _isDisabled(Set<MaterialState> states) => states.contains(MaterialState.disabled);
  bool _isHovered(Set<MaterialState> states) => states.contains(MaterialState.hovered);
  bool _isFocused(Set<MaterialState> states) => states.contains(MaterialState.focused);

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      // backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      //   if (_isDisabled(states)) {
      //     return disabledColor!;
      //   } else if (_isHovered(states)) {
      //     return hoverColor!;
      //   }
      //   if (color==null){
      //     return Colors.white;
      //   }else{
      //     return color!;
      //   }
      //
      // }),
      // foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      //   if (_isDisabled(states)) return disabledTextColor!;
      //   if (color==null){
      //     return Colors.white;
      //   }else{
      //     return color!;
      //   }
      // }),
      // overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
      //   if (_isPressed(states)) return splashColor!;
      //   if (color==null){
      //     return Colors.white;
      //   }else{
      //     return color!;
      //   }
      // }),
      // elevation: MaterialStateProperty.resolveWith<double>((states) {
      //   if (_isDisabled(states)) return disabledElevation!;
      //   if (_isFocused(states)) return focusElevation!;
      //   if (_isHovered(states)) return hoverElevation!;
      //   return elevation!;
      // }),
      // shape: MaterialStateProperty.all<OutlinedBorder>(shape!),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding!),
    );

    return TextButton(
      onPressed: onPressed,
      style: style,
      child: child!,
    );
  }
}