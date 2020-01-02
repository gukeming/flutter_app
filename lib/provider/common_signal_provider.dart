
import 'base/view_state_data_provider.dart';
import 'package:flutter_app/service/request.dart';
///对普通的单个页面请求可以使用通用的请求，对于复杂的请求自己继承ViewStateDataProvoder后实现自己的方法即可
class CommonSignalProvider<T> extends ViewStateDataProvoder<T> {
  // 加载数据
  Future<T> loadData({String url = ""}) async {
    var detail = await request.get<T>(url);
    return detail;
  }
}