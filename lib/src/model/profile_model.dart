
class ProfileModel {
  ProfileModel({
    required this.status,
    required this.user,
  });

  int status;
  User user;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"] ?? 0,
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
      );
}

class User {
  User({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.number,
    required this.chat,
  });

  String avatar;
  String firstName;
  String lastName;
  String nickname;
  String gender;
  String birthDate;
  String email;
  String number;
  int chat;

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        nickname: json["nickname"] ?? '',
        gender: json["gender"] ?? '',
        birthDate: json["birth_date"] ?? '',
        email: json["email"] ?? '',
        number: json["Number"] ?? '',
        chat: json["chat"] ?? 0,
      );
}
