import 'package:advans_app/Data/Controllers/ClientRepaymentMilestonesController.dart';
import 'package:advans_app/Models/PayMilestoneDTO.dart';

import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';

import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/Widgets/loanAppContainer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RepaymentMileStonesScreen extends GetView<RepaymentMilestonesController> {
  RepaymentMileStonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();
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

    MilestoneStatus getMilestoneStatus(DateTime dueDate, bool isPaid) {
      final now = DateTime.now();
      final difference = dueDate.difference(now).inDays;

      if (isPaid) {
        return MilestoneStatus(
          color: Colors.green,
          icon: Icons.check_circle,
          description: 'Paid',
        );
      } else if (difference < 0) {
        return MilestoneStatus(
          color: Colors.red,
          icon: Icons.error,
          description: 'Late',
        );
      } else if (difference == 0) {
        return MilestoneStatus(
          color: Colors.yellow,
          icon: Icons.warning,
          description: 'Due Today',
        );
      } else if (difference > 0 && difference <= 3) {
        return MilestoneStatus(
          color: Colors.orange,
          icon: Icons.access_time,
          description: 'Due Soon',
        );
      } else {
        return MilestoneStatus(
          color: Colors.grey,
          icon: Icons.schedule,
          description: 'Not Due Yet',
        );
      }
    }

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
              title: "Repayment MileStones",
              onPressedMenu: () {},
              onPressedNotification: () {},
            ),
          ),
        ),
        SliverList.list(children: [
          Column(
            children: [
              Obx(() => controller.milestones.isNotEmpty
                  ? Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final milestone = controller.milestones[index];
                          final dueDate = DateTime.parse(milestone['dueDate']);
                          final isPaid = milestone['paid'];
                          final status = getMilestoneStatus(dueDate, isPaid);
                          final paidOn = isPaid ? milestone['paidOn'] : null;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 16.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: status.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        status.icon,
                                        color: status.color,
                                      ),
                                      SizedBox(
                                          width:
                                              20), // Add some space between the icon and text

                                      SizedBox(width: 4),

                                      Spacer(),
                                      Text(milestone['dueDate']),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  if (isPaid)
                                    Text(
                                      'Paid on: $paidOn',
                                      textAlign: TextAlign.left,
                                    ),
                                  Row(
                                    children: [
                                      Text(
                                        isPaid
                                            ? 'Amount Payed'
                                            : 'Amount To Pay:',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '${_formatAmount(milestone['amount'])} ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
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
                                  Visibility(
                                    visible: !isPaid,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  MyColors.Mainyellow),
                                        ),
                                        icon: Icon(
                                          Icons.payment,
                                          color: Colors.black,
                                        ),
                                        label: Text(
                                          'Pay Now',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () async {
                                          bool? confirm =
                                              await showDialog<bool>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Confirm Payment'),
                                                content: Text(
                                                    'Are you sure you want to pay this milestone?'),
                                                actions: [
                                                  TextButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Continue'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (confirm == true) {
                                            final request = PayMilestoneDTO(
                                                userId:
                                                    controller.userCode.value,
                                                amount: milestone['amount']
                                                    as double);
                                            await controller.payMilestone(
                                                milestone['id'] as int,
                                                request);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: controller.milestones.length,
                      ),
                    )
                  : Center(child: Text('No loan applications found.'))),
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
                        onPressed: controller.currentPage.value <
                                controller.totalpages.value - 1
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
          )
        ])
      ])),
    );
  }
}

class MilestoneStatus {
  final Color color;
  final IconData icon;
  final String description;

  MilestoneStatus(
      {required this.color, required this.icon, required this.description});
}
