import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomDateTimePicker extends StatelessWidget {
  final DateTime date;
  final Function(DateTime newDate) dateChanged;
  final DateTime minDate;
  final DateTime maxDate;
  final bool enabled;

  CustomDateTimePicker({
    @required this.date,
    @required this.dateChanged,
    @required this.minDate,
    @required this.maxDate,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          date.toUtc().toString(),
          textType: TextType.text_button,
        ),
        SizedBox(
          width: Dimensions.gutterMedium,
        ),
        CustomButton.iconButton(
            materialIconData: Icons.date_range,
            cupertinoIconData: CupertinoIcons.time,
            enabled: enabled,
            onPressed: () {
              if (isMaterial(context))
                materialDatePicker(context);
              else
                cupertinoDatePicker(context);
            }),
      ],
    );
  }

  void materialDatePicker(BuildContext context) async {
    DateTime newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: minDate,
      lastDate: maxDate,
    );
    if (newDate != null) {
      TimeOfDay newTimeOfDay =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (newTimeOfDay != null) {
        newDate = DateTime.utc(newDate.year, newDate.month, newDate.day,
            newTimeOfDay.hour, newTimeOfDay.minute);

        dateChanged(newDate);
      }
    }
  }

  void cupertinoDatePicker(BuildContext context) async {
    showPlatformModalSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Palette.white,
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime newDate) {
                dateChanged(newDate);
              },
              minimumDate: minDate,
              maximumDate: maxDate,
            ),
          );
        });
  }
}
