class UserProfile {
  static final UserProfile _instance = UserProfile._internal();

  factory UserProfile() {
    return _instance;
  }

  UserProfile._internal();

  String? username;
  String? email;
  String? phoneNumber;
  String? profilePictureUrl;



  void updateProfile({required String username, required String email, required String phoneNumber, String? profilePictureUrl}) {
    this.username = username;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.profilePictureUrl = profilePictureUrl;
  }

}
