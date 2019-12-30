import 'package:flutter_app/model/detail_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "DetailEntity") {
      return DetailEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}