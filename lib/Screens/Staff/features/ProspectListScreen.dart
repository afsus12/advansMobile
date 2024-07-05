import 'package:advans_app/Data/Controllers/ProspectListController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/drawerStaff.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProspectListScreen extends GetView<ProspectListController> {
  // Pass the user code as a parameter

  ProspectListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AdvancedDrawerController _advancedDrawerController =
        AdvancedDrawerController();

    return AdvancedDrawer(
      drawer: SideMenuStaff(),
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
              MyColors.MainGreenColor.withOpacity(0.8),
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(routesGuide.preospectStaff);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor:
                MyColors.SecondGreenColor, // Customize the color of the FAB
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBarDelegate(
                minHeight: 80.0,
                maxHeight: 100.0,
                child: Appbar(
                  rmBorder: true,
                  name: "",
                  paddingtop: 30,
                  title: "Prospect List",
                  onPressedMenu: () => _advancedDrawerController.showDrawer(),
                  onPressedNotification: () {
                    // Handle notification press
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.MainGreenColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "Filter By ",
                                size: 20,
                              ),
                              Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil.defaultSize.width * 0.45.w,
                                child: Myinput(
                                  color: Colors.white,
                                  labelText: "First Name",
                                  icon: Icons.person,
                                  Suffixicon: Icons.search,
                                  Suffixiconoff: Icons.search,
                                  onChanged: (value) {
                                    controller.updateFilters(
                                        newFirstname: value);
                                  },
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: ScreenUtil.defaultSize.width * 0.45.w,
                                child: Myinput(
                                  color: Colors.white,
                                  icon: Icons.person,
                                  Suffixicon: Icons.search,
                                  Suffixiconoff: Icons.search,
                                  labelText: "Last Name",
                                  onChanged: (value) {
                                    controller.updateFilters(
                                        newLastname: value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: ScreenUtil.defaultSize.width * 0.6.w,
                            child: Myinput(
                              color: Colors.white,
                              icon: Icons.security,
                              Suffixicon: Icons.search,
                              Suffixiconoff: Icons.search,
                              labelText: "Customer Code",
                              onChanged: (value) {
                                controller.updateFilters(newCustomer: value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.prospects.length,
                        itemBuilder: (context, index) {
                          final prospect = controller.prospects[index];
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.person),
                              trailing: const SizedBox(
                                width: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    ),
                                    Icon(
                                      Icons.message,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                  '${prospect.firstname} ${prospect.lastname}'),
                              subtitle: Text(prospect.customer ?? ''),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: controller.currentPage.value > 0
                                ? () {
                                    controller.loadPreviousPage();
                                  }
                                : null,
                          ),
                          Text('Page ${controller.currentPage.value + 1}'),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: controller.prospects.length ==
                                    controller.pageSize.value
                                ? () {
                                    controller.loadNextPage();
                                  }
                                : null,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
