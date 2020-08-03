import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:easybreezy_app/profile/modals/modals.dart';
import 'package:easybreezy_app/profile/repositories/repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({@required this.profileRepository}) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is FetchedProfile) {
      final json = await profileRepository.fetch(event.id);

      final Profile profile = Profile.fromJson(json, ProfileNote.fromJson,
          ProfilePosition.fromJson, ProfileSalary.fromJson);

      if (profile != null) {
        yield ProfileFetchSuccess(profile: profile);
      }

      print(profile);
    }
  }
}
