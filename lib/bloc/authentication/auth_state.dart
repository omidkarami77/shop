part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthenticationInitial extends AuthState {}

class AuthSateLoading extends AuthState {}

class AuthResponseState extends AuthState {
  final Either<String, String> response;

  AuthResponseState(this.response);
}
