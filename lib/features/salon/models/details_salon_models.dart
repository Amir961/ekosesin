import 'dart:convert';
DetailsSalonModels detailsSalonModelsFromJson(String str) => DetailsSalonModels.fromJson(json.decode(str));
String detailsSalonModelsToJson(DetailsSalonModels data) => json.encode(data.toJson());
class DetailsSalonModels {
  DetailsSalonModels({
      String? id, 
      String? type, 
      String? value, 
      String? amount, 
      dynamic isTraffic, 
      num? isOfferable, 
      String? releaseType, 
      String? transportMethod, 
      String? loadingFromDate, 
      dynamic maximumDeliveryDate, 
      String? loadingToDate, 
      String? loadingHourFrom, 
      String? loadingHourTo, 
      String? unloadingHourFrom, 
      String? unloadingHourTo, 
      dynamic width, 
      dynamic height, 
      dynamic length, 
      String? dailyAmount, 
      String? remainingAmount, 
      dynamic hasTrackingGps, 
      dynamic hasRequiredBill, 
      dynamic goodsDescription, 
      String? createdAt, 
      GoodsPackage? goodsPackage, 
      GoodsCategory? goodsCategory, 
      dynamic goods, 
      dynamic cargo, 
      Company? company, 
      Creator? creator, 
      dynamic licenseRelease, 
      FirstOrigin? firstOrigin, 
      Destination? destination, 
      Loader? loader, 
      Status? status, 
      Financial? financial, 
      String? typename,}){
    _id = id;
    _type = type;
    _value = value;
    _amount = amount;
    _isTraffic = isTraffic;
    _isOfferable = isOfferable;
    _releaseType = releaseType;
    _transportMethod = transportMethod;
    _loadingFromDate = loadingFromDate;
    _maximumDeliveryDate = maximumDeliveryDate;
    _loadingToDate = loadingToDate;
    _loadingHourFrom = loadingHourFrom;
    _loadingHourTo = loadingHourTo;
    _unloadingHourFrom = unloadingHourFrom;
    _unloadingHourTo = unloadingHourTo;
    _width = width;
    _height = height;
    _length = length;
    _dailyAmount = dailyAmount;
    _remainingAmount = remainingAmount;
    _hasTrackingGps = hasTrackingGps;
    _hasRequiredBill = hasRequiredBill;
    _goodsDescription = goodsDescription;
    _createdAt = createdAt;
    _goodsPackage = goodsPackage;
    _goodsCategory = goodsCategory;
    _goods = goods;
    _cargo = cargo;
    _company = company;
    _creator = creator;
    _licenseRelease = licenseRelease;
    _firstOrigin = firstOrigin;
    _destination = destination;
    _loader = loader;
    _status = status;
    _financial = financial;
    _typename = typename;
}

  DetailsSalonModels.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _value = json['value'];
    _amount = json['amount'];
    _isTraffic = json['is_traffic'];
    _isOfferable = json['is_offerable'];
    _releaseType = json['release_type'];
    _transportMethod = json['transport_method'];
    _loadingFromDate = json['loading_from_date'];
    _maximumDeliveryDate = json['maximum_delivery_date'];
    _loadingToDate = json['loading_to_date'];
    _loadingHourFrom = json['loading_hour_from'];
    _loadingHourTo = json['loading_hour_to'];
    _unloadingHourFrom = json['unloading_hour_from'];
    _unloadingHourTo = json['unloading_hour_to'];
    _width = json['width'];
    _height = json['height'];
    _length = json['length'];
    _dailyAmount = json['daily_amount'];
    _remainingAmount = json['remaining_amount'];
    _hasTrackingGps = json['has_tracking_gps'];
    _hasRequiredBill = json['has_required_bill'];
    _goodsDescription = json['goods_description'];
    _createdAt = json['created_at'];
    _goodsPackage = json['goods_package'] != null ? GoodsPackage.fromJson(json['goods_package']) : null;
    _goodsCategory = json['goods_category'] != null ? GoodsCategory.fromJson(json['goods_category']) : null;
    _goods = json['goods'];
    _cargo = json['cargo'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    _licenseRelease = json['license_release'];
    _firstOrigin = json['first_origin'] != null ? FirstOrigin.fromJson(json['first_origin']) : null;
    _destination = json['destination'] != null ? Destination.fromJson(json['destination']) : null;
    _loader = json['loader'] != null ? Loader.fromJson(json['loader']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _financial = json['financial'] != null ? Financial.fromJson(json['financial']) : null;
    _typename = json['__typename'];
  }
  String? _id;
  String? _type;
  String? _value;
  String? _amount;
  dynamic _isTraffic;
  num? _isOfferable;
  String? _releaseType;
  String? _transportMethod;
  String? _loadingFromDate;
  dynamic _maximumDeliveryDate;
  String? _loadingToDate;
  String? _loadingHourFrom;
  String? _loadingHourTo;
  String? _unloadingHourFrom;
  String? _unloadingHourTo;
  dynamic _width;
  dynamic _height;
  dynamic _length;
  String? _dailyAmount;
  String? _remainingAmount;
  dynamic _hasTrackingGps;
  dynamic _hasRequiredBill;
  dynamic _goodsDescription;
  String? _createdAt;
  GoodsPackage? _goodsPackage;
  GoodsCategory? _goodsCategory;
  dynamic _goods;
  dynamic _cargo;
  Company? _company;
  Creator? _creator;
  dynamic _licenseRelease;
  FirstOrigin? _firstOrigin;
  Destination? _destination;
  Loader? _loader;
  Status? _status;
  Financial? _financial;
  String? _typename;
DetailsSalonModels copyWith({  String? id,
  String? type,
  String? value,
  String? amount,
  dynamic isTraffic,
  num? isOfferable,
  String? releaseType,
  String? transportMethod,
  String? loadingFromDate,
  dynamic maximumDeliveryDate,
  String? loadingToDate,
  String? loadingHourFrom,
  String? loadingHourTo,
  String? unloadingHourFrom,
  String? unloadingHourTo,
  dynamic width,
  dynamic height,
  dynamic length,
  String? dailyAmount,
  String? remainingAmount,
  dynamic hasTrackingGps,
  dynamic hasRequiredBill,
  dynamic goodsDescription,
  String? createdAt,
  GoodsPackage? goodsPackage,
  GoodsCategory? goodsCategory,
  dynamic goods,
  dynamic cargo,
  Company? company,
  Creator? creator,
  dynamic licenseRelease,
  FirstOrigin? firstOrigin,
  Destination? destination,
  Loader? loader,
  Status? status,
  Financial? financial,
  String? typename,
}) => DetailsSalonModels(  id: id ?? _id,
  type: type ?? _type,
  value: value ?? _value,
  amount: amount ?? _amount,
  isTraffic: isTraffic ?? _isTraffic,
  isOfferable: isOfferable ?? _isOfferable,
  releaseType: releaseType ?? _releaseType,
  transportMethod: transportMethod ?? _transportMethod,
  loadingFromDate: loadingFromDate ?? _loadingFromDate,
  maximumDeliveryDate: maximumDeliveryDate ?? _maximumDeliveryDate,
  loadingToDate: loadingToDate ?? _loadingToDate,
  loadingHourFrom: loadingHourFrom ?? _loadingHourFrom,
  loadingHourTo: loadingHourTo ?? _loadingHourTo,
  unloadingHourFrom: unloadingHourFrom ?? _unloadingHourFrom,
  unloadingHourTo: unloadingHourTo ?? _unloadingHourTo,
  width: width ?? _width,
  height: height ?? _height,
  length: length ?? _length,
  dailyAmount: dailyAmount ?? _dailyAmount,
  remainingAmount: remainingAmount ?? _remainingAmount,
  hasTrackingGps: hasTrackingGps ?? _hasTrackingGps,
  hasRequiredBill: hasRequiredBill ?? _hasRequiredBill,
  goodsDescription: goodsDescription ?? _goodsDescription,
  createdAt: createdAt ?? _createdAt,
  goodsPackage: goodsPackage ?? _goodsPackage,
  goodsCategory: goodsCategory ?? _goodsCategory,
  goods: goods ?? _goods,
  cargo: cargo ?? _cargo,
  company: company ?? _company,
  creator: creator ?? _creator,
  licenseRelease: licenseRelease ?? _licenseRelease,
  firstOrigin: firstOrigin ?? _firstOrigin,
  destination: destination ?? _destination,
  loader: loader ?? _loader,
  status: status ?? _status,
  financial: financial ?? _financial,
  typename: typename ?? _typename,
);
  String? get id => _id;
  String? get type => _type;
  String? get value => _value;
  String? get amount => _amount;
  dynamic get isTraffic => _isTraffic;
  num? get isOfferable => _isOfferable;
  String? get releaseType => _releaseType;
  String? get transportMethod => _transportMethod;
  String? get loadingFromDate => _loadingFromDate;
  dynamic get maximumDeliveryDate => _maximumDeliveryDate;
  String? get loadingToDate => _loadingToDate;
  String? get loadingHourFrom => _loadingHourFrom;
  String? get loadingHourTo => _loadingHourTo;
  String? get unloadingHourFrom => _unloadingHourFrom;
  String? get unloadingHourTo => _unloadingHourTo;
  dynamic get width => _width;
  dynamic get height => _height;
  dynamic get length => _length;
  String? get dailyAmount => _dailyAmount;
  String? get remainingAmount => _remainingAmount;
  dynamic get hasTrackingGps => _hasTrackingGps;
  dynamic get hasRequiredBill => _hasRequiredBill;
  dynamic get goodsDescription => _goodsDescription;
  String? get createdAt => _createdAt;
  GoodsPackage? get goodsPackage => _goodsPackage;
  GoodsCategory? get goodsCategory => _goodsCategory;
  dynamic get goods => _goods;
  dynamic get cargo => _cargo;
  Company? get company => _company;
  Creator? get creator => _creator;
  dynamic get licenseRelease => _licenseRelease;
  FirstOrigin? get firstOrigin => _firstOrigin;
  Destination? get destination => _destination;
  Loader? get loader => _loader;
  Status? get status => _status;
  Financial? get financial => _financial;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['value'] = _value;
    map['amount'] = _amount;
    map['is_traffic'] = _isTraffic;
    map['is_offerable'] = _isOfferable;
    map['release_type'] = _releaseType;
    map['transport_method'] = _transportMethod;
    map['loading_from_date'] = _loadingFromDate;
    map['maximum_delivery_date'] = _maximumDeliveryDate;
    map['loading_to_date'] = _loadingToDate;
    map['loading_hour_from'] = _loadingHourFrom;
    map['loading_hour_to'] = _loadingHourTo;
    map['unloading_hour_from'] = _unloadingHourFrom;
    map['unloading_hour_to'] = _unloadingHourTo;
    map['width'] = _width;
    map['height'] = _height;
    map['length'] = _length;
    map['daily_amount'] = _dailyAmount;
    map['remaining_amount'] = _remainingAmount;
    map['has_tracking_gps'] = _hasTrackingGps;
    map['has_required_bill'] = _hasRequiredBill;
    map['goods_description'] = _goodsDescription;
    map['created_at'] = _createdAt;
    if (_goodsPackage != null) {
      map['goods_package'] = _goodsPackage?.toJson();
    }
    if (_goodsCategory != null) {
      map['goods_category'] = _goodsCategory?.toJson();
    }
    map['goods'] = _goods;
    map['cargo'] = _cargo;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_creator != null) {
      map['creator'] = _creator?.toJson();
    }
    map['license_release'] = _licenseRelease;
    if (_firstOrigin != null) {
      map['first_origin'] = _firstOrigin?.toJson();
    }
    if (_destination != null) {
      map['destination'] = _destination?.toJson();
    }
    if (_loader != null) {
      map['loader'] = _loader?.toJson();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_financial != null) {
      map['financial'] = _financial?.toJson();
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
      PaymentMethod? paymentMethod, 
      String? loadingCost, 
      String? unloadingCost, 
      String? loadingBasculeCost, 
      String? unloadingBasculeCost, 
      String? issuanceCost, 
      dynamic settlementTime, 
      String? settlementDuration, 
      String? missingUnit, 
      String? missingAllowableValue, 
      dynamic missingCalculationType, 
      String? forfeitCalculationAmount, 
      String? typename,}){
    _driverTip = driverTip;
    _driverAmount = driverAmount;
    _prepaymentAmount = prepaymentAmount;
    _paymentMethod = paymentMethod;
    _loadingCost = loadingCost;
    _unloadingCost = unloadingCost;
    _loadingBasculeCost = loadingBasculeCost;
    _unloadingBasculeCost = unloadingBasculeCost;
    _issuanceCost = issuanceCost;
    _settlementTime = settlementTime;
    _settlementDuration = settlementDuration;
    _missingUnit = missingUnit;
    _missingAllowableValue = missingAllowableValue;
    _missingCalculationType = missingCalculationType;
    _forfeitCalculationAmount = forfeitCalculationAmount;
    _typename = typename;
}

  Financial.fromJson(dynamic json) {
    _driverTip = json['driver_tip'];
    _driverAmount = json['driver_amount'];
    _prepaymentAmount = json['prepayment_amount'];
    _paymentMethod = json['payment_method'] != null ? PaymentMethod.fromJson(json['payment_method']) : null;
    _loadingCost = json['loading_cost'];
    _unloadingCost = json['unloading_cost'];
    _loadingBasculeCost = json['loading_bascule_cost'];
    _unloadingBasculeCost = json['unloading_bascule_cost'];
    _issuanceCost = json['issuance_cost'];
    _settlementTime = json['settlement_time'];
    _settlementDuration = json['settlement_duration'];
    _missingUnit = json['missing_unit'];
    _missingAllowableValue = json['missing_allowable_value'];
    _missingCalculationType = json['missing_calculation_type'];
    _forfeitCalculationAmount = json['forfeit_calculation_amount'];
    _typename = json['__typename'];
  }
  String? _driverTip;
  String? _driverAmount;
  String? _prepaymentAmount;
  PaymentMethod? _paymentMethod;
  String? _loadingCost;
  String? _unloadingCost;
  String? _loadingBasculeCost;
  String? _unloadingBasculeCost;
  String? _issuanceCost;
  dynamic _settlementTime;
  String? _settlementDuration;
  String? _missingUnit;
  String? _missingAllowableValue;
  dynamic _missingCalculationType;
  String? _forfeitCalculationAmount;
  String? _typename;
Financial copyWith({  String? driverTip,
  String? driverAmount,
  String? prepaymentAmount,
  PaymentMethod? paymentMethod,
  String? loadingCost,
  String? unloadingCost,
  String? loadingBasculeCost,
  String? unloadingBasculeCost,
  String? issuanceCost,
  dynamic settlementTime,
  String? settlementDuration,
  String? missingUnit,
  String? missingAllowableValue,
  dynamic missingCalculationType,
  String? forfeitCalculationAmount,
  String? typename,
}) => Financial(  driverTip: driverTip ?? _driverTip,
  driverAmount: driverAmount ?? _driverAmount,
  prepaymentAmount: prepaymentAmount ?? _prepaymentAmount,
  paymentMethod: paymentMethod ?? _paymentMethod,
  loadingCost: loadingCost ?? _loadingCost,
  unloadingCost: unloadingCost ?? _unloadingCost,
  loadingBasculeCost: loadingBasculeCost ?? _loadingBasculeCost,
  unloadingBasculeCost: unloadingBasculeCost ?? _unloadingBasculeCost,
  issuanceCost: issuanceCost ?? _issuanceCost,
  settlementTime: settlementTime ?? _settlementTime,
  settlementDuration: settlementDuration ?? _settlementDuration,
  missingUnit: missingUnit ?? _missingUnit,
  missingAllowableValue: missingAllowableValue ?? _missingAllowableValue,
  missingCalculationType: missingCalculationType ?? _missingCalculationType,
  forfeitCalculationAmount: forfeitCalculationAmount ?? _forfeitCalculationAmount,
  typename: typename ?? _typename,
);
  String? get driverTip => _driverTip;
  String? get driverAmount => _driverAmount;
  String? get prepaymentAmount => _prepaymentAmount;
  PaymentMethod? get paymentMethod => _paymentMethod;
  String? get loadingCost => _loadingCost;
  String? get unloadingCost => _unloadingCost;
  String? get loadingBasculeCost => _loadingBasculeCost;
  String? get unloadingBasculeCost => _unloadingBasculeCost;
  String? get issuanceCost => _issuanceCost;
  dynamic get settlementTime => _settlementTime;
  String? get settlementDuration => _settlementDuration;
  String? get missingUnit => _missingUnit;
  String? get missingAllowableValue => _missingAllowableValue;
  dynamic get missingCalculationType => _missingCalculationType;
  String? get forfeitCalculationAmount => _forfeitCalculationAmount;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_tip'] = _driverTip;
    map['driver_amount'] = _driverAmount;
    map['prepayment_amount'] = _prepaymentAmount;
    if (_paymentMethod != null) {
      map['payment_method'] = _paymentMethod?.toJson();
    }
    map['loading_cost'] = _loadingCost;
    map['unloading_cost'] = _unloadingCost;
    map['loading_bascule_cost'] = _loadingBasculeCost;
    map['unloading_bascule_cost'] = _unloadingBasculeCost;
    map['issuance_cost'] = _issuanceCost;
    map['settlement_time'] = _settlementTime;
    map['settlement_duration'] = _settlementDuration;
    map['missing_unit'] = _missingUnit;
    map['missing_allowable_value'] = _missingAllowableValue;
    map['missing_calculation_type'] = _missingCalculationType;
    map['forfeit_calculation_amount'] = _forfeitCalculationAmount;
    map['__typename'] = _typename;
    return map;
  }

}

PaymentMethod paymentMethodFromJson(String str) => PaymentMethod.fromJson(json.decode(str));
String paymentMethodToJson(PaymentMethod data) => json.encode(data.toJson());
class PaymentMethod {
  PaymentMethod({
      String? title, 
      String? typename,}){
    _title = title;
    _typename = typename;
}

  PaymentMethod.fromJson(dynamic json) {
    _title = json['title'];
    _typename = json['__typename'];
  }
  String? _title;
  String? _typename;
PaymentMethod copyWith({  String? title,
  String? typename,
}) => PaymentMethod(  title: title ?? _title,
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

Loader loaderFromJson(String str) => Loader.fromJson(json.decode(str));
String loaderToJson(Loader data) => json.encode(data.toJson());
class Loader {
  Loader({
      VehicleCategory? vehicleCategory, 
      LoaderCategory? loaderCategory, 
      String? typename,}){
    _vehicleCategory = vehicleCategory;
    _loaderCategory = loaderCategory;
    _typename = typename;
}

  Loader.fromJson(dynamic json) {
    _vehicleCategory = json['vehicle_category'] != null ? VehicleCategory.fromJson(json['vehicle_category']) : null;
    _loaderCategory = json['loader_category'] != null ? LoaderCategory.fromJson(json['loader_category']) : null;
    _typename = json['__typename'];
  }
  VehicleCategory? _vehicleCategory;
  LoaderCategory? _loaderCategory;
  String? _typename;
Loader copyWith({  VehicleCategory? vehicleCategory,
  LoaderCategory? loaderCategory,
  String? typename,
}) => Loader(  vehicleCategory: vehicleCategory ?? _vehicleCategory,
  loaderCategory: loaderCategory ?? _loaderCategory,
  typename: typename ?? _typename,
);
  VehicleCategory? get vehicleCategory => _vehicleCategory;
  LoaderCategory? get loaderCategory => _loaderCategory;
  String? get typename => _typename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vehicleCategory != null) {
      map['vehicle_category'] = _vehicleCategory?.toJson();
    }
    if (_loaderCategory != null) {
      map['loader_category'] = _loaderCategory?.toJson();
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