// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LogoutSuccess extends HomeState {}
class LogoutError extends HomeState {}
class HomeUserData extends HomeState{
  UserModel userModel;
  HomeUserData(this.userModel);
}
class HomeUserDataError extends HomeState{}
class HomeShowSnacBar extends HomeState{}
class VerifiedEmailSuccess extends HomeState{}
class VerifiedEmailError extends HomeState{}
