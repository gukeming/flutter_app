import 'view_state_provider.dart';

abstract class ViewStateDataProvoder<T> extends ViewStateProvider {
  T data;
  /// 第一次进入页面loading
  initData({String url}) async {
    setBusy();
    try {
      data = await loadData(url: url);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  // 加载数据
  Future<T> loadData({String url = ""});
}
