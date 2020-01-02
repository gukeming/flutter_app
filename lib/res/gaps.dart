import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/res/dimens.dart';

// 间隔
class Gaps {
  // 水平间隔
  static const Widget h_gap4 = SizedBox(width: 4.0);
  static const Widget h_gap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget h_gap8 = SizedBox(width: 8.0);
  static const Widget h_gap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget h_gap12 = SizedBox(width: 12.0);
  static const Widget h_gap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget h_gap16 = SizedBox(width: Dimens.gap_dp16);
  // 垂直间隔
  static const Widget v_gap4 = SizedBox(height: 4.0);
  static const Widget v_gap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget v_gap8 = SizedBox(height: 8.0);
  static const Widget v_gap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget v_gap12 = SizedBox(height: 12.0);
  static const Widget v_gap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget v_gap16 = SizedBox(height: Dimens.gap_dp16);
  static const Widget v_gap50 = SizedBox(height: Dimens.gap_dp50);

//  static Widget line = const SizedBox(
//    height: 0.6,
//    width: double.infinity,
//    child: const DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
//  );

  static const Widget line = Divider();

  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox();
}
