part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UpcomingLaunchesGetLoadingState extends HomeState {}
class UpcomingLaunchesGetSuccessState extends HomeState {}
class UpcomingLaunchesGetChangeState extends HomeState {}
class UpcomingLaunchesGetErrorState extends HomeState {}

class PastLaunchesGetLoadingState extends HomeState {}
class PastLaunchesGetSuccessState extends HomeState {}
class PastLaunchesGetErrorState extends HomeState {}

class LaunchPadGetLoadingState extends HomeState {}
class LaunchPadGetSuccessState extends HomeState {}
class LaunchPadGetErrorState extends HomeState {}

class RocketGetLoadingState extends HomeState {}
class RocketGetSuccessState extends HomeState {}
class RocketGetErrorState extends HomeState {}
