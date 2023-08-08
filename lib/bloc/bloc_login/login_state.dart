part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {}
class LoginGoogleSuccess extends LoginState {}
class LoginGoogleError extends LoginState {}
class LoginVisibilityPass extends LoginState {}
