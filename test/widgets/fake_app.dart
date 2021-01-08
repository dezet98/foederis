import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/utils/localizations.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthServiceMock extends Mock implements RemoteAuthService {}

class FakeApp extends StatelessWidget {
  final Widget child;
  final blocProviders;
  final Locale locale;

  FakeApp({@required this.child, this.blocProviders, this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: getMainRepositoryProviders(),
      child: blocProviders != null
          ? MultiBlocProvider(providers: blocProviders(), child: getApp())
          : getApp(),
    );
  }

  Widget getApp() {
    return PlatformProvider(
      builder: (BuildContext context) => PlatformApp(
        title: 'Engineering thesis',
        locale: locale != null ? locale : Locale('en', 'US'),
        localizationsDelegates: getLocalizationsDelegates,
        supportedLocales: S.delegate.supportedLocales,
        material: getMaterialAppData,
        cupertino: getCupertinoAppData,
        home: child,
      ),
    );
  }

  dynamic getMainRepositoryProviders() => [
        RepositoryProvider<RemoteAuthService>(
          create: (_) => RemoteAuthServiceMock(),
        ),
      ];
}
