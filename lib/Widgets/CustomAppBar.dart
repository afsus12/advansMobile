import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar extends StatelessWidget {
  final String name;
  final Function? onPressedMenu;
  final bool? center;
  final Function? onPressedNotification;
  final double? appheight;
  final double? paddingtop;
  final String? title;
  final bool? rmBorder;
  const Appbar(
      {super.key,
      required this.name,
      this.appheight = 120,
      this.title = "",
      this.center = true,
      this.paddingtop = 15,
      this.rmBorder = false,
      this.onPressedMenu,
      this.onPressedNotification});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appheight!.h,
      padding: EdgeInsets.only(
          top: paddingtop!.h, left: 15.h, right: 15.w, bottom: 1.w),
      decoration: BoxDecoration(
          color: MyColors.MainGreenColor,
          borderRadius: rmBorder == false
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(0.r),
                  bottomRight: Radius.circular(0.r))),
      child: Column(
        crossAxisAlignment: center == true
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onPressedMenu as void Function()?,
                icon: Icon(
                  Icons.dashboard,
                  size: 30.h,
                  color: Colors.white,
                ),
              ),
              if (title!.isNotEmpty)
                Center(
                  child: Text(
                    title!,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              IconButton(
                  onPressed: onPressedNotification as void Function()?,
                  icon: Icon(
                    Icons.notifications,
                    size: 30.h,
                    color: Colors.white,
                  ))
            ],
          ),
          if (title!.isEmpty)
            SizedBox(
              height: 12,
            ),
          if (title!.isEmpty)
            Padding(
              padding: EdgeInsets.only(left: 3, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.greetingUser(name),
                style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
