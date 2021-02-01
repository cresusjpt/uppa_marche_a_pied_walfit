import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Participant.g.dart';

@JsonSerializable()
@entity
class Participant {

  @PrimaryKey(autoGenerate: true)
  @JsonKey(ignore: true)
  int id;

  @JsonKey(name: "id")
  int remoteId;
  String email;

  @JsonKey(ignore: true)
  int dateNaiss; //datefrommillissecondsinceepoch

  @JsonKey(name: "date_naiss")
  final DateTime datNaiss;

  String genre;

  Participant({this.id, this.remoteId, this.email, this.dateNaiss,this.datNaiss, this.genre});


  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}