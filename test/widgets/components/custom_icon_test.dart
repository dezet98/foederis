import 'dart:io';

import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fake_app.dart';

void main() {
  testWidgets('Icons work correctly', (WidgetTester tester) async {
    await tester.pumpWidget(FakeApp(child: CustomIcon.add));

    await tester.pumpAndSettle();

    final iconFinder =
        find.byIcon(Platform.isMacOS ? CupertinoIcons.add : Icons.add);

    expect(iconFinder, findsOneWidget);
  });
}
