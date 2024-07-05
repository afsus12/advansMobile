import 'package:flutter/material.dart';

import '../utils/ColorsAndThemes/myColors.dart';

class Myinput extends StatefulWidget {
  final String labelText;
  final String hint;
  final bool? aligncenter;
  final Function()? ontap;
  final bool enabled;
  final IconData? icon;
  final IconData? Suffixicon;
  final IconData? Suffixiconoff;
  final double? height;
  final Function()? suffixiconfun;
  final int lines;
  final String? what;
  final Iterable<String>? AutofillHints;
  final Function(String)? onChanged;
  final String? Function(String?)? validate;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  final FocusNode? focusNode;
  final Color? color;
  final int? maxlength;
  final double fontsize;
  final Color? textColor;
  final double? width;
  final String? currency;

  const Myinput(
      {required this.labelText,
      this.color,
      this.maxlength,
      this.textColor,
      this.aligncenter,
      this.onChanged,
      this.Suffixiconoff,
      this.height = 12,
      this.width = 10,
      this.Suffixicon,
      this.suffixiconfun,
      this.AutofillHints,
      this.onSubmitted,
      this.currency,
      this.focusNode,
      this.errorText,
      this.keyboardType = TextInputType.multiline,
      this.textInputAction = TextInputAction.next,
      this.autoFocus = false,
      this.obscureText = false,
      this.lines = 1,
      this.ontap,
      Key? key,
      this.enabled = true,
      this.icon,
      this.hint = '',
      this.fontsize = 15,
      this.validate,
      this.what,
      this.controller})
      : super(key: key);

  @override
  State<Myinput> createState() => _MyinputState();
}

class _MyinputState extends State<Myinput> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      focusNode: focusNode,
      onTap: widget.ontap,
      textAlign: widget.aligncenter == true ? TextAlign.center : TextAlign.left,
      enabled: widget.enabled,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto-Regular",
        fontSize: widget.fontsize,
      ),
      cursorColor: MyColors.blackbackground2,
      initialValue: widget.what,
      autofillHints: widget.AutofillHints,
      keyboardType: widget.keyboardType,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: (v) {},
      validator: widget.validate,
      maxLines: widget.lines,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.width!, horizontal: widget.height!),
        prefixIcon: Icon(
          widget.icon,
          color: focusNode.hasFocus
              ? MyColors.SecondGreenColor
              : MyColors.Strokecolor,
        ),
        suffixIcon: widget.currency == null
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? widget.Suffixicon : widget.Suffixiconoff,
                  color: focusNode.hasFocus
                      ? MyColors.SecondGreenColor
                      : MyColors.Strokecolor,
                ),
                onPressed: widget.suffixiconfun,
              )
            : SizedBox(
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.currency!,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MyColors.SecondGreenColor),
                      ),
                    ],
                  ),
                ),
              ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(17)),
        filled: true,
        fillColor: focusNode.hasFocus
            ? widget.color == null
                ? MyColors.SecondGreenColor.withOpacity(.1)
                : widget.color
            : widget.color == null
                ? MyColors.Strokecolor.withOpacity(.1)
                : widget.color,
        hintText: widget.labelText,
        hintStyle: TextStyle(
          color: focusNode.hasFocus
              ? MyColors.SecondGreenColor
              : widget.textColor != null
                  ? widget.textColor
                  : MyColors.Strokecolor,
          fontFamily: "Roboto-Light",
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        focusColor: MyColors.SecondGreenColor,
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyColors.SecondGreenColor, width: 2.0),
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
