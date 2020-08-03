import 'package:easybreezy_app/profile/modals/modals.dart';
import 'package:flutter/material.dart';

class Profile {
  final Object bio;
  final String birthday;
  final String firstName;
  final String lastName;
  final List<String> skills;
  final String userId;
  final List<ProfileNote> notes;
  final List<ProfilePosition> positions;
  final List<ProfileSalary> salaries;

  Profile(
      {@required this.bio,
      @required this.birthday,
      @required this.firstName,
      @required this.lastName,
      @required this.skills,
      @required this.userId,
      @required this.notes,
      @required this.positions,
      @required this.salaries});

  factory Profile.fromJson(Map<String, dynamic> json, Function noteFromJSON,
      Function positionFromJSON, Function salaryFromJSON) {
    final noteJSON = json['notes'].cast<Map<String, dynamic>>();
    final positionJSON = json['positions'].cast<Map<String, dynamic>>();
    final salaryJSON = json['salaries'].cast<Map<String, dynamic>>();

    return Profile(
      bio: json['bio'] != null ? json['bio'] : null,
      birthday: json['birthday'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      skills:
          json['skills'] != null ? new List<String>.from(json['skills']) : null,
      userId: json['userId'],
      notes: List<ProfileNote>.from(
          noteJSON.map((itemsJson) => noteFromJSON(itemsJson))),
      positions: List<ProfilePosition>.from(
          positionJSON.map((itemsJson) => positionFromJSON(itemsJson))),
      salaries: List<ProfileSalary>.from(
          salaryJSON.map((itemsJson) => salaryFromJSON(itemsJson))),
    );
  }
}
