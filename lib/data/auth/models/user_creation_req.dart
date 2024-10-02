class UserCreationReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? gender;
  int? age;

  UserCreationReq({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
