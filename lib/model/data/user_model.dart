class UserInformation {
  final String username;
  final String email;
  final String uid;
  final String userImage;
  final DateTime dateBirth;
  final int weight;
  final bool isMale;
  final int height;
  final bool improveShape;
  final bool leanTone;
  final bool loseFat;
  final String phoneNumber;

  UserInformation({
    required this.username,
    required this.email,
    required this.uid,
    required this.userImage,
    required this.dateBirth,
    required this.weight,
    required this.isMale,
    required this.height,
    required this.improveShape,
    required this.leanTone,
    required this.loseFat,
    required this.phoneNumber,
  });

  Map<String, Object> toMap() {
    return {
      'fullName': username,
      'email': email,
      'uid': uid,
      'userImage': userImage,
      'dateOfBirth': dateBirth,
      'weight': weight,
      'genderMale': isMale,
      'height': height,
      'improveShape': improveShape,
      'leanTone': leanTone,
      'loseFat': loseFat,
      'phoneNumber': phoneNumber,
    };
  }
  factory UserInformation.fromMap(Map<String, dynamic> map) {
    return UserInformation(
      username: map['fullName'],
      email: map['email'],
      uid: map['uid'],
      userImage: map['userImage'],
      dateBirth: DateTime.parse(map['dateOfBirth']),
      weight: map['weight'],
      isMale: map['genderMale'],
      height: map['height'],
      improveShape: map['improveShape'],
      leanTone: map['leanTone'],
      loseFat: map['loseFat'],
      phoneNumber: map['phoneNumber'],
    );
  }

}
