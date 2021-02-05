// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://walkfitapi.mikroair.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Activity>> today(idParticipant) async {
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'idParticipant': idParticipant};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/activite/today',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Activity>> byDate(date, idParticipant) async {
    ArgumentError.checkNotNull(date, 'date');
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'date': date,
      r'idParticipant': idParticipant
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/activite/by-date',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Activity>> pastWeek(idParticipant) async {
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'idParticipant': idParticipant};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/activite/past-week',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Activity>> all(idParticipant) async {
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'idParticipant': idParticipant};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/activite/all-activity',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Activity>> month(lastDate, firstDate, idParticipant) async {
    ArgumentError.checkNotNull(lastDate, 'lastDate');
    ArgumentError.checkNotNull(firstDate, 'firstDate');
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'last': lastDate,
      r'first': firstDate,
      r'idParticipant': idParticipant
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/activite/month-activity',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Activity>> intervallDays(
      lastDate, firstDate, idParticipant) async {
    ArgumentError.checkNotNull(lastDate, 'lastDate');
    ArgumentError.checkNotNull(firstDate, 'firstDate');
    ArgumentError.checkNotNull(idParticipant, 'idParticipant');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'last': lastDate,
      r'first': firstDate,
      r'idParticipant': idParticipant
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/activite/intervall-days',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Activity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
