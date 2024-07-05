import 'package:advans_app/Data/Controllers/TransactionHistoryController.dart';
import 'package:advans_app/Models/TransactionModel.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionHistoryScreen extends GetView<TransactionHistoryController> {
  TransactionHistoryScreen({super.key});

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
                  title: "Transaction History",
                  onPressedMenu: () {},
                  onPressedNotification: () {},
                ),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      TransactionModel transaction =
                          controller.transactions[index];
                      return TransactionItemWidget(transaction: transaction);
                    },
                    childCount: controller.transactions.length,
                  ),
                );
              }
            }),
            SliverToBoxAdapter(
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: controller.currentPage.value > 0
                            ? () {
                                controller.previousPage();
                              }
                            : null,
                      ),
                      Text('Page ${controller.currentPage.value + 1}'),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: controller.currentPage.value + 1 <
                                controller.totalPage.value
                            ? () {
                                controller.nextPage();
                              }
                            : null,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItemWidget extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItemWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            transaction.transtype == 'IN'
                ? Icons.arrow_upward
                : transaction.transtype == 'OUT'
                    ? Icons.arrow_downward
                    : Icons.arrow_forward,
            color: transaction.transtype == 'IN'
                ? Colors.green
                : transaction.transtype == 'OUT'
                    ? Colors.red
                    : Colors.grey,
            size: 24.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  transaction.transtype == 'IN'
                      ? '+ ${transaction.amount.toStringAsFixed(2)} TND'
                      : '- ${transaction.amount.toStringAsFixed(2)} TND',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: transaction.transtype == 'IN'
                        ? Colors.green
                        : transaction.transtype == 'OUT'
                            ? Colors.red
                            : Colors.grey,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  transaction.date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
