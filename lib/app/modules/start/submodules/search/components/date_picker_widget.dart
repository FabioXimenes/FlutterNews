import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final String title;

  const DatePickerWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: [
            Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  '10/02/2021',
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.calendar_today),
          ],
        ),
      ],
    );
  }
}
