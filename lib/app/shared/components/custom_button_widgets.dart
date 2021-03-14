import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isLoading;

  const CustomButtonWidget(
      {Key key,
      @required this.title,
      @required this.onPressed,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: RaisedButton(
        disabledColor: Colors.grey,
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 16),
              ),
      ),
    );
  }
}
