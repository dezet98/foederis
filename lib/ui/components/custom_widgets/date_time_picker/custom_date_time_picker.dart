import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/utils/dates.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
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
  final bool withHour;

  CustomDateTimePicker({
    @required this.date,
    @required this.dateChanged,
    @required this.minDate,
    @required this.maxDate,
    this.enabled = true,
    this.withHour = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.textButton(
            date == null
                ? S.of(context).date_time_picker_text
                : withHour
                    ? formatDate('dd-MM-yyyy hh:mm', date)
                    : formatDate('dd-MM-yyyy', date),
          ),
          SizedBox(
            width: Dimensions.gutterMedium,
          ),
          CustomIcon.datePicker
        ],
      ),
      onTap: !enabled
          ? null
          : () {
              if (isMaterial(context))
                materialDatePicker(context);
              else
                cupertinoDatePicker(context);
            },
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
      if (withHour) {
        TimeOfDay newTimeOfDay = await showTimePicker(
            context: context, initialTime: TimeOfDay.now());

        if (newTimeOfDay != null) {
          newDate = DateTime.utc(newDate.year, newDate.month, newDate.day,
              newTimeOfDay.hour, newTimeOfDay.minute);
        }

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
