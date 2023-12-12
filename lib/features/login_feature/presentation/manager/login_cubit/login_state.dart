part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}
class LoginSuccessfully extends LoginState{
  final String token;
  LoginSuccessfully(this.token);
}
class LoginError extends LoginState{
  final String message;
  LoginError(this.message);
}
