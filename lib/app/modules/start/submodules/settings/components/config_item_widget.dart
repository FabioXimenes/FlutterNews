import 'package:flutter/material.dart';

class ConfigItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const ConfigItemWidget({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: _size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey[300],
            ),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
          ),
          Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ]),
      ),
    );
  }
}
