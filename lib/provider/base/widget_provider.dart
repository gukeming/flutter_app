import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider封装类
///
/// 方便数据初始化
class WidgetProvider<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T provider;
  final Widget child;
  final Function(T provider) onReady;
  final bool autoDispose;

  WidgetProvider({
    Key key,
    @required this.builder,
    @required this.provider,
    this.child,
    this.onReady,
    this.autoDispose: true,
  }) : super(key: key);

  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier> extends State<WidgetProvider<T>> {
  T provider;

  @override
  void initState() {
    provider = widget.provider;
    widget.onReady?.call(provider);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: provider,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class WidgetProvider2<A extends ChangeNotifier, B extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, A model1, B model2, Widget child) builder;
  final A provider1;
  final B provider2;
  final Widget child;
  final Function(A provider1, B provider2) onReady;
  final bool autoDispose;

  WidgetProvider2({
    Key key,
    @required this.builder,
    @required this.provider1,
    @required this.provider2,
    this.child,
    this.onReady,
    this.autoDispose,
  }) : super(key: key);

  _ProviderWidgetState2<A, B> createState() => _ProviderWidgetState2<A, B>();
}

class _ProviderWidgetState2<A extends ChangeNotifier, B extends ChangeNotifier> extends State<WidgetProvider2<A, B>> {
  A provider1;
  B provider2;

  @override
  void initState() {
    provider1 = widget.provider1;
    provider2 = widget.provider2;
    widget.onReady?.call(provider1, provider2);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) {
      provider1.dispose();
      provider2.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<A>.value(value: provider1),
          ChangeNotifierProvider<B>.value(value: provider2),
        ],
        child: Consumer2<A, B>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
