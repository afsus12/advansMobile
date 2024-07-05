import 'package:flutter/material.dart';

class LoanAppContainer extends StatelessWidget {
  final int id;
  final String status;
  final String clientname;
  final String date;
  final double amount;
  final String customer;

  const LoanAppContainer(
      {super.key,
      required this.id,
      required this.status,
      required this.clientname,
      required this.date,
      required this.amount,
      required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [Text(date.toString()), Spacer(), Text(status)],
            ),
            Center(
              child: Text(clientname),
            ),
            Text(amount.toString())
          ],
        ),
      ),
    );
  }
}
