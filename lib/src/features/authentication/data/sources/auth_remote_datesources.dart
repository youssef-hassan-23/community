import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../models/models.dart';

abstract interface class AuthenticationRemoteDataSource {
  Future<AuthenticationModel> signUp(
      {required String userName,
      required String email,
      required String password,
      required File? photoPath});
  Future<String> login({required String email, required String password});
  Future<void> uploadUserData(AuthenticationModel authenticationModel);
  Future<String> uploadProfileImage(File image);
  // Make API call to fetch data and return object.
  // ...
}

class AuthenticationRemoteDataSourceimpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<String> login(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!.uid;
  }

  @override
  Future<AuthenticationModel> signUp(
      {required String userName,
      required String email,
      required String password,
      required File? photoPath}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final imageurl = await uploadProfileImage(photoPath);

    final userData = AuthenticationModel(
        uId: await credential.user!.uid,
        name: userName,
        profilePicture: imageurl);

    return userData;
  }

  @override
  Future<void> uploadUserData(AuthenticationModel authenticationModel) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(authenticationModel.uId)
        .set(authenticationModel.toMap());
  }

  @override
  Future<String> uploadProfileImage(File? image) async {
    final imagePath = basename(image!.path);
    Reference refStorage =
        await FirebaseStorage.instance.ref("profile pictures/$imagePath");
    await refStorage.putFile(image);
    String url = await refStorage.getDownloadURL();

    return url;
  }
}
