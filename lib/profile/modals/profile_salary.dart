class ProfileSalary {
  final int amount;
  final String comment;
  final String id;
  final String since;
  final String till;

  ProfileSalary({this.amount, this.comment, this.id, this.since, this.till});

  static ProfileSalary fromJson(Map<String, dynamic> json) {
    return ProfileSalary(
      amount: json['amount'],
      comment: json['comment'],
      id: json['id'],
      since: json['since'],
      till: json['till'],
    );
  }
}
