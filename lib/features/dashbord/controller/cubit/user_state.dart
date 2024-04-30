part of 'user_cubit.dart';

// @immutable
sealed class UserState {}

final class UserCubitDartInitial extends UserState {}
final class UserLoaded extends UserState {}

final class UserEmpty extends UserState {}
