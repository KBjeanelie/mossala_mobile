// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      lastname: json['lastname'] as String? ?? "",
      firstname: json['firstname'] as String? ?? "",
      nickname: json['nickname'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      nationality: json['nationality'] as String? ?? "",
      birthplace: json['birthplace'] as String? ?? "",
      address: json['address'] as String? ?? "",
      dateOfBirth: json['dateOfBirth'] as String? ?? "",
      photo: json['photo'] as String? ?? "",
      skype: json['skype'] as String? ?? "",
      gmail: json['gmail'] as String? ?? "",
      discord: json['discord'] as String? ?? "",
      whatsapp: json['whatsapp'] as String? ?? "",
      facebook: json['facebook'] as String? ?? "",
      twitter: json['twitter'] as String? ?? "",
      instagram: json['instagram'] as String? ?? "",
      linkedin: json['linkedin'] as String? ?? "",
      phoneWork: json['phoneWork'] as String? ?? "",
      profession: json['profession'] as String? ?? "",
      updatedAt: json['updatedAt'] as String? ?? "",
      username: json['username'] as String? ?? "",
      tel: json['tel'] as String? ?? "",
      email: json['email'] as String? ?? "",
      emailVerified: json['email_verified'] as bool? ?? false,
      dateJoined: json['date_joined'] as String? ?? "",
      lastLogin: json['last_login'] as String? ?? "",
      lastIp: json['last_ip'] as String? ?? "",
      lastLocation: json['lastLocation'] as String? ?? "",
      imei: json['imei'] as String? ?? "",
      isVerified: json['is_verified'] as bool? ?? false,
      isStaff: json['is_staff'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      isSuperuser: json['is_superuser'] as bool? ?? false,
      userQuater: json['user_quater'] as String? ?? "",
      groups: json['groups'] as List<dynamic>?,
      userPermissions: json['userPermissions'] as List<dynamic>?,
      competence: json['competence'] as List<dynamic>?,
      job: json['job'] as List<dynamic>?,
      status: json['status'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'birthplace': instance.birthplace,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth,
      'photo': instance.photo,
      'skype': instance.skype,
      'gmail': instance.gmail,
      'discord': instance.discord,
      'whatsapp': instance.whatsapp,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'phoneWork': instance.phoneWork,
      'profession': instance.profession,
      'updatedAt': instance.updatedAt,
      'username': instance.username,
      'tel': instance.tel,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'dateJoined': instance.dateJoined,
      'lastLogin': instance.lastLogin,
      'lastIp': instance.lastIp,
      'lastLocation': instance.lastLocation,
      'imei': instance.imei,
      'isVerified': instance.isVerified,
      'isStaff': instance.isStaff,
      'isActive': instance.isActive,
      'isSuperuser': instance.isSuperuser,
      'userQuater': instance.userQuater,
      'groups': instance.groups,
      'userPermissions': instance.userPermissions,
      'competence': instance.competence,
      'job': instance.job,
      'status': instance.status,
    };
