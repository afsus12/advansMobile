import 'package:flutter/widgets.dart';

class NotificationContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  NotificationContainer(
      {required this.title, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 98,
      color: Color(0xFFD9D9D9).withOpacity(0.25),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFD7359),
              ),
              margin: EdgeInsets.only(right: 20),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'poppins',
                    color: Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Center(
              child: Text(
                date,
                style: TextStyle(
                  color: Color(0xFFFD7359),
                  fontFamily: 'poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
