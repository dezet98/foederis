import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  CustomCard({this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: CustomText.menuTitle(title),
        subtitle: CustomText.menuTitle(subtitle),
        onTap: onTap,
      ),
    );
  }
}
