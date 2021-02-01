// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return Participant(
    remoteId: json['id'] as int,
    email: json['email'] as String,
    datNaiss: json['date_naiss'] == null
        ? null
        : DateTime.parse(json['date_naiss'] as String),
    genre: json['genre'] as String,
  );
}

Map<String, dynamic> _$ParticipantToJson(Participant instance) =>
    <String, dynamic>{
      'id': instance.remoteId,
      'email': instance.email,
      'date_naiss': instance.datNaiss?.toIso8601String(),
      'genre': instance.genre,
    };
