import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoanCatgeroieWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description1;
  final String description2;
  final double? width;
  final double? padding;
  final bool? center;
  const LoanCatgeroieWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description1,
      this.width = 200,
      this.center = false,
      this.padding = 10,
      required this.description2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 5, bottom: padding!),
      width: width!.w,
      decoration: BoxDecoration(
          color: MyColors.inputcolorfill.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 50.w,
            color: MyColors.MainGreenColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: this.center == false
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.square,
                  size: 10,
                  color: MyColors.SecondGreenColor,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    description1,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: this.center == false
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.square,
                  size: 10,
                  color: MyColors.SecondGreenColor,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    description2,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
