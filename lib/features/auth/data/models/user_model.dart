import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    super.lastname,
    super.firstname,
    super.nickname,
    super.gender,
    super.nationality,
    super.birthplace,
    super.address,
    super.dateOfBirth,
    super.photo,
    super.skype,
    super.gmail,
    super.discord,
    super.whatsapp,
    super.facebook,
    super.twitter,
    super.instagram,
    super.linkedin,
    super.phoneWork,
    super.profession,
    super.updatedAt,
    required super.username,
    required super.tel,
    super.email,
    required super.emailVerified,
    required super.dateJoined,
    required String super.lastLogin,
    super.lastIp,
    super.lastLocation,
    super.imei,
    required super.isVerified,
    required super.isStaff,
    required super.isActive,
    required super.isSuperuser,
    super.userQuater,
    List<dynamic>? groups,
    List<dynamic>? userPermissions,
    List<dynamic>? competence,
    List<dynamic>? job,
    List<dynamic>? status,
  }) : super(
          groups: groups ?? const [],
          userPermissions: userPermissions ?? const [],
          competence: competence ?? const [],
          job: job ?? const [],
          status: status ?? const [],
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
