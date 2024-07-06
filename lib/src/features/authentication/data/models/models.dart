import '../../domain/entities/entities.dart';

class AuthenticationModel extends AuthenticationEntity {
  AuthenticationModel(
      {required super.uId, required super.name, required super.profilePicture});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'name': name,
      'profilePicture': profilePicture,
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      uId: map['uId'] as String,
      name: map['name'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

  // ...
  // A model is a more generic term and can represent structured data used within an application.
  // ...
  // fromJson
  // ...
  // toJson
}
