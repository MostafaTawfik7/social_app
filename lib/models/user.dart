class UserModel {
  String uID;
  String name;
  String phone;
  String email;
  String image;
  String cover;
  String bio;
  UserModel(
      {required this.uID,
      required this.name,
      required this.phone,
      required this.email,
      this.image =
          'https://img.freepik.com/free-photo/sign-affection-admiration-pretty-curly-woman-presses-palms-heart-being-grateful-gift-wears-yellow-t-shirt-poses-rosy-wall-says-you-are-always-my-heart-smiles-gently_273609-42551.jpg?w=740&t=st=1661642788~exp=1661643388~hmac=63b0b7b6c4a5bd6ae70d8895a1e568459bca3b685165c873be0181f710b745a7',
      this.bio = 'write your bio ...',
      this.cover =
          'https://img.freepik.com/free-photo/laptop-wooden-table_53876-20635.jpg?w=740&t=st=1661644743~exp=1661645343~hmac=abcff5ed0a522536527b4a6bf747fcc2083d0ed39b727ce59f449e1437701a76'});

  Map<String, dynamic> toMap() {
    return {
      'uID': uID,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
      'bio': bio,
      'cover': cover
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uID: map['uID'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      image: map['image'],
      bio: map['bio'],
      cover: map['cover'],
    );
  }
}
