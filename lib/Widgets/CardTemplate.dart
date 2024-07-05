import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTemplate extends StatelessWidget {
  final String name;
  const CardTemplate({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, top: 3.h, right: 5.w, bottom: 5.h),
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColors.MainGreenColor.withOpacity(.822)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/image.png",
                width: 80,
                height: 100,
              ),
              Image.asset(
                "assets/images/postTunisie.png",
                width: 80,
                height: 100,
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/puce.png",
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_left_outlined,
                size: 50,
              ),
              new Spacer(),
              Image.asset(
                "assets/images/masterCard.png",
                width: 60,
                height: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}
