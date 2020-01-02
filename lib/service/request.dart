import 'package:flutter_app/net/api_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/net/error_handle.dart';
import 'package:flutter_app/entity_factory.dart';

class Request {
  Future<T> get<T>(
    path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {

    Response<dynamic> response = await http.get<dynamic>(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );

    T obj;
    try {
      obj = EntityFactory.generateOBJ<T>(response.data);
    } catch(err) {
      NetError error = ExceptionHandle.handleException(err);
      throw error;
    }
    return obj;
  }
}


final request = new Request();