import 'package:bloc_test/bloc_test.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/login/login_bloc.dart';
import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthServiceMock extends Mock implements RemoteAuthService {}

void main() {
  group('LoginBloc', () {
    RemoteAuthService authService;
    LoginBloc loginBloc;
    String email = 'daniel@gmail.com';
    String password = 'Qaz123';

    setUp(() {
      authService = RemoteAuthServiceMock();
      loginBloc = LoginBloc(authRepository: authService);
    });

    test('initial state is LoginInitialState', () {
      expect(loginBloc.state, LoginInitialState());
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => loginBloc,
      expect: [],
    );

    blocTest('emits LoginSuccessState when loginWithCredentials was succesfull',
        build: () {
          when(authService.signInWithEmailAndPassword(
                  email: email, password: password))
              .thenAnswer((_) => Future<void>.value());
          return loginBloc;
        },
        act: (bloc) async => bloc.add(
            LoginWithEmailAndPasswordEvent(email: email, password: password)),
        expect: [isA<LoginInProgressState>(), isA<LoginSuccessState>()],
        verify: (_) async {
          verify(authService.signInWithEmailAndPassword(
                  email: email, password: password))
              .called(1);
        });

    blocTest(
        'emits LoginFailureState when loginWithCredentials throw PlatformException',
        build: () {
          when(authService.signInWithEmailAndPassword(
                  email: email, password: password))
              .thenThrow((_) => PlatformException(code: 'error'));
          return loginBloc;
        },
        act: (bloc) async => bloc.add(
            LoginWithEmailAndPasswordEvent(email: email, password: password)),
        expect: [isA<LoginInProgressState>(), isA<LoginFailureState>()],
        verify: (_) async {
          verify(authService.signInWithEmailAndPassword(
                  email: email, password: password))
              .called(1);
        });
  });
}
