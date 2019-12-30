

import 'common/view_state_data_provider.dart';
import 'package:flutter_app/model/detail_entity.dart';

import 'package:flutter_app/service/request.dart';
class DetailProvider extends ViewStateDataProvoder<DetailEntity> {
  Future<DetailEntity> loadData() async {
    
    var detail =  await Request.get<DetailEntity>("/users/json");
    return detail;
  }
}