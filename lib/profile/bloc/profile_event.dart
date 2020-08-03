part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchedProfile extends ProfileEvent {
  final String id;

  FetchedProfile({@required this.id});

  @override
  List<Object> get props => [id];
}
