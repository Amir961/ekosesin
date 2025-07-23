import 'dart:convert';
CityModels cityModelsFromJson(String str) => CityModels.fromJson(json.decode(str));
String cityModelsToJson(CityModels data) => json.encode(data.toJson());
class CityModels {
  CityModels({
      String? id, 
      String? title, 
      String? typename,}){
    _id = id;
    _title = title;
    _typename = typename;
}

  CityModels.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _id;
  String? _title;
  String? _typename;
CityModels copyWith({  String? id,
  String? title,
  String? typename,
}) => CityModels(  id: id ?? _id,
  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get id => _id;
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}