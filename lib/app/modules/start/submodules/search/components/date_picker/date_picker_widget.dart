import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/modules/start/submodules/search/components/date_picker/date_picker_controller.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final String title;

  const DatePickerWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState
    extends ModularState<DatePickerWidget, DatePickerController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        GestureDetector(
          onTap: () async {
            var now = DateTime.now();
            var selectedDate = await showDatePicker(
              context: context,
              initialDate: now,
              firstDate: DateTime.utc(now.year - 1),
              lastDate: now,
            );

            if (widget.title == 'from') {
              controller.queryStore.setFromDate(selectedDate);
            } else {
              controller.queryStore.setToDate(selectedDate);
            }
          },
          child: Row(
            children: [
              Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Observer(builder: (_) {
                    return Text(
                      DateFormat('dd/MM/yyyy').format(
                        widget.title == 'from'
                            ? controller.queryStore.from
                            : controller.queryStore.to,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ],
    );
  }
}
