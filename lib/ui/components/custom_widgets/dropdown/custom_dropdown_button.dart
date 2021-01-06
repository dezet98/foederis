import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton<ItemType> extends StatelessWidget {
  final List<ItemType> dropdownItems;
  final String Function(BuildContext, ItemType) getItemLabel;
  final bool enabled;
  final Function(ItemType) onChanged;
  final ItemType value;

  CustomDropdownButton({
    @required this.value,
    @required this.dropdownItems,
    @required this.getItemLabel,
    @required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ItemType>(
      value: value,
      items: [
        for (ItemType item in dropdownItems)
          _buildDropdownMenuItem(context, item),
      ],
      onChanged: !enabled ? null : onChanged,
    );
  }

  DropdownMenuItem _buildDropdownMenuItem(context, ItemType item) {
    return DropdownMenuItem<ItemType>(
      child: CustomText.formText(
        getItemLabel(context, item),
      ),
      value: item,
    );
  }
}
