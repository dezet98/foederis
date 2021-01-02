import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<dynamic> dropdownItems;
  final String Function(BuildContext, dynamic) getItemLabel;
  final bool enabled;
  final Function(dynamic) onChanged;
  final dynamic value;

  CustomDropdownButton({
    @required this.value,
    @required this.dropdownItems,
    @required this.getItemLabel,
    @required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: [
        for (dynamic item in dropdownItems)
          _buildDropdownMenuItem(context, item),
      ],
      onChanged: !enabled ? null : onChanged,
    );
  }

  DropdownMenuItem _buildDropdownMenuItem(context, dynamic item) {
    return DropdownMenuItem(
      child: Text(
        getItemLabel(context, item),
      ),
      value: item,
    );
  }
}
