import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home_screen.dart';
import 'package:engineering_thesis/screens/login_screen.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/router.dart' as Routing;
import 'package:engineering_thesis/shared/simple_bloc_observer.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        providers: getBlocProviders(),
        child: Builder(
          builder: (context) => PlatformProvider(
            builder: (BuildContext context) => PlatformApp(
              title: 'Engineering thesis',
              localizationsDelegates: _getLocalizationsDelegates,
              supportedLocales: S.delegate.supportedLocales,
              material: _getMaterialAppData,
              cupertino: _getCupertinoAppData,
              home: _buildFirstScreen,
              onGenerateRoute: Routing.Router.onGenerateRoute,
            ),
          ),
        ),
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
      theme: lightTheme,
      darkTheme: darkTheme,
    );

CupertinoAppData _getCupertinoAppData(context, __) => CupertinoAppData(
      theme: cupertinoTheme,
    );

Widget get _buildFirstScreen {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is AuthUserAuthenticatedState) {
        return HomeScreen();
      } else if (state is AuthUserUnauthenticatedState) {
        return LoginScreen();
      } else if (state is AuthInitialState) {
        return Routing.InformationScreen(
          content: Text('AuthInitialState'),
        );
      }
      return Routing.InformationScreen(
        // TODO never listen !
        content: Text('AuthVerificationState'),
      );
    },
  );
}
