import 'package:bloc_test/bloc_test.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/register/register_bloc.dart';
import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthServiceMock extends Mock implements RemoteAuthService {}

void main() {
  group('RegisterBloc', () {
    RemoteAuthService authService;
    RegisterBloc registerBloc;
    String email = 'daniel@gmail.com';
    String password = 'Qaz123';

    setUp(() {
      authService = RemoteAuthServiceMock();
      registerBloc = RegisterBloc(authRepository: authService);
    });

    test('initial state is RegisterInitialState', () {
      expect(registerBloc.state, RegisterInitialState());
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => registerBloc,
      expect: [],
    );

    blocTest(
        'emits RegisterSuccessState when createUserWithEmailAndPassword was succesfull',
        build: () {
          when(authService.createUserWithEmailAndPassword(
                  email: email, password: password))
              .thenAnswer((_) => Future<void>.value());
          return registerBloc;
        },
        act: (bloc) async => bloc.add(RegisterUserWithEmailAndPasswordEvent(
            email: email, password: password)),
        expect: [isA<RegisterInProgressState>(), isA<RegisterSuccessState>()],
        verify: (_) async {
          verify(authService.createUserWithEmailAndPassword(
                  email: email, password: password))
              .called(1);
        });

    blocTest(
        'emits RegisterFailureState when signInWithEmailAndPassword throw Exception',
        build: () {
          when(authService.createUserWithEmailAndPassword(
                  email: email, password: password))
              .thenThrow((_) => Exception());
          return registerBloc;
        },
        act: (bloc) async => bloc.add(RegisterUserWithEmailAndPasswordEvent(
            email: email, password: password)),
        expect: [isA<RegisterInProgressState>(), isA<RegisterFailureState>()],
        verify: (_) async {
          verify(authService.createUserWithEmailAndPassword(
                  email: email, password: password))
              .called(1);
        });
  });
}
