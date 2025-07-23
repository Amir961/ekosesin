import 'dart:convert';
SalonModel salonModelFromJson(String str) => SalonModel.fromJson(json.decode(str));
String salonModelToJson(SalonModel data) => json.encode(data.toJson());
class SalonModel {
  SalonModel({
      String? id, 
      String? type, 
      String? value, 
      String? amount, 
      String? releaseType, 
      num? isOfferable, 
      String? transportMethod, 
      String? updatedAt, 
      String? createdAt, 
      String? loadingToDate, 
      String? loadingFromDate, 
      dynamic maximumDeliveryDate, 
      GoodsPackage? goodsPackage, 
      GoodsCategory? goodsCategory, 
      Status? status, 
      Creator? creator, 
      dynamic cargo, 
      Company? company, 
      List<dynamic>? reserves, 
      Financial? financial, 
      FirstOrigin? firstOrigin, 
      Destination? destination, 
      Loader? loader,}){
    _id = id;
    _type = type;
    _value = value;
    _amount = amount;
    _releaseType = releaseType;
    _isOfferable = isOfferable;
    _transportMethod = transportMethod;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _loadingToDate = loadingToDate;
    _loadingFromDate = loadingFromDate;
    _maximumDeliveryDate = maximumDeliveryDate;
    _goodsPackage = goodsPackage;
    _goodsCategory = goodsCategory;
    _status = status;
    _creator = creator;
    _cargo = cargo;
    _company = company;
    _reserves = reserves;
    _financial = financial;
    _firstOrigin = firstOrigin;
    _destination = destination;
    _loader = loader;
}

  SalonModel.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _value = json['value'];
    _amount = json['amount'];
    _releaseType = json['release_type'];
    _isOfferable = json['is_offerable'];
    _transportMethod = json['transport_method'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _loadingToDate = json['loading_to_date'];
    _loadingFromDate = json['loading_from_date'];
    _maximumDeliveryDate = json['maximum_delivery_date'];
    _goodsPackage = json['goods_package'] != null ? GoodsPackage.fromJson(json['goods_package']) : null;
    _goodsCategory = json['goods_category'] != null ? GoodsCategory.fromJson(json['goods_category']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    _cargo = json['cargo'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    if (json['reserves'] != null) {
      _reserves = [];
      json['reserves'].forEach((v) {
        //_reserves?.add(Dynamic.fromJson(v));
      });
    }
    _financial = json['financial'] != null ? Financial.fromJson(json['financial']) : null;
    _firstOrigin = json['first_origin'] != null ? FirstOrigin.fromJson(json['first_origin']) : null;
    _destination = json['destination'] != null ? Destination.fromJson(json['destination']) : null;
    _loader = json['loader'] != null ? Loader.fromJson(json['loader']) : null;
  }
  String? _id;
  String? _type;
  String? _value;
  String? _amount;
  String? _releaseType;
  num? _isOfferable;
  String? _transportMethod;
  String? _updatedAt;
  String? _createdAt;
  String? _loadingToDate;
  String? _loadingFromDate;
  dynamic _maximumDeliveryDate;
  GoodsPackage? _goodsPackage;
  GoodsCategory? _goodsCategory;
  Status? _status;
  Creator? _creator;
  dynamic _cargo;
  Company? _company;
  List<dynamic>? _reserves;
  Financial? _financial;
  FirstOrigin? _firstOrigin;
  Destination? _destination;
  Loader? _loader;
SalonModel copyWith({  String? id,
  String? type,
  String? value,
  String? amount,
  String? releaseType,
  num? isOfferable,
  String? transportMethod,
  String? updatedAt,
  String? createdAt,
  String? loadingToDate,
  String? loadingFromDate,
  dynamic maximumDeliveryDate,
  GoodsPackage? goodsPackage,
  GoodsCategory? goodsCategory,
  Status? status,
  Creator? creator,
  dynamic cargo,
  Company? company,
  List<dynamic>? reserves,
  Financial? financial,
  FirstOrigin? firstOrigin,
  Destination? destination,
  Loader? loader,
}) => SalonModel(  id: id ?? _id,
  type: type ?? _type,
  value: value ?? _value,
  amount: amount ?? _amount,
  releaseType: releaseType ?? _releaseType,
  isOfferable: isOfferable ?? _isOfferable,
  transportMethod: transportMethod ?? _transportMethod,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  loadingToDate: loadingToDate ?? _loadingToDate,
  loadingFromDate: loadingFromDate ?? _loadingFromDate,
  maximumDeliveryDate: maximumDeliveryDate ?? _maximumDeliveryDate,
  goodsPackage: goodsPackage ?? _goodsPackage,
  goodsCategory: goodsCategory ?? _goodsCategory,
  status: status ?? _status,
  creator: creator ?? _creator,
  cargo: cargo ?? _cargo,
  company: company ?? _company,
  reserves: reserves ?? _reserves,
  financial: financial ?? _financial,
  firstOrigin: firstOrigin ?? _firstOrigin,
  destination: destination ?? _destination,
  loader: loader ?? _loader,
);
  String? get id => _id;
  String? get type => _type;
  String? get value => _value;
  String? get amount => _amount;
  String? get releaseType => _releaseType;
  num? get isOfferable => _isOfferable;
  String? get transportMethod => _transportMethod;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  String? get loadingToDate => _loadingToDate;
  String? get loadingFromDate => _loadingFromDate;
  dynamic get maximumDeliveryDate => _maximumDeliveryDate;
  GoodsPackage? get goodsPackage => _goodsPackage;
  GoodsCategory? get goodsCategory => _goodsCategory;
  Status? get status => _status;
  Creator? get creator => _creator;
  dynamic get cargo => _cargo;
  Company? get company => _company;
  List<dynamic>? get reserves => _reserves;
  Financial? get financial => _financial;
  FirstOrigin? get firstOrigin => _firstOrigin;
  Destination? get destination => _destination;
  Loader? get loader => _loader;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['value'] = _value;
    map['amount'] = _amount;
    map['release_type'] = _releaseType;
    map['is_offerable'] = _isOfferable;
    map['transport_method'] = _transportMethod;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['loading_to_date'] = _loadingToDate;
    map['loading_from_date'] = _loadingFromDate;
    map['maximum_delivery_date'] = _maximumDeliveryDate;
    if (_goodsPackage != null) {
      map['goods_package'] = _goodsPackage?.toJson();
    }
    if (_goodsCategory != null) {
      map['goods_category'] = _goodsCategory?.toJson();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_creator != null) {
      map['creator'] = _creator?.toJson();
    }
    map['cargo'] = _cargo;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_reserves != null) {
      map['reserves'] = _reserves?.map((v) => v.toJson()).toList();
    }
    if (_financial != null) {
      map['financial'] = _financial?.toJson();
    }
    if (_firstOrigin != null) {
      map['first_origin'] = _firstOrigin?.toJson();
    }
    if (_destination != null) {
      map['destination'] = _destination?.toJson();
    }
    if (_loader != null) {
      map['loader'] = _loader?.toJson();
    }
    return map;
  }

}

Loader loaderFromJson(String str) => Loader.fromJson(json.decode(str));
String loaderToJson(Loader data) => json.encode(data.toJson());
class Loader {
  Loader({
      VehicleCategory? vehicleCategory, 
      LoaderCategory? loaderCategory,}){
    _vehicleCategory = vehicleCategory;
    _loaderCategory = loaderCategory;
}

  Loader.fromJson(dynamic json) {
    _vehicleCategory = json['vehicle_category'] != null ? VehicleCategory.fromJson(json['vehicle_category']) : null;
    _loaderCategory = json['loader_category'] != null ? LoaderCategory.fromJson(json['loader_category']) : null;
  }
  VehicleCategory? _vehicleCategory;
  LoaderCategory? _loaderCategory;
Loader copyWith({  VehicleCategory? vehicleCategory,
  LoaderCategory? loaderCategory,
}) => Loader(  vehicleCategory: vehicleCategory ?? _vehicleCategory,
  loaderCategory: loaderCategory ?? _loaderCategory,
);
  VehicleCategory? get vehicleCategory => _vehicleCategory;
  LoaderCategory? get loaderCategory => _loaderCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vehicleCategory != null) {
      map['vehicle_category'] = _vehicleCategory?.toJson();
    }
    if (_loaderCategory != null) {
      map['loader_category'] = _loaderCategory?.toJson();
    }
    return map;
  }

}

LoaderCategory loaderCategoryFromJson(String str) => LoaderCategory.fromJson(json.decode(str));
String loaderCategoryToJson(LoaderCategory data) => json.encode(data.toJson());
class LoaderCategory {
  LoaderCategory({
      String? title,}){
    _title = title;
}

  LoaderCategory.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
LoaderCategory copyWith({  String? title,
}) => LoaderCategory(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}

VehicleCategory vehicleCategoryFromJson(String str) => VehicleCategory.fromJson(json.decode(str));
String vehicleCategoryToJson(VehicleCategory data) => json.encode(data.toJson());
class VehicleCategory {
  VehicleCategory({
      String? title,}){
    _title = title;
}

  VehicleCategory.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
VehicleCategory copyWith({  String? title,
}) => VehicleCategory(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}

Destination destinationFromJson(String str) => Destination.fromJson(json.decode(str));
String destinationToJson(Destination data) => json.encode(data.toJson());
class Destination {
  Destination({
      String? title, 
      City? city,}){
    _title = title;
    _city = city;
}

  Destination.fromJson(dynamic json) {
    _title = json['title'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? _title;
  City? _city;
Destination copyWith({  String? title,
  City? city,
}) => Destination(  title: title ?? _title,
  city: city ?? _city,
);
  String? get title => _title;
  City? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    return map;
  }

}

City cityFromJson(String str) => City.fromJson(json.decode(str));
String cityToJson(City data) => json.encode(data.toJson());
class City {
  City({
      String? title,}){
    _title = title;
}

  City.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
City copyWith({  String? title,
}) => City(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}

FirstOrigin firstOriginFromJson(String str) => FirstOrigin.fromJson(json.decode(str));
String firstOriginToJson(FirstOrigin data) => json.encode(data.toJson());
class FirstOrigin {
  FirstOrigin({
      String? title, 
      City? city,}){
    _title = title;
    _city = city;
}

  FirstOrigin.fromJson(dynamic json) {
    _title = json['title'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? _title;
  City? _city;
FirstOrigin copyWith({  String? title,
  City? city,
}) => FirstOrigin(  title: title ?? _title,
  city: city ?? _city,
);
  String? get title => _title;
  City? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    return map;
  }

}



Financial financialFromJson(String str) => Financial.fromJson(json.decode(str));
String financialToJson(Financial data) => json.encode(data.toJson());
class Financial {
  Financial({
      String? driverTip, 
      String? driverAmount, 
      String? prepaymentAmount,}){
    _driverTip = driverTip;
    _driverAmount = driverAmount;
    _prepaymentAmount = prepaymentAmount;
}

  Financial.fromJson(dynamic json) {
    _driverTip = json['driver_tip'];
    _driverAmount = json['driver_amount'];
    _prepaymentAmount = json['prepayment_amount'];
  }
  String? _driverTip;
  String? _driverAmount;
  String? _prepaymentAmount;
Financial copyWith({  String? driverTip,
  String? driverAmount,
  String? prepaymentAmount,
}) => Financial(  driverTip: driverTip ?? _driverTip,
  driverAmount: driverAmount ?? _driverAmount,
  prepaymentAmount: prepaymentAmount ?? _prepaymentAmount,
);
  String? get driverTip => _driverTip;
  String? get driverAmount => _driverAmount;
  String? get prepaymentAmount => _prepaymentAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_tip'] = _driverTip;
    map['driver_amount'] = _driverAmount;
    map['prepayment_amount'] = _prepaymentAmount;
    return map;
  }

}

Company companyFromJson(String str) => Company.fromJson(json.decode(str));
String companyToJson(Company data) => json.encode(data.toJson());
class Company {
  Company({
      String? title,}){
    _title = title;
}

  Company.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
Company copyWith({  String? title,
}) => Company(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));
String creatorToJson(Creator data) => json.encode(data.toJson());
class Creator {
  Creator({
      String? firstname, 
      String? lastname,}){
    _firstname = firstname;
    _lastname = lastname;
}

  Creator.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
  }
  String? _firstname;
  String? _lastname;
Creator copyWith({  String? firstname,
  String? lastname,
}) => Creator(  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
);
  String? get firstname => _firstname;
  String? get lastname => _lastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    return map;
  }

}

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      String? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  String? _id;
  String? _title;
Status copyWith({  String? id,
  String? title,
}) => Status(  id: id ?? _id,
  title: title ?? _title,
);
  String? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}

GoodsCategory goodsCategoryFromJson(String str) => GoodsCategory.fromJson(json.decode(str));
String goodsCategoryToJson(GoodsCategory data) => json.encode(data.toJson());
class GoodsCategory {
  GoodsCategory({
      String? title,}){
    _title = title;
}

  GoodsCategory.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
GoodsCategory copyWith({  String? title,
}) => GoodsCategory(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}

GoodsPackage goodsPackageFromJson(String str) => GoodsPackage.fromJson(json.decode(str));
String goodsPackageToJson(GoodsPackage data) => json.encode(data.toJson());
class GoodsPackage {
  GoodsPackage({
      String? title,}){
    _title = title;
}

  GoodsPackage.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
GoodsPackage copyWith({  String? title,
}) => GoodsPackage(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}