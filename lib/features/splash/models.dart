import 'dart:convert';
Models modelsFromJson(String str) => Models.fromJson(json.decode(str));
String modelsToJson(Models data) => json.encode(data.toJson());
class Models {
  Models({
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
      Loader? loader, 
      List<dynamic>? transports, 
      String? typename,}){
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
    _transports = transports;
    _typename = typename;
}

  Models.fromJson(dynamic json) {
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
       // _reserves?.add(Dynamic.fromJson(v));
      });
    }
    _financial = json['financial'] != null ? Financial.fromJson(json['financial']) : null;
    _firstOrigin = json['first_origin'] != null ? FirstOrigin.fromJson(json['first_origin']) : null;
    _destination = json['destination'] != null ? Destination.fromJson(json['destination']) : null;
    _loader = json['loader'] != null ? Loader.fromJson(json['loader']) : null;
    if (json['transports'] != null) {
      _transports = [];
      json['transports'].forEach((v) {
       // _transports?.add(Dynamic.fromJson(v));
      });
    }
    _typename = json['__typename'];
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
  List<dynamic>? _transports;
  String? _typename;
Models copyWith({  String? id,
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
  List<dynamic>? transports,
  String? typename,
}) => Models(  id: id ?? _id,
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
  transports: transports ?? _transports,
  typename: typename ?? _typename,
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
  List<dynamic>? get transports => _transports;
  String? get typename => _typename;

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
    if (_transports != null) {
      map['transports'] = _transports?.map((v) => v.toJson()).toList();
    }
    map['__typename'] = _typename;
    return map;
  }

}

Loader loaderFromJson(String str) => Loader.fromJson(json.decode(str));
String loaderToJson(Loader data) => json.encode(data.toJson());
class Loader {
  Loader({
      VehicleCategory? vehicleCategory, 
      LoaderCategory? loaderCategory, 
      List<dynamic>? media, 
      String? typename,}){
    _vehicleCategory = vehicleCategory;
    _loaderCategory = loaderCategory;
    _media = media;
    _typename = typename;
}

  Loader.fromJson(dynamic json) {
    _vehicleCategory = json['vehicle_category'] != null ? VehicleCategory.fromJson(json['vehicle_category']) : null;
    _loaderCategory = json['loader_category'] != null ? LoaderCategory.fromJson(json['loader_category']) : null;
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
       // _media?.add(Dynamic.fromJson(v));
      });
    }
    _typename = json['__typename'];
  }
  VehicleCategory? _vehicleCategory;
  LoaderCategory? _loaderCategory;
  List<dynamic>? _media;
  String? _typename;
Loader copyWith({  VehicleCategory? vehicleCategory,
  LoaderCategory? loaderCategory,
  List<dynamic>? media,
  String? typename,
}) => Loader(  vehicleCategory: vehicleCategory ?? _vehicleCategory,
  loaderCategory: loaderCategory ?? _loaderCategory,
  media: media ?? _media,
  typename: typename ?? _typename,
);
  VehicleCategory? get vehicleCategory => _vehicleCategory;
  LoaderCategory? get loaderCategory => _loaderCategory;
  List<dynamic>? get media => _media;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vehicleCategory != null) {
      map['vehicle_category'] = _vehicleCategory?.toJson();
    }
    if (_loaderCategory != null) {
      map['loader_category'] = _loaderCategory?.toJson();
    }
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    map['__typename'] = _typename;
    return map;
  }

}

LoaderCategory loaderCategoryFromJson(String str) => LoaderCategory.fromJson(json.decode(str));
String loaderCategoryToJson(LoaderCategory data) => json.encode(data.toJson());
class LoaderCategory {
  LoaderCategory({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  LoaderCategory.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
LoaderCategory copyWith({  String? title,
  String? typename,
}) => LoaderCategory(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}

VehicleCategory vehicleCategoryFromJson(String str) => VehicleCategory.fromJson(json.decode(str));
String vehicleCategoryToJson(VehicleCategory data) => json.encode(data.toJson());
class VehicleCategory {
  VehicleCategory({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  VehicleCategory.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
VehicleCategory copyWith({  String? title,
  String? typename,
}) => VehicleCategory(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}

Destination destinationFromJson(String str) => Destination.fromJson(json.decode(str));
String destinationToJson(Destination data) => json.encode(data.toJson());
class Destination {
  Destination({
      String? title, 
      City? city, 
      String? typename,}){
    _title = title;
    _city = city;
    _typename = typename;
}

  Destination.fromJson(dynamic json) {
    _title = json['title'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _typename = json['__typename'];
  }
  String? _title;
  City? _city;
  String? _typename;
Destination copyWith({  String? title,
  City? city,
  String? typename,
}) => Destination(  title: title ?? _title,
  city: city ?? _city,
  typename: typename ?? _typename,
);
  String? get title => _title;
  City? get city => _city;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['__typename'] = _typename;
    return map;
  }

}

City cityFromJson(String str) => City.fromJson(json.decode(str));
String cityToJson(City data) => json.encode(data.toJson());
class City {
  City({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  City.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
City copyWith({  String? title,
  String? typename,
}) => City(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}

FirstOrigin firstOriginFromJson(String str) => FirstOrigin.fromJson(json.decode(str));
String firstOriginToJson(FirstOrigin data) => json.encode(data.toJson());
class FirstOrigin {
  FirstOrigin({
      String? title, 
      City? city, 
      String? typename,}){
    _title = title;
    _city = city;
    _typename = typename;
}

  FirstOrigin.fromJson(dynamic json) {
    _title = json['title'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _typename = json['__typename'];
  }
  String? _title;
  City? _city;
  String? _typename;
FirstOrigin copyWith({  String? title,
  City? city,
  String? typename,
}) => FirstOrigin(  title: title ?? _title,
  city: city ?? _city,
  typename: typename ?? _typename,
);
  String? get title => _title;
  City? get city => _city;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['__typename'] = _typename;
    return map;
  }

}



Financial financialFromJson(String str) => Financial.fromJson(json.decode(str));
String financialToJson(Financial data) => json.encode(data.toJson());
class Financial {
  Financial({
      String? driverTip, 
      String? driverAmount, 
      String? prepaymentAmount, 
      String? typename,}){
    _driverTip = driverTip;
    _driverAmount = driverAmount;
    _prepaymentAmount = prepaymentAmount;
    _typename = typename;
}

  Financial.fromJson(dynamic json) {
    _driverTip = json['driver_tip'];
    _driverAmount = json['driver_amount'];
    _prepaymentAmount = json['prepayment_amount'];
    _typename = json['__typename'];
  }
  String? _driverTip;
  String? _driverAmount;
  String? _prepaymentAmount;
  String? _typename;
Financial copyWith({  String? driverTip,
  String? driverAmount,
  String? prepaymentAmount,
  String? typename,
}) => Financial(  driverTip: driverTip ?? _driverTip,
  driverAmount: driverAmount ?? _driverAmount,
  prepaymentAmount: prepaymentAmount ?? _prepaymentAmount,
  typename: typename ?? _typename,
);
  String? get driverTip => _driverTip;
  String? get driverAmount => _driverAmount;
  String? get prepaymentAmount => _prepaymentAmount;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_tip'] = _driverTip;
    map['driver_amount'] = _driverAmount;
    map['prepayment_amount'] = _prepaymentAmount;
    map['__typename'] = _typename;
    return map;
  }

}

Company companyFromJson(String str) => Company.fromJson(json.decode(str));
String companyToJson(Company data) => json.encode(data.toJson());
class Company {
  Company({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  Company.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
Company copyWith({  String? title,
  String? typename,
}) => Company(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));
String creatorToJson(Creator data) => json.encode(data.toJson());
class Creator {
  Creator({
      String? firstname, 
      String? lastname, 
      String? typename,}){
    _firstname = firstname;
    _lastname = lastname;
    _typename = typename;
}

  Creator.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _typename = json['__typename'];
  }
  String? _firstname;
  String? _lastname;
  String? _typename;
Creator copyWith({  String? firstname,
  String? lastname,
  String? typename,
}) => Creator(  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  typename: typename ?? _typename,
);
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['__typename'] = _typename;
    return map;
  }

}

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      String? id, 
      String? title, 
      String? typename,}){
    _id = id;
    _title = title;
    _typename = typename;
}

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _id;
  String? _title;
  String? _typename;
Status copyWith({  String? id,
  String? title,
  String? typename,
}) => Status(  id: id ?? _id,
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

GoodsCategory goodsCategoryFromJson(String str) => GoodsCategory.fromJson(json.decode(str));
String goodsCategoryToJson(GoodsCategory data) => json.encode(data.toJson());
class GoodsCategory {
  GoodsCategory({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  GoodsCategory.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
GoodsCategory copyWith({  String? title,
  String? typename,
}) => GoodsCategory(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}

GoodsPackage goodsPackageFromJson(String str) => GoodsPackage.fromJson(json.decode(str));
String goodsPackageToJson(GoodsPackage data) => json.encode(data.toJson());
class GoodsPackage {
  GoodsPackage({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  GoodsPackage.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
GoodsPackage copyWith({  String? title,
  String? typename,
}) => GoodsPackage(  title: title ?? _title,
  typename: typename ?? _typename,
);
  String? get title => _title;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['__typename'] = _typename;
    return map;
  }

}