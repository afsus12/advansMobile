import 'package:advans_app/Utils/myColors.dart';
import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 3, right: 5, bottom: 5),
      height: 250,
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
                "Foulen ben Foulen",
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
