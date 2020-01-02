import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/provider/base/widget_provider.dart';
import 'package:flutter_app/provider/base/view_state_provider.dart';
import 'package:flutter_app/provider/common_signal_provider.dart';
import 'package:flutter_app/model/detail_entity.dart';

 loadState(ViewStateProvider model) {
   if(model.busy) {
     return Center(
       child: Text("DetailInfo loading"),
     );
   } else if (model.error) {

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
      body: WidgetProvider<CommonSignalProvider<DetailEntity>>(
        model: CommonSignalProvider<DetailEntity>(),
        onModelReady: (model) async {
          await model.initData(url: "/users/json");
        },
        builder: (context, model, child) {
          var widget = loadState(model);
          if(widget != null) {
            return widget;
          }
          return Center(
            child: Text("DetailInfo" + model.data?.name??''),
          );
        },
      ),
    );
  }
}
