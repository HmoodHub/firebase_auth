part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterVisibilityPass extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterError extends RegisterState {}
class RegisterGoogleSuccess extends RegisterState {}
class RegisterGoogleError extends RegisterState {}
