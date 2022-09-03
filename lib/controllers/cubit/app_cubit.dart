import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';
import 'package:social_app/data/constant.dart';
import 'package:social_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/shared/style/icon_broken.dart';
import 'package:social_app/views/layout_screen/componants/chat_screen.dart';
import 'package:social_app/views/layout_screen/componants/home_screen.dart';
import 'package:social_app/views/layout_screen/componants/profile.dart';
import 'package:social_app/views/layout_screen/componants/settings.dart';
import 'package:social_app/views/layout_screen/componants/users_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitailState());
  static AppCubit get(context) => BlocProvider.of(context);
  String? userID;
  void createUser(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userID = value.user!.uid;
      storeUser(uID: value.user!.uid, name: name, email: email, phone: phone);

      emit(CreateUserSucceedState());
    }).catchError((error) {
      print('error from method create user : ${error.toString()}');
      emit(CreateUserFailedState(error: error.toString()));
    });
  }

  void storeUser(
      {required String uID,
      required String name,
      required String email,
      required String phone}) {
    UserModel user =
        UserModel(uID: uID, name: name, email: email, phone: phone);
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uID)
        .set(user.toMap())
        .then((value) {
      emit(StoreUserSucceedState());
    }).catchError((error) {
      print('error from method store user : ${error.toString()}');
      emit(StoreUserFailedState());
    });
  }

  signInUser({required String email, required String password}) {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userID = value.user!.uid;
      emit(SignInUserSucceedState());
    }).catchError((error) {
      print('error from method sign in user : ${error.toString()}');
      emit(SignInUserFailedState(error: error.toString()));
    });
  }

  late UserModel user;
  getUser() {
    emit(LoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .get()
        .then((value) {
      user = UserModel.fromMap(value.data()!);
      emit(GetUserSucceedState());
    }).catchError((error) {
      print('error from method get user : ${error.toString()}');
      emit(GetUserFailedState(error: error.toString()));
    });
  }

  signInWithGoogle() async {
    debugPrint('from sign on with google');

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emit(LoadingState());
    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      userID = value.user!.uid;
      storeUser(
          uID: value.user!.uid,
          name: value.user!.displayName!,
          email: value.user!.email!,
          phone: value.user!.phoneNumber ?? '');

      emit(SignInWithGoogleUserSucceedState());
    }).catchError((error) {
      print('error from method sign in with google user : ${error.toString()}');
      emit(SignInWithGoogleUserFailedState(error: error.toString()));
    });
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: (['email', 'public_profile']));

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    emit(LoadingState());
    // Once signed in, return the UserCredential
    FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((value) {
      userID = value.user!.uid;
      storeUser(
          uID: value.user!.uid,
          name: value.user!.displayName!,
          email: value.user!.email!,
          phone: value.user!.phoneNumber ?? '');
      emit(SignInWithFacebookUserSucceedState());
    }).catchError((error) {
      print(
          'error from method sign in with facebook user : ${error.toString()}');
      emit(SignInWithFacebookUserFailedState(error: error));
    });
  }

  signOut() {
    emit(LoadingState());
    GoogleSignIn().signOut().then((value) {
      emit(SignOutSucceedState());
    }).catchError((error) {
      print(
          'error from method sign out with google user : ${error.toString()}');
      emit(SignOutFailedState(error: error));
    });
    FacebookAuth.instance.logOut().then((value) {
      emit(SignOutSucceedState());
    }).catchError((error) {
      print(
          'error from method sign out with facebook user : ${error.toString()}');
      emit(SignOutFailedState(error: error));
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const UserScreen(),
    const ChatScreen(),
    const ProfileScreen(),
    const SettingScreen()
  ];
  List<String> screensTitle = ['Home', 'Users', 'Chat', 'Profile', 'Settings'];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.User), label: 'Users'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chat'),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.Profile), label: 'Profile'),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.Setting), label: 'Settings'),
  ];
  int currentIndex = 0;
  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(PickProfileImageSucceedState());
    } else {
      print('No image selected.');
      emit(PickProfileImageFailedState());
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(PickCoverImageSucceedState());
    } else {
      print('No image selected');
      emit(PickCoverImageFailedState());
    }
  }

  uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UpdateUserCoverImageAndDataLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/covers/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateProfile(name: name, phone: phone, bio: bio, cover: value);
        print('succeed');
        emit(UploadCoverImageSucceedState());
      }).catchError((error) {
        emit(UploadCoverImageFailedState());
      });
    }).catchError((error) {
      emit(UploadCoverImageFailedState());
    });
  }

  uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UpdateUserProfileImageAndDataLoadingState());
    FirebaseStorage.instance
        .ref()
        .child(
            'users/profiles/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateProfile(name: name, phone: phone, bio: bio, image: value);
        print('succeed');
        emit(UploadProfileImageSucceedState());
      }).catchError((error) {
        emit(UploadProfileImageFailedState());
      });
    }).catchError((error) {
      emit(UploadProfileImageFailedState());
    });
  }

  updateProfile(
      {required String name,
      required String phone,
      required String bio,
      String? cover,
      String? image}) {
    UserModel userModel = UserModel(
        name: name,
        phone: phone,
        bio: bio,
        uID: token.toString(),
        email: user.email,
        cover: cover ?? user.cover,
        image: image ?? user.image);
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .update(userModel.toMap())
        .then((value) {
      getUser();
    }).catchError((error) {
      emit(UpdateUserDataFailedState());
    });
  }

  resetProfileImage() {
    profileImage = null;
    emit(ResetProfileImage());
  }

  resetCoverImage() {
    coverImage = null;
    emit(ResetCoverImage());
  }
}
