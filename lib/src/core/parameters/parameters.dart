// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterParameters {
  String? name;
  final String email;
  final String password;
  RegisterParameters({required this.email, required this.password, this.name});
}

class LoginParameters {
  final String email;
  final String password;
  LoginParameters({
    required this.email,
    required this.password,
  });
}

class PostParameters {
  DateTime date = DateTime.now();
  String caption;
  List<String> imageUrls;
  String userImage;
  String userName;
  PostParameters({
    required this.caption,
    required this.imageUrls,
    required this.userImage,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'caption': caption,
      'imagePaths': imageUrls,
      'userImage': userImage,
      'userName': userName,
    };
  }
}
