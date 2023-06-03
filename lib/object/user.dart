class User {
  String email;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String? phoneNumber;

  User(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      this.phoneNumber});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        dateOfBirth = json['dateOfBirth'],
        phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
        'name': firstName,
        'email': email,
      };
}
