import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/repository/authentication_repository.dart';
import 'package:shop/dr.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository authenticationRepository = locator.get();
  AuthBloc() : super(AuthenticationInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthSateLoading());
      // Simulate a network request

      var response = await authenticationRepository.login(
        event.username,
        event.password,
      );

      emit(AuthResponseState(response));
    });
  }
}
