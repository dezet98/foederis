import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../theme.dart';

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
        label: CustomText(text, textType: TextType.button),
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }
}