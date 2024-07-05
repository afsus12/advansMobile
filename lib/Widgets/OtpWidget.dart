import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OTPInput extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final bool first;
  final bool last;
  final TextEditingController controller;

  OTPInput({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.first,
    required this.last,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: TextField(
          onChanged: ((value) {
            if (value.isNotEmpty && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          }),
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
