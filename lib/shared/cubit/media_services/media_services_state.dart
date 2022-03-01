part of 'media_services_cubit.dart';

@immutable
abstract class MediaServicesState {}

class MediaServicesInitial extends MediaServicesState {}

class MediaChangeState extends MediaServicesState {}

/// Get Image
class GetImageSuccessState extends MediaServicesState{}

class NoGetImageState extends MediaServicesState{}