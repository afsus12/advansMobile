import 'package:advans_app/Data/Controllers/ClientActiveLoansController.dart';

import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';

import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/routes/routes_guide.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActifLoansScreen extends GetView<ClientActiveLoansController> {
  ActifLoansScreen({super.key});
  final NumberFormat _currencyFormat = NumberFormat("#,##0.###", "en_US");
  String _formatAmount(double amount) {
    if (amount == null) return '';
    if (amount == amount.toInt()) {
      // No decimals, display without ".00"
      return _currencyFormat.format(amount.toInt()).replaceAll(',', ' ');
    } else {
      // Has decimals, format with ".###"
      return _currencyFormat.format(amount).replaceAll(',', ' ');
    }
  }

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
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
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
                title: "Active loans",
                onPressedMenu: () {},
                onPressedNotification: () {},
              ),
            ),
          ),
          Obx(() {
            if (controller.loading.value) {
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (controller.loans.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(child: Text('No active loans found.')),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var loan = controller.loans[index];

                  double remainingAmount =
                      loan['totalAmount'] - loan['payedAmount'];

                  return InkWell(
                    onTap: () {
                      Get.toNamed(routesGuide.repaymentMilestonesScreen,
                          arguments: {'loanId': loan['id']});
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'loan number: ${loan['id']}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  'Due Date: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(loan['dueDate']))}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                                color: MyColors.SecondGreenColor,
                                thickness: 2,
                                height: 2),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${loan['loanType']}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  loan['status'] == 'IN_PROGRESS'
                                      ? Icons.sync
                                      : Icons.check_circle,
                                  color: loan['status'] == 'IN_PROGRESS'
                                      ? Colors.orange
                                      : Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Repayment Amount:',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '${_formatAmount(loan['totalAmount'])} ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            TextSpan(
                                              text: 'TND',
                                              style: TextStyle(
                                                  wordSpacing: 3,
                                                  letterSpacing: 2,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Remaining Amount: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '${_formatAmount(remainingAmount)} ',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18),
                                            ),
                                            TextSpan(
                                              text: 'TND',
                                              style: TextStyle(
                                                  wordSpacing: 3,
                                                  letterSpacing: 2,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Interest Rate:",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '${loan['interestRate'].toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Months to Repay:",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '${loan['numberOfMonthsToRepay']}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Payed Amount: ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '${_formatAmount(loan['payedAmount'])} ',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                            TextSpan(
                                              text: 'TND',
                                              style: TextStyle(
                                                  wordSpacing: 3,
                                                  letterSpacing: 2,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: controller.loans.length,
              ),
            );
          }),
        ]),
      ),
    );
  }
}
