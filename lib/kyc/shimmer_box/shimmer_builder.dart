import 'package:flutter/material.dart';
import 'package:swychr_kyc_sdk/kyc/shimmer_box/shimmer_widget.dart';

enum ShimmerBuilderType { grid, gridNoWidth, container, listVertical, listHorizontal }

/// This class contain Shimmer builder type like Listview and Gridview
/// with the help of [ADShimmerWidget] class it create shimmer in list or grid form
/// sample code
/// ShimmerBuilder(
///           shimmerBuilderType: ShimmerBuilderType.grid,
///           shimmerWidget: ShimmerWidget.shimmerShape(
///             type: ShimmerType.circleWithText,
///             height: 80,
///             width: 80,
///             detailTextWidth: 80,
///             detailTextHeight: 20,),
///           gridRowCount: 3,
///           itemCount: 6,
///         ),
//TODO write about class
class ADShimmerBuilder extends StatelessWidget {
  final int itemCount;
  final ShimmerBuilderType shimmerBuilderType;
  final int gridRowCount;
  final ShimmerWidget shimmerWidget;

  const ADShimmerBuilder({
    Key? key,
    this.itemCount = 1,
    required this.shimmerBuilderType,
    required this.shimmerWidget,
    this.gridRowCount = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    if (shimmerBuilderType == ShimmerBuilderType.listVertical) {
      return listBuilder(shimmerBuilderType, itemCount, shimmerWidget);
    }else if (shimmerBuilderType == ShimmerBuilderType.listHorizontal){
      return horizontalBuilder(shimmerBuilderType, itemCount, shimmerWidget);
    }

    else if (shimmerBuilderType == ShimmerBuilderType.grid) {
      return gridBuilder(gridRowCount, itemCount, shimmerWidget, width);
    } else if (shimmerBuilderType == ShimmerBuilderType.gridNoWidth) {
      return gridBuilderNoWidth(gridRowCount, itemCount, shimmerWidget);
    }

    else if (shimmerBuilderType == ShimmerBuilderType.container) {
      return containerBuilder(gridRowCount, itemCount, shimmerWidget);
    }

    else {
      return const Text('Loading...');
    }
  }

  Widget listBuilder(ShimmerBuilderType listType, int listItemCount,
      ShimmerWidget shimmerWidget) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listItemCount,
        scrollDirection: listType == ShimmerBuilderType.listHorizontal
            ? Axis.horizontal
            : Axis.vertical,
        itemBuilder: (BuildContext context, int index) => shimmerWidget);
  }

  Widget horizontalBuilder(ShimmerBuilderType listType, int listItemCount,
      ShimmerWidget shimmerWidget){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listItemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => shimmerWidget);

  }

  Widget gridBuilder(
      int gridRowCount, int itemCount, ShimmerWidget shimmerWidget, double width) {
    final double itemHeight = 120;
    final double itemWidth = width / 2;

    return GridView.count(
      crossAxisCount: gridRowCount,
      childAspectRatio: (itemWidth / itemHeight),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(itemCount, (index) {
        return shimmerWidget;
      }),
    );
  }

  Widget gridBuilderNoWidth(
      int gridRowCount, int itemCount, ShimmerWidget shimmerWidget) {
    final double itemHeight = 120;

    return GridView.count(
      crossAxisCount: gridRowCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(itemCount, (index) {
        return shimmerWidget;
      }),
    );
  }

  Widget containerBuilder(
      int gridRowCount, int itemCount, ShimmerWidget shimmerWidget) {
    return shimmerWidget;
  }


}
