import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Iterable<LocalizationsDelegate<dynamic>> get getLocalizationsDelegates => [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
