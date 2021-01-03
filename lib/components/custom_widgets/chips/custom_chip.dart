import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function(bool) onSelected;

  CustomChip({
    @required this.text,
    @required this.selected,
    @required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.gutterVerySmall),
      child: ChoiceChip(
        label: CustomText.button(text),
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }

  static Widget label({
    String label,
  }) {
    return Chip(
      label: CustomText.chipLabel(label),
    );
  }

  static Widget common({
    Widget child,
  }) {
    return Chip(
      label: child,
    );
  }
}
