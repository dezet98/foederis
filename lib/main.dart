import 'package:engineering_thesis/shared/router.dart' as Routing;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (BuildContext context) => PlatformApp(
        title: 'Engineering thesis',
        localizationsDelegates: _getLocalizationsDelegates,
        supportedLocales: S.delegate.supportedLocales,
        material: _getMaterialAppData,
        cupertino: _getCupertinoAppData,
        onGenerateRoute: Routing.Router.onGenerateRoute,
      ),
    );
  }
}

Iterable<LocalizationsDelegate<dynamic>> get _getLocalizationsDelegates => [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

MaterialAppData _getMaterialAppData(_, __) => MaterialAppData(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );

CupertinoAppData _getCupertinoAppData(_, __) =>
    CupertinoAppData(theme: CupertinoThemeData());
