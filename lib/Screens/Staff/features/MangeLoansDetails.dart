import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:advans_app/Data/Controllers/ManageLoansDetailsController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

class ManageLoansDetailsScreen extends GetView<ManageLoansDetailsController> {
  ManageLoansDetailsScreen({super.key});
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
        body: Obx(() {
          if (controller.loading.value) {
            return Center(child: CircularProgressIndicator());
          }

          final loan = controller.loanDetails.value;
          if (loan == null) {
            return Center(child: Text('Loan details not available'));
          }

          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverAppBarDelegate(
                  minHeight: 80.h,
                  maxHeight: 80.h,
                  child: Appbar(
                    name: "",
                    paddingtop: 30,
                    title: "Loan Application",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: EdgeInsets.all(12.w),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Loan Application Information",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(3),
                                    1: FlexColumnWidth(4),
                                  },
                                  border: TableBorder.all(
                                    color: Colors.grey.shade300,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  children: [
                                    _buildTableRow(
                                        "Client Name", loan.fullName ?? 'N/A'),
                                    _buildTableRow(
                                        "Customer ID", loan.customer ?? 'N/A'),
                                    _buildTableRow("Requested Credit Amount",
                                        "${loan.requestedCreditAmount ?? 'N/A'} TND"),
                                    _buildTableRow(
                                        "Application Date",
                                        loan.applicationDate != null
                                            ? DateFormat('MMM dd, yyyy')
                                                .format(loan.applicationDate!)
                                            : 'N/A'),
                                    _buildTableRow("Nationality",
                                        loan.nationalite ?? 'N/A'),
                                    _buildTableRow(
                                        "Age", loan.age.toString() ?? 'N/A'),
                                    _buildTableRow("Experience Duration",
                                        loan.experienceDuration ?? 'N/A'),
                                    _buildTableRow("Loan Purpose",
                                        loan.loanPurpose ?? 'N/A'),
                                    _buildTableRow("Product Name",
                                        loan.productName ?? 'N/A'),
                                    _buildTableRow("Governorate",
                                        loan.governorat ?? 'N/A'),
                                    _buildTableRow("Activity Address",
                                        loan.activityAdresse ?? 'N/A'),
                                    _buildTableRow("Activity Type",
                                        loan.activityType ?? 'N/A'),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                _buildSupportingDocumentWidget(loan.doc ?? []),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 45.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Colors.red, // Background color
                                          onPrimary: Colors
                                              .white, // Text and icon color
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Refuse"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.cancel_outlined,
                                              size: 25,
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          controller.refuseLoan(loan.id!);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                      width: 130.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Colors.green, // Background color
                                          onPrimary: Colors
                                              .white, // Text and icon color
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Accept"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.check,
                                              size: 25,
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          controller.acceptLoan(loan.id!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget _buildSupportingDocumentWidget(List<String> documentPaths) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Supporting Documents:",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 120.h, // Set a fixed height for the list
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: documentPaths.length,
          itemBuilder: (context, index) {
            String filePath = documentPaths[index];
            bool isImage = filePath.endsWith('.jpg') ||
                filePath.endsWith('.jpeg') ||
                filePath.endsWith('.png') ||
                filePath.endsWith('.gif');
            return Container(
              margin: EdgeInsets.only(right: 10.w),
              child: isImage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImageZoomScreen(imageUrl: filePath),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          filePath,
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image: $error');
                            return Text('Failed to load image');
                          },
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () => _downloadFile(filePath),
                      child: Text("Download ${filePath.split('/').last}"),
                    ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
        ),
      ),
    ],
  );
}

class ImageZoomScreen extends StatelessWidget {
  final String imageUrl;

  ImageZoomScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Image'),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}

TableRow _buildTableRow(String title, String value) {
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(8.w),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.w),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    ],
  );
}

Future<void> _downloadFile(String fileUrl) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${fileUrl.split('/').last}');
  HttpClient httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(fileUrl));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  await file.writeAsBytes(bytes);

  OpenFile.open(file.path);
}
