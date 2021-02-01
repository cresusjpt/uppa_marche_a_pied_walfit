// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    remoteId: json['id'] as int,
    dateActivity: json['date_activite'] == null
        ? null
        : DateTime.parse(json['date_activite'] as String),
    heureDebutRemote: json['heure_debut'] as String,
    heureFinRemote: json['heure_fin'] as String,
    calorie: (json['caloris'] as num)?.toDouble(),
    step: json['pas'] as int,
    distance: (json['distance'] as num)?.toDouble(),
    minuteActive: json['minute_active'] as int,
    duree: json['duree'] as int,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    idParticipant: json['idparticipant_id'] as int,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.remoteId,
      'date_activite': instance.dateActivity?.toIso8601String(),
      'heure_debut': instance.heureDebutRemote,
      'heure_fin': instance.heureFinRemote,
      'caloris': instance.calorie,
      'pas': instance.step,
      'distance': instance.distance,
      'minute_active': instance.minuteActive,
      'duree': instance.duree,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'idparticipant_id': instance.idParticipant,
    };
