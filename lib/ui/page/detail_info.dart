import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/provider/base/widget_provider.dart';
import 'package:flutter_app/provider/base/view_state_provider.dart';
import 'package:flutter_app/provider/common_signal_provider.dart';
import 'package:flutter_app/model/detail_entity.dart';

Widget loadState(ViewStateProvider provider) {
   if(provider.busy) {
     return Center(
       child: Text("DetailInfo loading"),
     );
   } else if (provider.error) {

   }
   return null;
 }

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: WidgetProvider<CommonSignalProvider<dynamic>>(
        provider: CommonSignalProvider<dynamic>(),
        onReady: (provider) async {
          await provider.initData(url: "/users/json");
        },
        builder: (context, provider, child) {
          print("response===" + provider.data.toString());
          var widget = loadState(provider);
          if(widget != null) {
            return widget;
          }
          return Center(
            child: Text("DetailInfo" + provider.data?.name??''),
          );
        },
      ),
    );
  }
}
