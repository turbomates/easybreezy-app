part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileFetchSuccess extends ProfileState {
  final Profile profile;

  ProfileFetchSuccess({@required this.profile});

  @override
  List<Object> get props => [profile];
}
