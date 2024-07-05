import 'package:advans_app/Data/Controllers/ManageAccountController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManageAccountScreen extends GetView<ManageAccountController> {
  ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      drawer: SideMenu(),
      openRatio: 0.60,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MyColors.MainGreenColor,
              MyColors.MainGreenColor.withOpacity(0.8)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppBarDelegate(
              minHeight: 80.h,
              maxHeight: 80.h,
              child: Appbar(
                name: "",
                paddingtop: 30,
                title: "Manage Account",
                onPressedMenu: () {},
                onPressedNotification: () {},
              ),
            ),
          ),
          SliverList.list(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "First Name"),
                    onChanged: (value) => controller.name.value = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Last Name"),
                    onChanged: (value) => controller.lname.value = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Email"),
                    onChanged: (value) => controller.email.value = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Phone Number"),
                    onChanged: (value) => controller.phoneNumber.value = value,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final details = {
                        "first_name": controller.name.value,
                        "last_name": controller.lname.value,
                        "email": controller.email.value,
                        "phone_number": controller.phoneNumber.value,
                      };
                      await controller.updateAccountDetails(details);
                    },
                    child: Text("Update Account"),
                  )
                ],
              ),
            )
          ])
        ]),
      ),
    );
  }
}
