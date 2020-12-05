import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomCard({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: CustomText(title, textType: TextType.menu_title),
        subtitle: CustomText('1 / 3', textType: TextType.modal_text),
        leading: Icon(Icons.ac_unit_outlined),
      ),
    );
  }
}
