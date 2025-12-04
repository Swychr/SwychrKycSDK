import 'package:flutter/material.dart';
import 'package:swychr_kyc_sdk/kyc/shimmer_box/shimmer.dart';

import '../common/master_color.dart';




enum ShimmerType {
  circle,
  squareBox,
  circleWithText,
  rectangleBox,
  rectangleImageText,
  rectangleFull,
}

/// This class contain multiple type of Shimmer.
/// sample code
/// ShimmerWidget.shimmerShape(
///           type: ShimmerType.rectangleBox,
///           width: 180,
///           height: 20,
///         ),
//TODO write about class,add dynamaic color and scalling
class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double detailTextHeight;
  final double detailTextWidth;
  final ShimmerType type;
  final EdgeInsets? rectanglePadding;

  const ShimmerWidget.shimmerShape({
    Key? key,
    this.width = 1,
    this.height = 1,
    required this.type,
    this.detailTextHeight = 0.0,
    this.detailTextWidth = 0.0,
    this.rectanglePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ADShimmer.fromColors(
      baseColor: LightColor.baseShimmerColor,
      highlightColor: LightColor.highlightShimmerColor,
      period: const Duration(seconds: 1),
      child: layoutMaker(type, height, width, detailTextWidth, detailTextHeight,
          rectanglePadding, context));
}

Widget layoutMaker(
    ShimmerType type,
    double height,
    double width,
    double detailTextWidth,
    double detailTextHeight,
    EdgeInsets? rectanglePadding,
    BuildContext context) {
  switch (type) {
    case ShimmerType.circle:
      return circular(height, width, context);
    case ShimmerType.rectangleBox:
      return rectangleBox(height, width, rectanglePadding, context);
    case ShimmerType.rectangleImageText:
      return rectangleImageText(
          height, width, detailTextWidth, detailTextHeight, context);
    case ShimmerType.circleWithText:
      return circleWithText(
          height, width, detailTextWidth, detailTextHeight, context);
    case ShimmerType.squareBox:
      return squareBox(height, width, context);
    case ShimmerType.rectangleFull:
      return rectangleFull(height, width, rectanglePadding, context);
  }
}

Widget circular(double height, double width, BuildContext context) {
  return Container(
    width: width,
    height: height,
    decoration: const BoxDecoration(
      color: LightColor.shimmerColor,
      shape: BoxShape.circle,
    ),
  );
}

Widget squareBox(double height, double width, BuildContext context) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: LightColor.shimmerColor,
    ),
  );
}

Widget rectangleBox(
    double height, double width, EdgeInsets? padding, BuildContext context) {
  return Container(
    margin: padding ??
        const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: LightColor.shimmerColor,
    ),
  );
}



Widget circleWithText(double height, double width, double detailTextWidth,
    double detailTextHeight, BuildContext context) {
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            color: LightColor.shimmerColor, shape: BoxShape.circle),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: detailTextWidth,
        height: detailTextHeight,
        child: const DecoratedBox(
          decoration: BoxDecoration(color: LightColor.shimmerColor),
        ),
      ),
    ],
  );
}

Widget rectangleImageText(double height, double width, double detailTextWidth,
    double detailTextHeight, BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: LightColor.shimmerColor,
                ),
              ),
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: detailTextWidth,
                        height: detailTextHeight,
                        child: const DecoratedBox(
                          decoration:
                          BoxDecoration(color: LightColor.shimmerColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: detailTextWidth,
                        height: detailTextHeight,
                        child: const DecoratedBox(
                          decoration:
                          BoxDecoration(color: LightColor.shimmerColor),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ));
}



Widget rectangleFull(
    double height, double width, EdgeInsets? padding, BuildContext context) {
  return Container(
    margin: padding ??
        const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: LightColor.shimmerColor,
    ),
  );
}
