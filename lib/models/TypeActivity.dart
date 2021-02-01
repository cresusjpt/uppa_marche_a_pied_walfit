import 'package:floor/floor.dart';

@entity
class TypeActivity{
  @PrimaryKey(autoGenerate: true)
  int id;

  int remoteId;
  String nom;
  int numero;

  TypeActivity({this.id,this.remoteId,this.nom,this.numero});
}