import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/localizations.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/simple_bloc_observer.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      providers: getRepositoryProviders(),
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
