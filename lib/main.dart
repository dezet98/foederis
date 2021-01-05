import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/local_database/shared_preferences.dart';
import 'package:engineering_thesis/shared/providers/main_bloc_providers.dart';
import 'package:engineering_thesis/shared/providers/main_repository_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'generated/l10n.dart';
import 'shared/initialization/initialize_app.dart';
import 'shared/logger/simple_bloc_observer.dart';
import 'shared/routing/routing.dart';
import 'shared/utils/localizations.dart';
import 'shared/view/theme.dart';

void main() async {
  await InitializeApp.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: getMainRepositoryProviders(),
      child: MultiBlocProvider(
        providers: getMainBlocProviders(),
        child: PlatformProvider(
          builder: (BuildContext context) => PlatformApp(
            title: 'Engineering thesis',
            locale: Locale(SharedPreferences().languageCode,
                SharedPreferences().countryCode),
            localizationsDelegates: getLocalizationsDelegates,
            supportedLocales: S.delegate.supportedLocales,
            material: getMaterialAppData,
            cupertino: getCupertinoAppData,
            home: Routing.onGenerate(CommonRoutes.splash),
          ),
        ),
      ),
    );
  }
}
