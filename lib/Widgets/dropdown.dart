import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  final String labelText;
  final List<String> project;
  final String hint;
  final bool? aligncenter;
  final Function()? ontap;
  final bool enabled;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? suffixIconOff;
  final Function()? suffixIconFun;
  final int lines;
  final String? what;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChangedProject;

  final String? Function(String?)? validate;
  final Function(String)? onSubmitted;
  final TextEditingController controller;
  final double? height;

  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  final FocusNode? focusNode;
  final Color? color;
  final double fontsize;

  const MyDropDown({
    required this.project,
    required this.labelText,
    required this.controller,
    this.color,
    this.height = 10,
    this.aligncenter,
    this.onChangedProject,
    this.suffixIconOff,
    this.suffixIcon,
    this.suffixIconFun,
    this.autofillHints,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction = TextInputAction.next,
    this.autoFocus = false,
    this.obscureText = false,
    this.lines = 1,
    this.ontap,
    this.fontsize = 15,
    Key? key,
    this.enabled = true,
    this.icon,
    this.hint = '',
    this.validate,
    this.what,
  }) : super(key: key);

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  late FocusNode focusNode;
  String? selectedValue;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    selectedValue =
        widget.controller.text.isNotEmpty ? widget.controller.text : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      iconSize: 0.0,
      items: widget.project.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(
            category,
            style: TextStyle(
              fontSize: widget.fontsize,
              fontFamily: "Roboto-Light",
            ),
          ),
        );
      }).toList(),
      autofocus: widget.autoFocus,
      focusNode: focusNode,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.controller.text = value!;
        if (widget.onChangedProject != null) {
          widget.onChangedProject!(value);
        }
      },
      value: selectedValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 15, horizontal: widget.height!),
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                color: focusNode.hasFocus
                    ? MyColors.SecondGreenColor
                    : MyColors.Strokecolor,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(
                  focusNode.hasFocus ? widget.suffixIcon : widget.suffixIconOff,
                  size: 30,
                  color: focusNode.hasFocus
                      ? MyColors.SecondGreenColor
                      : MyColors.Strokecolor,
                ),
                onPressed: widget.suffixIconFun,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(17),
        ),
        filled: true,
        fillColor: focusNode.hasFocus
            ? MyColors.SecondGreenColor.withOpacity(.1)
            : widget.color ?? MyColors.Strokecolor.withOpacity(.1),
        hintStyle: TextStyle(
          color: focusNode.hasFocus
              ? MyColors.SecondGreenColor
              : MyColors.Strokecolor,
          fontFamily: "Roboto-Light",
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
        focusColor: MyColors.SecondGreenColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.SecondGreenColor, width: 2.0),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
