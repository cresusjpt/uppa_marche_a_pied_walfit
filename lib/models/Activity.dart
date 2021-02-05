import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:marche_a_pied/models/Participant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Activity.g.dart';

@JsonSerializable()
@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['idParticipant'],
      parentColumns: ['remoteId'],
      entity: Participant)
], indices: [
  Index(value: ['idParticipant'])
])
class Activity {
  @PrimaryKey(autoGenerate: true)
  @JsonKey(ignore: true)
  int id;

  @JsonKey(name: "id")
  int remoteId;

  @JsonKey(name: "date_activite")
  final DateTime
      dateActivity; //millissecondsinceepoch for every datetime attribute

  @JsonKey(name: "heure_debut")
  @ignore
  String heureDebutRemote;

  @JsonKey(name: "heure_fin")
  @ignore
  String heureFinRemote;

  @JsonKey(ignore: true)
  int heureDebut;

  @JsonKey(ignore: true)
  int heureFin;

  @JsonKey(ignore: true)
  String name;

  @JsonKey(name: "caloris")
  double calorie;

  @JsonKey(name: "pas")
  int step;

  @JsonKey(ignore: true)
  int typeActivite;

  @JsonKey(name: "distance")
  double distance; //km

  @JsonKey(name: "minute_active")
  int minuteActive;

  int duree;

  double latitude;
  double longitude;

  @JsonKey(name: "idparticipant_id")
  int idParticipant;

  Activity(
      {this.id,
      this.remoteId,
      this.dateActivity,
      this.heureDebutRemote,
      this.heureFinRemote,
      this.heureDebut,
      this.heureFin,
      this.name,
      this.calorie,
      this.step,
      this.typeActivite,
      this.distance,
      this.minuteActive,
      this.duree,
      this.latitude,
      this.longitude,
      this.idParticipant});
  
  String applyName(){
    if(this.name != null && this.name.isNotEmpty){
      return this.name;
    }else{
      int beginhour = int.parse(this.heureDebutRemote.split(":").elementAt(0));
      if(beginhour >=3 && beginhour <= 6){
        this.name = "Early morning walk";
      }else if(beginhour >=7 && beginhour <= 10){
        this.name = "Morning walk";
      }else if(beginhour >=11 && beginhour <= 14){
        this.name = "Lunch walk";
      }else if(beginhour >=15 && beginhour <= 17){
        this.name = "Afternoon walk";
      }else if(beginhour >=18 && beginhour <= 22){
        this.name = "Evening walk";
      }else if(beginhour <= 2 && beginhour >=23){
        this.name = "Night walk";
      }else if(beginhour ==00){
        this.name = "Midnight walk";
      }

      return this.name;
    }
  }

  String getHumanTime(int millisecondsSinceEpoch) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    DateFormat format = DateFormat("HH:mm");

    return format.format(dateTime);
  }

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
