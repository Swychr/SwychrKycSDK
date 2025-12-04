import 'package:flutter/material.dart';

class LightColor {
  static const Color background = Color(0XFFFFFFFF);

  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);

  static const Color skyBlue = Color(0xff2890c8);
  static const Color lightBlue = Color(0xff5c3dff);
  static const Color baseShimmerColor = Color(0xffE1E2E4);
  static const Color highlightShimmerColor = Color(0xffA1A3A6);
  static const Color shimmerColor = Color(0xFFB80FEA);


  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color bPrimaryColor = Color(0xFF327AC2);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);

  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellowColor = Color(0xfffbba01);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);

  static const Color navyBlue1 = Color(0xff15294a);
  static const Color navyBlue2 = Color(0xff2c405b);


  static const Color BackgroundColor = Color(0x323C9609);
  static const Color BackgroundColorLight = Color(0x803C9609);

  static Color kPrimaryColor = Color(0xFF7B1FA2);
  static void setPrimary(Color color) {
    kPrimaryColor = color;
  }
  static const Color freshbaggPrimaryColor = LightColor.primaryColor;
  static const Color kPrimaryLightColor = Color(0x323C9657);
  static const Color primaryLightFreshbaggColor = Color(0x323C9609);
  static const Color backgroundColor = primaryLightJumpTheQColor;
  static const Color primaryJumpTheQColor = LightColor.bPrimaryColor;
  static const Color primaryMediumJumpTheQColor = Color(0xFFB80FEA);
  static const Color primaryLightJumpTheQColor = Color(0x32930CBB);
  static const Color primaryMedJumpTheQColor = Color(0x96930CBB);

  static const Color primaryColor = primaryJumpTheQColor;
  static const Color primaryAppColor = primaryColor;
  static const Color primaryLightColor = primaryLightJumpTheQColor;
  static const Color primaryMediumColor = primaryMediumJumpTheQColor;



  static const inactiveGreyTextColor = Color.fromRGBO(153, 153, 153, 1);
  static const lightGreyTextColor = Color.fromRGBO(193, 194, 199, .9);
  static const deepLavender = Color.fromRGBO(237, 233, 242, 1);

  static const int _whitePrimaryColor = 0xFFFFFFFF;
  static const int _greyPrimaryColor = 0xff888888;
  static const int _greenPrimaryColor = 0xff66D0A6;
  static const int _bluePrimaryColor = 0xff66A7D4;
  static const int _violetPrimaryColor = 0xff8E278F;
  static const int _redPrimaryColor = 0xffF04C23;
  static const int _lightBluePrimaryColor = 0xffE5F0F7;
  static const int _blackPrimaryColor = 0xff333333;

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor green = MaterialColor(
    _greenPrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(0, 177, 107, .1),
      100: Color.fromRGBO(0, 177, 107, .2),
      200: Color.fromRGBO(0, 177, 107, .3),
      300: Color.fromRGBO(0, 177, 107, .4),
      400: Color.fromRGBO(0, 177, 107, .5),
      500: Color.fromRGBO(0, 177, 107, .6),
      600: Color.fromRGBO(0, 177, 107, .7),
      700: Color.fromRGBO(0, 177, 107, .8),
      800: Color.fromRGBO(0, 177, 107, .9),
      900: Color.fromRGBO(0, 177, 107, 1),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor white = MaterialColor(
    _whitePrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(255, 255, 255, .1),
      100: Color.fromRGBO(255, 255, 255, .2),
      200: Color.fromRGBO(255, 255, 255, .3),
      300: Color.fromRGBO(255, 255, 255, .4),
      400: Color.fromRGBO(255, 255, 255, .5),
      500: Color.fromRGBO(255, 255, 255, .6),
      600: Color.fromRGBO(255, 255, 255, .7),
      700: Color.fromRGBO(255, 255, 255, .8),
      800: Color.fromRGBO(255, 255, 255, .9),
      900: Color.fromRGBO(255, 255, 255, .10),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor grey_ = MaterialColor(
    _greyPrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(136, 136, 136, .1),
      100: Color.fromRGBO(136, 136, 136, .2),
      200: Color.fromRGBO(136, 136, 136, .3),
      300: Color.fromRGBO(136, 136, 136, .4),
      400: Color.fromRGBO(136, 136, 136, .5),
      500: Color.fromRGBO(136, 136, 136, .6),
      600: Color.fromRGBO(136, 136, 136, .7),
      700: Color.fromRGBO(136, 136, 136, .8),
      800: Color.fromRGBO(136, 136, 136, .9),
      900: Color.fromRGBO(136, 136, 136, .10),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(0, 109, 183, .1),
      100: Color.fromRGBO(0, 109, 183, .2),
      200: Color.fromRGBO(0, 109, 183, .3),
      300: Color.fromRGBO(0, 109, 183, .4),
      400: Color.fromRGBO(0, 109, 183, .5),
      500: Color.fromRGBO(0, 109, 183, .6),
      600: Color.fromRGBO(0, 109, 183, .7),
      700: Color.fromRGBO(0, 109, 183, .8),
      800: Color.fromRGBO(0, 109, 183, .9),
      900: Color.fromRGBO(0, 109, 183, 1),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor violet = MaterialColor(
    _violetPrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(142, 39, 143, .1),
      100: Color.fromRGBO(142, 39, 143, .2),
      200: Color.fromRGBO(142, 39, 143, .3),
      300: Color.fromRGBO(142, 39, 143, .4),
      400: Color.fromRGBO(142, 39, 143, .5),
      500: Color.fromRGBO(142, 39, 143, .6),
      600: Color.fromRGBO(142, 39, 143, .7),
      700: Color.fromRGBO(142, 39, 143, .8),
      800: Color.fromRGBO(142, 39, 143, .9),
      900: Color.fromRGBO(142, 39, 143, 1),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor red_ = MaterialColor(
    _redPrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(240, 76, 35, .1),
      100: Color.fromRGBO(240, 76, 35, .2),
      200: Color.fromRGBO(240, 76, 35, .3),
      300: Color.fromRGBO(240, 76, 35, .4),
      400: Color.fromRGBO(240, 76, 35, .5),
      500: Color.fromRGBO(240, 76, 35, .6),
      600: Color.fromRGBO(240, 76, 35, .7),
      700: Color.fromRGBO(240, 76, 35, .8),
      800: Color.fromRGBO(240, 76, 35, .9),
      900: Color.fromRGBO(240, 76, 35, 1),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor lightBlue_ = MaterialColor(
    _lightBluePrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(229, 240, 247, .1),
      100: Color.fromRGBO(229, 240, 247, .2),
      200: Color.fromRGBO(229, 240, 247, .3),
      300: Color.fromRGBO(229, 240, 247, .4),
      400: Color.fromRGBO(229, 240, 247, .5),
      500: Color.fromRGBO(229, 240, 247, .6),
      600: Color.fromRGBO(229, 240, 247, .7),
      700: Color.fromRGBO(229, 240, 247, .8),
      800: Color.fromRGBO(229, 240, 247, .9),
      900: Color.fromRGBO(229, 240, 247, 1),
    },
  );

  /// opacityValue range varies from 50,100,200,300,400,500,600,700,800,900 where 50 is 10% and 900 is 100 %
  static const MaterialColor black_ = MaterialColor(
    _blackPrimaryColor,
    <int, Color>{
      50: Color.fromRGBO(51, 51, 51, .1),
      100: Color.fromRGBO(51, 51, 51, .2),
      200: Color.fromRGBO(51, 51, 51, .3),
      300: Color.fromRGBO(51, 51, 51, .4),
      400: Color.fromRGBO(51, 51, 51, .5),
      500: Color.fromRGBO(51, 51, 51, .6),
      600: Color.fromRGBO(51, 51, 51, .7),
      700: Color.fromRGBO(51, 51, 51, .8),
      800: Color.fromRGBO(51, 51, 51, .9),
      900: Color.fromRGBO(51, 51, 51, 1),
    },
  );

  static LinearGradient adGradientonInfoCard = const LinearGradient(
    colors: [
      Color(0xff0fb371),
      Color(0xff2073b8),
      Color(0xff6b5ca6),
      Color(0xff923993),
      Color(0xfff05636),
      Color(0xfff05636)
    ],
    stops: [0, 0.35, 0.49, 0.64, 0.89, 1],
    begin: Alignment(-1, 0.03),
    end: Alignment(1, -0.03),
// angle: 88,
// scale: undefined,
  );
}

/// Information Colour Palette - ICP
/// these color codes will be used where ever any information message with light background will be displayed
/// with this background color text color should be black(0xff333333) in color
@Deprecated(
    'Use context.theme.colorScheme.successInfoMsg instead of ADColorICPLight.blueCardColor')
class ADColorICPLight {
  ///0xffe5f7f0
  static const successInfoMsg = Color(0xffe5f7f0);

  ///0xfffef5e5
  static const importantInfoMsg = Color(0xfffef5e5);

  ///0xffebebeb
  static const neutralInfoMsg = Color(0xffebebeb);

  ///0xfffce5e5
  static const errorInfoMsg = Color(0xfffce5e5);
}

///Text. Colour Palette - TCP
/// these color codes will be used where ever any information message with dark background will be displayed
/// with this background color text color should be white(0xffffffff) in color
@Deprecated(
    'Use context.theme.colorScheme.successInfoMsg instead of ADColorTCPDark.blueCardColor')
class ADColorTCPDark {
  ///0xff00b16b
  static const successInfoMsg = Color(0xff00b16b);

  ///0xfff04c23
  static const importantInfoMsg = Color(0xfff04c23);

  ///0xff333333
  static const neutralInfoMsg = Color(0xff333333);

  ///0xffe60000
  static const errorInfoMsg = Color(0xffe60000);
}

@Deprecated(
    'Use context.theme.colorScheme.blueCardColor instead of ADExtraColors.blueCardColor')
class ADExtraColors {
  ///0xff007aff
  static const blueCardColor = Color(0xff007aff);

  ///0xffe2e2e2
  static const tileBorderColor = Color(0xffe2e2e2);

  ///0xff666666
  static const greyTextColor = Color(0xff666666);

  static const lightGreyTextColor = Color.fromRGBO(193, 194, 199, .9);

  static const inactiveGreyTextColor = Color.fromRGBO(153, 153, 153, 1);

  //0xff999999
  static const circleGreyTextColor = Color(0xff999999);

  //0xff888888
  static const greyCircleColor = Color(0xff888888);

  ///0xff4a4a4a
  static const greyChartTextColor = Color(0xff4a4a4a);

  ///0xff32a851
  static const greenTextColor = Color(0xff32a851);

  ///0xff222222
  static const blackTextColor = Color(0xff222222);

  ///0xff027bff
  static const blueTextColor = Color(0xff027bff);

  ///0xff555555
  static const darkGreyTextColor = Color(0xff555555);

  //0xff868686
  static const geryBorderColor = Color(0xff868686);

  ///0xfffafafa
  static const cardBgColor = Color(0xfffafafa);

  ///0xff220000
  static const tagTextColor = Color(0xff220000);

  ///0xffdedede
  static const dividerColor = Color(0xffdedede);

  ///0xff979797
  static const dashedDividerColor = Color(0xff979797);

  ///0xff0aaf62
  static const whatsAppIconColor = Color(0xff0aaf62);

  ///0xff9c6c58
  static const textBrownColor = Color(0xff9c6c58);

  ///0xffe9c5c5
  static const errorCardBorderColor = Color(0xffe9c5c5);

  ///0xfffae7b5
  static const infoCardBorderColor = Color(0xfffae7b5);

  ///0x1f000000
  static const boxShadowColor = Color(0x1f000000);

  ///0xff8a5a96
  static const violetColor = Color(0x1f8a5a96);

  ///0xffffbcfd
  static const lightPinkColor = Color(0x1fFFBCFD);

  ///0xff18aa26
  static const lightGreenColor = Color(0xff18aa26);

  ///0xff177f38--Created by Raghav
  static const darkGreenColor = Color(0xff177f38);

  ///0xfff8ffff
  static const baggageCardBg = Color(0xfff8ffff);

  ///0xfff8f8f8
  static const containerGreyBg = Color(0xfff8f8f8);

  ///0xffc00000
  static const lightRedColor = Color(0xffc00000);

  ///0xfff1f1f1
  static const lightGreyColor = Color(0xfff1f1f1);

  ///0xff177f38
  static const greenStarColor = Color(0xff177f38);

  ///0xff0d67ca
  static const blueColor = Color(0xff0d67ca);

  ///0xfff8f8f8
  static const cardBackgroundColor = Color(0xfff8f8f8);

  ///0xfff8f8f8
  static const greyTextColor2 = Color(0xfff8f8f8);

  ///0xff00455b
  static const gradientGreenColor = Color(0xff00455b);

  ///0xffcd2960
  static const gradientRedColor = Color(0xffcd2960);

  ///0xff6e092a
  static const gradientDarkRedColor = Color(0xff6e092a);

  ///0xffcccccc
  static const greyReviewShade = Color(0xffcccccc);

  ///0xab007b48
  static const reviewsShade1 = Color(0xab007b48);

  ///0xff56b28c
  static const reviewsShade2 = Color(0xff56b28c);

  ///0xff68d0a5
  static const reviewsShade3 = Color(0xff68d0a5);

  ///0xffff9c00
  static const reviewsShade4 = Color(0xffff9c00);

  ///0xffbd6f6f
  static const reviewsShade5 = Color(0xffbd6f6f);

  ///0xffffc48d
  static const barSeriesColorFirst = Color(0xffffc48d);

  ///0xff7cabff
  static const barSeriesColorSecond = Color(0xff7cabff);

  ///0xfff99f5c
  static const orangeColor = Color(0xfff99f5c);

  ///0xffd8d8d8
  static const contentBulletColor = Color(0xffd8d8d8);

  ///0xeef5fcff
  static const cardType4bgColor = Color(0xeef5fcff);

  ///0x00000000
  static const transparantColor = Color(0x00000000);

  ///0xff8a8a8f
  static const searchTextFieldGreyHintColor = Color(0xff8a8a8f);

  ///0xd4d44817
  static const rustyOrangeColor = Color(0xd4d44817);

  ///0xff397af1
  static const headerContainerBg = Color(0xff397af1);

  ///0xff1d740a
  static const priceTagGreen = Color(0xff1d740a);

  ///0xffeef5fc
  static const cardBlueBg = Color(0xffeef5fc);

  ///0xffe0e0e0
  static const widgetDividerLine = Color(0xffe0e0e0);

  static const lightBackgroundGreen = Color(0xffE5F4EA);

  ///0xfffaf3f0
  static const lightRustyOrangeBg = Color(0xfffaf3f0);

  ///0xff18aa26
  static const priceOffGreen = Color(0xff18aa26);

  static const filterBlackText = Color(0xff000000);

  static const verticalSeparatorGrey = Color(0xffaaaaaa);

  static const lightSkyBlue = Color(0xffe8f3ff);

  ///0xff002f47
  static const tealTextColor = Color(0xff002f47);

  ///0xffeef3f3
  static const cardTealColor = Color(0xffeef3f3);
}

//this can be used where we need to create gradient box decoration or gradient text color
LinearGradient adGradientColorsArray = const LinearGradient(colors: [
  Color.fromRGBO(240, 86, 54, 0.8),
  Color.fromRGBO(240, 86, 54, 0.8),
  Color.fromRGBO(146, 57, 147, 0.8),
  Color.fromRGBO(107, 92, 166, 0.8),
  Color.fromRGBO(32, 115, 184, 0.8),
  Color.fromRGBO(15, 179, 113, 0.8)
]);

/// use to set gradient on title text
LinearGradient adGradientColorType2 = LinearGradient(
  colors: adGradientColorsArray.colors,
  begin: const Alignment(-1, -1),
  end: const Alignment(1, 1),
  stops: const [
    0.0,
    0.0,
    0.04,
    0.95,
    0.999,
    1,
  ],
);
LinearGradient adGradientColorType3 = const LinearGradient(
  begin: Alignment(-0.4406030558650224, 0.6706368071243811),
  end: Alignment(1.3685075600827605, 0.3450492747929143),
  colors: [
    Color(0xff2073b8),
    Color(0xff6b5ca6),
    Color(0xff923993),
    Color(0xfff05636),
    Color(0xfff05636)
  ],
  stops: [0.0, 0.25, 0.4, 0.9, 1.0],
);

List<Color> reviewColors = const [
  Color(0xab007b48),
  Color(0xff68d0a5),
  Color(0xff68d0a5),
  Color(0xffff9c00),
  Color(0xffbd6f6f),
];




class ListTheme {
  ListTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFFe06666);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    // headline4: display1,
    // headline5: headline,
    // headline6: title,
    // subtitle2: subtitle,
    // bodyText2: body2,
    // bodyText1: body1,
    // caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
