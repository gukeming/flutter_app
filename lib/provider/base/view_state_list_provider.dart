import 'view_state_provider.dart';

/// 基于
abstract class ViewStateListProvoder<T> extends ViewStateProvider {
  /// 页面数据
  List<T> list = [];

  /// 第一次进入页面loading skeleton
  initData({String url}) async {
    setBusy();
    await refresh(init: true, url: url);
  }

  // 下拉刷新
  refresh({bool init = false, String url= ''}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  // 加载数据
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
