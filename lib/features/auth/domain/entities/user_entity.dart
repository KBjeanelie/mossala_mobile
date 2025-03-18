import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String? lastname;
  final String? firstname;
  final String? nickname;
  final String? gender;
  final String? nationality;
  final String? birthplace;
  final String? address;
  final String? dateOfBirth;
  final String? photo;
  final String? skype;
  final String? gmail;
  final String? discord;
  final String? whatsapp;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? phoneWork;
  final String? profession;
  final String? updatedAt;
  final String? username;
  final String tel;
  final String? email;
  final bool emailVerified;
  final String dateJoined;
  final String? lastLogin;
  final String? lastIp;
  final String? lastLocation;
  final String? imei;
  final bool isVerified;
  final bool isStaff;
  final bool isActive;
  final bool isSuperuser;
  final String? userQuater;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;
  final List<dynamic> competence;
  final List<dynamic> job;
  final List<dynamic> status;

  const User({
    required this.id,
    this.lastname,
    this.firstname,
    this.nickname,
    this.gender,
    this.nationality,
    this.birthplace,
    this.address,
    this.dateOfBirth,
    this.photo,
    this.skype,
    this.gmail,
    this.discord,
    this.whatsapp,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.phoneWork,
    this.profession,
    this.updatedAt,
    this.username,
    required this.tel,
    this.email,
    required this.emailVerified,
    required this.dateJoined,
    this.lastLogin,
    this.lastIp,
    this.lastLocation,
    this.imei,
    required this.isVerified,
    required this.isStaff,
    required this.isActive,
    required this.isSuperuser,
    this.userQuater,
    this.groups = const [],
    this.userPermissions = const [],
    this.competence = const [],
    this.job = const [],
    this.status = const [],
  });

  @override
  List<Object?> get props => [
        id,
        lastname,
        firstname,
        nickname,
        gender,
        nationality,
        birthplace,
        address,
        dateOfBirth,
        photo,
        skype,
        gmail,
        discord,
        whatsapp,
        facebook,
        twitter,
        instagram,
        linkedin,
        phoneWork,
        profession,
        updatedAt,
        username,
        tel,
        email,
        emailVerified,
        dateJoined,
        lastLogin,
        lastIp,
        lastLocation,
        imei,
        isVerified,
        isStaff,
        isActive,
        isSuperuser,
        userQuater,
        groups,
        userPermissions,
        competence,
        job,
        status,
      ];
}
