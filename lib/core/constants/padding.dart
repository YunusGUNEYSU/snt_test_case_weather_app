import 'package:flutter/material.dart';

final class AppPadding extends EdgeInsets{
  ///12
 const AppPadding.allNormal() : super.all(12);
 ///8
 const AppPadding.allLow() : super.all(8);
 /// 16
 const AppPadding.allHigh() : super.all(16);
 /// 16
 const AppPadding.bottomHigh() : super.only(bottom: 16);
 ///16
 const AppPadding.leftHigh() : super.only(left: 16);

}