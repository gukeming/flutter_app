import 'package:flutter/foundation.dart';
import 'base_http.dart';
import 'error_handle.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'http://10.150.70.186:3000';
    interceptors.add(AppApiInterceptor());
  }
}

/// App相关 API
class AppApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.queryParameters['appKey'] = '7954deb7bce815d3b49a0626ff0b76a7';
    debugPrint(
        '---api-request--->url--> ${options.baseUrl}${options.path}' + ' queryParameters: ${options.queryParameters}');
    return options;
  }

  @override
  onResponse(Response response) {
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      throw NotSuccessException.fromRespData(respData);
    }
  }

  @override
  Future onError(DioError err) {
    NetError error = ExceptionHandle.handleException(err);
    err.error = error;
    return super.onError(err);
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['msg'];
    data = json['data'];
  }
}
