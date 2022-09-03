abstract class AppStates {}

class AppInitailState extends AppStates {}

class LoadingState extends AppStates {}

class CreateUserSucceedState extends AppStates {}

class CreateUserFailedState extends AppStates {
  String error;
  CreateUserFailedState({
    required this.error,
  });
}

class SignInUserSucceedState extends AppStates {}

class SignInUserFailedState extends AppStates {
  String error;
  SignInUserFailedState({
    required this.error,
  });
}

class StoreUserSucceedState extends AppStates {}

class StoreUserFailedState extends AppStates {}

class SignInWithGoogleUserSucceedState extends AppStates {}

class SignInWithGoogleUserFailedState extends AppStates {
  String error;
  SignInWithGoogleUserFailedState({
    required this.error,
  });
}

class SignInWithFacebookUserSucceedState extends AppStates {}

class SignInWithFacebookUserFailedState extends AppStates {
  String error;
  SignInWithFacebookUserFailedState({
    required this.error,
  });
}

class SignOutSucceedState extends AppStates {}

class SignOutFailedState extends AppStates {
  String error;
  SignOutFailedState({
    required this.error,
  });
}

class GetUserSucceedState extends AppStates {}

class GetUserFailedState extends AppStates {
  String error;
  GetUserFailedState({
    required this.error,
  });
}

class ChangeBottomNavBar extends AppStates {}

class PickProfileImageSucceedState extends AppStates {}

class PickProfileImageFailedState extends AppStates {}

class PickCoverImageSucceedState extends AppStates {}

class PickCoverImageFailedState extends AppStates {}

class UploadCoverImageSucceedState extends AppStates {}

class UploadCoverImageFailedState extends AppStates {}

class UploadProfileImageSucceedState extends AppStates {}

class UploadProfileImageFailedState extends AppStates {}

class UpdateUserDataFailedState extends AppStates {}

class UpdateUserCoverImageAndDataLoadingState extends AppStates {}

class UpdateUserProfileImageAndDataLoadingState extends AppStates {}

class ResetProfileImage extends AppStates {}

class ResetCoverImage extends AppStates {}
