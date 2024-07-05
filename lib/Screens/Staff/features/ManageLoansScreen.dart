import 'package:advans_app/Data/Controllers/manageLoansController.dart';
import 'package:advans_app/Screens/Staff/features/MangeLoansDetails.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/Widgets/loanAppContainer.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ManageLoansScreen extends GetView<ManageLoansController> {
  ManageLoansScreen({Key? key}) : super(key: key);

  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
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
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBarDelegate(
                minHeight: 80.h,
                maxHeight: 80.h,
                child: Appbar(
                  name: "",
                  paddingtop: 30,
                  title: "Manage Loans",
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 150.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Myinput(
                                  labelText: "Search",
                                  Suffixiconoff: Icons.search,
                                  Suffixicon: Icons.search,
                                  onChanged: (v) => {},
                                  suffixiconfun: () {},
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                MyDropDown(
                                    project: const [
                                      "ALL",
                                      "STEP1_VERIFIED",
                                      "IN_PROGRESS",
                                      "FULLY_VERIFIED",
                                      "REFUSED"
                                    ],
                                    labelText: "Filter By",
                                    onChangedProject: (p) {
                                      if (p == "ALL") {
                                        p = "";
                                      }
                                      controller.updateFilters(newStatus: p);
                                    },
                                    controller: controller.filter.value),
                              ],
                            ),
                          ),
                        ),
                        Obx(() => controller.loanApplications.isNotEmpty
                            ? Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final loan =
                                        controller.loanApplications[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.offNamed(
                                            routesGuide.mangeLoanDetailScreen,
                                            arguments: loan.id);
                                      },
                                      child: LoanAppContainer(
                                          id: loan.id,
                                          status: loan.status,
                                          clientname: loan.fullname,
                                          date: loan.productName,
                                          amount: loan.requestedCreditAmount,
                                          customer: loan.customer),
                                    );
                                  },
                                  itemCount: controller.loanApplications.length,
                                ),
                              )
                            : Center(
                                child: Text('No loan applications found.'))),
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
                                Text(
                                    'Page ${controller.currentPage.value + 1}'),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed:
                                      controller.loanApplications.length ==
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
          ],
        ),
      ),
    );
  }
}
