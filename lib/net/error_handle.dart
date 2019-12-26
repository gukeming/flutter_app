import 'dart:io';
import 'package:dio/dio.dart';

class ExceptionHandle {
  static const int success = 200;
  static const int success_not_content = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;

  static const int net_error = 1000;
  static const int parse_error = 1001;
  static const int socket_error = 1002;
  static const int http_error = 1003;
  static const int timeout_error = 1004;
  static const int cancel_error = 1005;
  static const int unknown_error = 9999;

  static NetError handleException(dynamic error) {
    NetError err = error;
    print(error);
    if (error is DioError) {
      if (error.type == DioErrorType.DEFAULT || error.type == DioErrorType.RESPONSE) {
        dynamic e = error.error;
        err.code = socket_error;
        if (e is SocketException) {
          err.msg = "网络异常，请检查你的网络！";
          return err;
        }
        if (e is HttpException) {
          err.msg = "服务器异常！";
          return err;
        }
        err.msg = "网络异常，请检查你的网络！";
        return err;
      } else if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        err.code = timeout_error;
        err.msg = "连接超时！";
        return err;
      } else if (error.type == DioErrorType.CANCEL) {
        err.code = cancel_error;
        err.msg = "取消请求";
        return err;
      } else {
        err.code = unknown_error;
        err.msg = "未知异常";
        return err;
      }
    } else {
      err.code = unknown_error;
      err.msg = "未知异常";
      return err;
    }
  }
}

class NetError extends DioError {
  int code;
  String msg;

  NetError(this.code, this.msg);
}
