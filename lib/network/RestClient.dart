import 'package:marche_a_pied/models/Activity.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://walkfitapi.mikroair.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/activite/today")
  Future<List<Activity>> today(@Query("idParticipant") int idParticipant);

  @GET("/activite/by-date")
  Future<List<Activity>> byDate(
      @Query("date") String date, @Query("idParticipant") int idParticipant);

  @GET("/activite/past-week")
  Future<List<Activity>> pastWeek(@Query("idParticipant") int idParticipant);

  @GET("/activite/all-activity")
  Future<List<Activity>> all(@Query("idParticipant") int idParticipant);


  @GET("/activite/month-activity")
  Future<List<Activity>> month(@Query("last") String lastDate, @Query("first") String firstDate, @Query("idParticipant") int idParticipant);

  @GET("/activite/intervall-days")
  Future<List<Activity>> intervallDays(@Query("last") String lastDate, @Query("first") String firstDate, @Query("idParticipant") int idParticipant);

  /*@GET("/ram")
  Future<HttpResponse> avanceSwitch(@Body() Map<String, dynamic> hashFields);

  @POST("/getfragrance.php")
  @FormUrlEncoded()
  Future<HttpResponse> getfragranceurl(@Field("uniqueid") String uniqueId);

  //web database call manual switch
  @POST("/setmanual.php")
  @FormUrlEncoded()
  Future<HttpResponse> setManualSwitch(@Field("uniqueid") String uniqueId,
      @Field("c") int c, @Field("d") String d, @Field("p") int power);

  //web database call manual switch
  @POST("/setminuteur.php")
  @FormUrlEncoded()
  Future<HttpResponse> setMinuteur(@Field("uniqueid") String uniqueId,
      @Field("is_on") int isOn, @Field("date_on") String dateOn);

  @FormUrlEncoded()
  @POST("/setprog.php")
  Future<HttpResponse> setavanceSwitch(@Body() Map<String, dynamic> hashFields);*/
}
