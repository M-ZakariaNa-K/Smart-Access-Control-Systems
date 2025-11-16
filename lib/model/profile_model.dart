class ProfileModel {
  final String fullName;
  final String cardCode;
  final String gender;
  final String status;
  final String year;
  final String specialization;

  ProfileModel({
    required this.fullName,
    required this.cardCode,
    required this.gender,
    required this.status,
    required this.year,
    required this.specialization,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      fullName: map['full_name']?.toString() ?? '',
      cardCode: map['card_code']?.toString() ?? '',
      gender: map['gender']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      year: map['year']?.toString() ?? '',
      specialization: map['specialization']?.toString() == 'null'
          ? ''
          : map['specialization']?.toString() ?? '',
    );
  }
}
