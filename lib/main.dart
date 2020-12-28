import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'generated/l10n.dart';
import 'shared/initialize_app.dart';
import 'shared/localizations.dart';
import 'shared/providers.dart';
import 'shared/routing.dart';
import 'shared/simple_bloc_observer.dart';
import 'shared/theme.dart';

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
