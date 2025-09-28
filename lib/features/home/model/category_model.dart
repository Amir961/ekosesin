import 'dart:convert';

import '../../../core/res/constant.dart';
CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      num? id, 
      dynamic parentId, 
      dynamic belongsToId, 
      num? userId, 
      num? languageId, 
      String? title, 
      String? content, 
      dynamic relatedArticles, 
      String? metaTitle, 
      String? metaDescription, 
      dynamic metaKeywords, 
      String? url, 
      String? icon, 
      num? score, 
      num? price, 
      String? iconSvg, 
      List<CategoryModel>? children,
      dynamic attributeId,
      String? languageContraction, 
      List<Translates>? translates,
      List<Attributes>? attributes,
      Translate? translate,
      Language? language,}){
    _id = id;
    _parentId = parentId;
    _belongsToId = belongsToId;
    _userId = userId;
    _languageId = languageId;
    _title = title;
    _content = content;
    _relatedArticles = relatedArticles;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _metaKeywords = metaKeywords;
    _url = url;
    _icon = icon;
    _score = score;
    _price = price;
    _iconSvg = iconSvg;
    _children = children;
    _attributeId = attributeId;
    _languageContraction = languageContraction;
    _translates = translates;
    _attributes = attributes;
    _translate = translate;
    _language = language;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _belongsToId = json['belongs_to_id'];
    _userId = json['user_id'];
    _languageId = json['language_id'];
    _title = json['title'];
    _content = json['content'];
    _relatedArticles = json['related_articles'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaKeywords = json['meta_keywords'];
    _url = json['url'];
    _icon = json['icon'];
    _score = json['score'];
    _price = json['price'];
    _iconSvg = json['icon_svg'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(CategoryModel.fromJson(v));
      });
    }
    _attributeId = json['attribute_id'];
    _languageContraction = json['language_contraction'];
    if (json['translates'] != null) {
      _translates = [];
      json['translates'].forEach((v) {
        _translates?.add(Translates.fromJson(v));
      });
    }

    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    _translate = json['translate'] != null ? Translate.fromJson(json['translate']) : null;
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }
  num? _id;
  dynamic _parentId;
  dynamic _belongsToId;
  num? _userId;
  num? _languageId;
  String? _title;
  String? _content;
  dynamic _relatedArticles;
  String? _metaTitle;
  String? _metaDescription;
  dynamic _metaKeywords;
  String? _url;
  String? _icon;
  num? _score;
  num? _price;
  String? _iconSvg;
  List<CategoryModel>? _children;
  dynamic _attributeId;
  String? _languageContraction;
  List<Translates>? _translates;
  List<Attributes>? _attributes;
  Translate? _translate;
  Language? _language;
CategoryModel copyWith({  num? id,
  dynamic parentId,
  dynamic belongsToId,
  num? userId,
  num? languageId,
  String? title,
  String? content,
  dynamic relatedArticles,
  String? metaTitle,
  String? metaDescription,
  dynamic metaKeywords,
  String? url,
  String? icon,
  num? score,
  num? price,
  String? iconSvg,
  List<CategoryModel>? children,
  dynamic attributeId,
  String? languageContraction,
  List<Translates>? translates,
  List<Attributes>? attributes,
  Translate? translate,
  Language? language,
}) => CategoryModel(  id: id ?? _id,
  parentId: parentId ?? _parentId,
  belongsToId: belongsToId ?? _belongsToId,
  userId: userId ?? _userId,
  languageId: languageId ?? _languageId,
  title: title ?? _title,
  content: content ?? _content,
  relatedArticles: relatedArticles ?? _relatedArticles,
  metaTitle: metaTitle ?? _metaTitle,
  metaDescription: metaDescription ?? _metaDescription,
  metaKeywords: metaKeywords ?? _metaKeywords,
  url: url ?? _url,
  icon: icon ?? _icon,
  score: score ?? _score,
  price: price ?? _price,
  iconSvg: iconSvg ?? _iconSvg,
  children: children ?? _children,
  attributeId: attributeId ?? _attributeId,
  languageContraction: languageContraction ?? _languageContraction,
  translates: translates ?? _translates,
  attributes: attributes ?? _attributes,
  translate: translate ?? _translate,
  language: language ?? _language,
);
  num? get id => _id;
  dynamic get parentId => _parentId;
  dynamic get belongsToId => _belongsToId;
  num? get userId => _userId;
  num? get languageId => _languageId;
  String? get title => _title;
  String? get content => _content;
  dynamic get relatedArticles => _relatedArticles;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  dynamic get metaKeywords => _metaKeywords;
  String? get url => _url;
  String? get icon => _icon;
  num? get score => _score;
  num? get price => _price;
  String? get iconSvg => _iconSvg;
  List<CategoryModel>? get children => _children;
  dynamic get attributeId => _attributeId;
  String? get languageContraction => _languageContraction;
  List<Translates>? get translates => _translates;
  List<Attributes>? get attributes => _attributes;
  Translate? get translate => _translate;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['belongs_to_id'] = _belongsToId;
    map['user_id'] = _userId;
    map['language_id'] = _languageId;
    map['title'] = _title;
    map['content'] = _content;
    map['related_articles'] = _relatedArticles;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['meta_keywords'] = _metaKeywords;
    map['url'] = _url;
    map['icon'] = _icon;
    map['score'] = _score;
    map['price'] = _price;
    map['icon_svg'] = _iconSvg;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['attribute_id'] = _attributeId;
    map['language_contraction'] = _languageContraction;
    if (_translates != null) {
      map['translates'] = _translates?.map((v) => v.toJson()).toList();
    }
    if (_translate != null) {
      map['translate'] = _translate?.toJson();
    }
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

  String translateTitle() {
    for (Translates categoryModel in translates??[]) {
      if (categoryModel.languageContraction == globalLanguageId) {
        return categoryModel.title??'';
      }
    }
    return title??'';
  }

  String translateMetaTitle() {
    for (Translates categoryModel in translates??[]) {
      if (categoryModel.languageContraction == globalLanguageId) {
        return categoryModel.metaTitle??'';
      }
    }
    return metaTitle??'';
  }

}

Language languageFromJson(String str) => Language.fromJson(json.decode(str));
String languageToJson(Language data) => json.encode(data.toJson());
class Language {
  Language({
      num? id, 
      String? title, 
      bool? isActive, 
      bool? aiTranslationSupported, 
      dynamic image, 
      dynamic imageHost, 
      String? contraction, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _title = title;
    _isActive = isActive;
    _aiTranslationSupported = aiTranslationSupported;
    _image = image;
    _imageHost = imageHost;
    _contraction = contraction;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Language.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _isActive = json['is_active'];
    _aiTranslationSupported = json['ai_translation_supported'];
    _image = json['image'];
    _imageHost = json['image_host'];
    _contraction = json['contraction'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _title;
  bool? _isActive;
  bool? _aiTranslationSupported;
  dynamic _image;
  dynamic _imageHost;
  String? _contraction;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
Language copyWith({  num? id,
  String? title,
  bool? isActive,
  bool? aiTranslationSupported,
  dynamic image,
  dynamic imageHost,
  String? contraction,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Language(  id: id ?? _id,
  title: title ?? _title,
  isActive: isActive ?? _isActive,
  aiTranslationSupported: aiTranslationSupported ?? _aiTranslationSupported,
  image: image ?? _image,
  imageHost: imageHost ?? _imageHost,
  contraction: contraction ?? _contraction,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  String? get title => _title;
  bool? get isActive => _isActive;
  bool? get aiTranslationSupported => _aiTranslationSupported;
  dynamic get image => _image;
  dynamic get imageHost => _imageHost;
  String? get contraction => _contraction;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['is_active'] = _isActive;
    map['ai_translation_supported'] = _aiTranslationSupported;
    map['image'] = _image;
    map['image_host'] = _imageHost;
    map['contraction'] = _contraction;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}

Translate translateFromJson(String str) => Translate.fromJson(json.decode(str));
String translateToJson(Translate data) => json.encode(data.toJson());
class Translate {
  Translate({
      num? id, 
      dynamic parentId, 
      num? belongsToId, 
      num? userId, 
      num? languageId, 
      String? title, 
      String? content, 
      dynamic relatedArticles, 
      String? metaTitle, 
      String? metaDescription, 
      dynamic metaKeywords, 
      String? url, 
      dynamic icon, 
      num? score, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      num? price, 
      dynamic iconSvg, 
      dynamic children, 
      dynamic attributeId, 
      String? languageContraction, 
      Language? language,}){
    _id = id;
    _parentId = parentId;
    _belongsToId = belongsToId;
    _userId = userId;
    _languageId = languageId;
    _title = title;
    _content = content;
    _relatedArticles = relatedArticles;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _metaKeywords = metaKeywords;
    _url = url;
    _icon = icon;
    _score = score;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _price = price;
    _iconSvg = iconSvg;
    _children = children;
    _attributeId = attributeId;
    _languageContraction = languageContraction;
    _language = language;
}

  Translate.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _belongsToId = json['belongs_to_id'];
    _userId = json['user_id'];
    _languageId = json['language_id'];
    _title = json['title'];
    _content = json['content'];
    _relatedArticles = json['related_articles'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaKeywords = json['meta_keywords'];
    _url = json['url'];
    _icon = json['icon'];
    _score = json['score'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _price = json['price'];
    _iconSvg = json['icon_svg'];
    _children = json['children'];
    _attributeId = json['attribute_id'];
    _languageContraction = json['language_contraction'];
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }
  num? _id;
  dynamic _parentId;
  num? _belongsToId;
  num? _userId;
  num? _languageId;
  String? _title;
  String? _content;
  dynamic _relatedArticles;
  String? _metaTitle;
  String? _metaDescription;
  dynamic _metaKeywords;
  String? _url;
  dynamic _icon;
  num? _score;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  num? _price;
  dynamic _iconSvg;
  dynamic _children;
  dynamic _attributeId;
  String? _languageContraction;
  Language? _language;
Translate copyWith({  num? id,
  dynamic parentId,
  num? belongsToId,
  num? userId,
  num? languageId,
  String? title,
  String? content,
  dynamic relatedArticles,
  String? metaTitle,
  String? metaDescription,
  dynamic metaKeywords,
  String? url,
  dynamic icon,
  num? score,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  num? price,
  dynamic iconSvg,
  dynamic children,
  dynamic attributeId,
  String? languageContraction,
  Language? language,
}) => Translate(  id: id ?? _id,
  parentId: parentId ?? _parentId,
  belongsToId: belongsToId ?? _belongsToId,
  userId: userId ?? _userId,
  languageId: languageId ?? _languageId,
  title: title ?? _title,
  content: content ?? _content,
  relatedArticles: relatedArticles ?? _relatedArticles,
  metaTitle: metaTitle ?? _metaTitle,
  metaDescription: metaDescription ?? _metaDescription,
  metaKeywords: metaKeywords ?? _metaKeywords,
  url: url ?? _url,
  icon: icon ?? _icon,
  score: score ?? _score,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  price: price ?? _price,
  iconSvg: iconSvg ?? _iconSvg,
  children: children ?? _children,
  attributeId: attributeId ?? _attributeId,
  languageContraction: languageContraction ?? _languageContraction,
  language: language ?? _language,
);
  num? get id => _id;
  dynamic get parentId => _parentId;
  num? get belongsToId => _belongsToId;
  num? get userId => _userId;
  num? get languageId => _languageId;
  String? get title => _title;
  String? get content => _content;
  dynamic get relatedArticles => _relatedArticles;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  dynamic get metaKeywords => _metaKeywords;
  String? get url => _url;
  dynamic get icon => _icon;
  num? get score => _score;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  num? get price => _price;
  dynamic get iconSvg => _iconSvg;
  dynamic get children => _children;
  dynamic get attributeId => _attributeId;
  String? get languageContraction => _languageContraction;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['belongs_to_id'] = _belongsToId;
    map['user_id'] = _userId;
    map['language_id'] = _languageId;
    map['title'] = _title;
    map['content'] = _content;
    map['related_articles'] = _relatedArticles;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['meta_keywords'] = _metaKeywords;
    map['url'] = _url;
    map['icon'] = _icon;
    map['score'] = _score;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['price'] = _price;
    map['icon_svg'] = _iconSvg;
    map['children'] = _children;
    map['attribute_id'] = _attributeId;
    map['language_contraction'] = _languageContraction;
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

}



Translates translatesFromJson(String str) => Translates.fromJson(json.decode(str));
String translatesToJson(Translates data) => json.encode(data.toJson());
class Translates {
  Translates({
      num? id, 
      dynamic parentId, 
      num? belongsToId, 
      num? userId, 
      num? languageId, 
      String? title, 
      String? content, 
      dynamic relatedArticles, 
      String? metaTitle, 
      String? metaDescription, 
      dynamic metaKeywords, 
      String? url, 
      dynamic icon, 
      num? score, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      num? price, 
      dynamic iconSvg, 
      dynamic children, 
      dynamic attributeId, 
      String? languageContraction, 
      Language? language,}){
    _id = id;
    _parentId = parentId;
    _belongsToId = belongsToId;
    _userId = userId;
    _languageId = languageId;
    _title = title;
    _content = content;
    _relatedArticles = relatedArticles;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _metaKeywords = metaKeywords;
    _url = url;
    _icon = icon;
    _score = score;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _price = price;
    _iconSvg = iconSvg;
    _children = children;
    _attributeId = attributeId;
    _languageContraction = languageContraction;
    _language = language;
}

  Translates.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _belongsToId = json['belongs_to_id'];
    _userId = json['user_id'];
    _languageId = json['language_id'];
    _title = json['title'];
    _content = json['content'];
    _relatedArticles = json['related_articles'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaKeywords = json['meta_keywords'];
    _url = json['url'];
    _icon = json['icon'];
    _score = json['score'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _price = json['price'];
    _iconSvg = json['icon_svg'];
    _children = json['children'];
    _attributeId = json['attribute_id'];
    _languageContraction = json['language_contraction'];
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }
  num? _id;
  dynamic _parentId;
  num? _belongsToId;
  num? _userId;
  num? _languageId;
  String? _title;
  String? _content;
  dynamic _relatedArticles;
  String? _metaTitle;
  String? _metaDescription;
  dynamic _metaKeywords;
  String? _url;
  dynamic _icon;
  num? _score;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  num? _price;
  dynamic _iconSvg;
  dynamic _children;
  dynamic _attributeId;
  String? _languageContraction;
  Language? _language;
Translates copyWith({  num? id,
  dynamic parentId,
  num? belongsToId,
  num? userId,
  num? languageId,
  String? title,
  String? content,
  dynamic relatedArticles,
  String? metaTitle,
  String? metaDescription,
  dynamic metaKeywords,
  String? url,
  dynamic icon,
  num? score,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  num? price,
  dynamic iconSvg,
  dynamic children,
  dynamic attributeId,
  String? languageContraction,
  Language? language,
}) => Translates(  id: id ?? _id,
  parentId: parentId ?? _parentId,
  belongsToId: belongsToId ?? _belongsToId,
  userId: userId ?? _userId,
  languageId: languageId ?? _languageId,
  title: title ?? _title,
  content: content ?? _content,
  relatedArticles: relatedArticles ?? _relatedArticles,
  metaTitle: metaTitle ?? _metaTitle,
  metaDescription: metaDescription ?? _metaDescription,
  metaKeywords: metaKeywords ?? _metaKeywords,
  url: url ?? _url,
  icon: icon ?? _icon,
  score: score ?? _score,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  price: price ?? _price,
  iconSvg: iconSvg ?? _iconSvg,
  children: children ?? _children,
  attributeId: attributeId ?? _attributeId,
  languageContraction: languageContraction ?? _languageContraction,
  language: language ?? _language,
);
  num? get id => _id;
  dynamic get parentId => _parentId;
  num? get belongsToId => _belongsToId;
  num? get userId => _userId;
  num? get languageId => _languageId;
  String? get title => _title;
  String? get content => _content;
  dynamic get relatedArticles => _relatedArticles;
  String? get metaTitle => _metaTitle;
  String? get metaDescription => _metaDescription;
  dynamic get metaKeywords => _metaKeywords;
  String? get url => _url;
  dynamic get icon => _icon;
  num? get score => _score;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  num? get price => _price;
  dynamic get iconSvg => _iconSvg;
  dynamic get children => _children;
  dynamic get attributeId => _attributeId;
  String? get languageContraction => _languageContraction;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['belongs_to_id'] = _belongsToId;
    map['user_id'] = _userId;
    map['language_id'] = _languageId;
    map['title'] = _title;
    map['content'] = _content;
    map['related_articles'] = _relatedArticles;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['meta_keywords'] = _metaKeywords;
    map['url'] = _url;
    map['icon'] = _icon;
    map['score'] = _score;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['price'] = _price;
    map['icon_svg'] = _iconSvg;
    map['children'] = _children;
    map['attribute_id'] = _attributeId;
    map['language_contraction'] = _languageContraction;
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

}



// Children childrenFromJson(String str) => Children.fromJson(json.decode(str));
// String childrenToJson(Children data) => json.encode(data.toJson());
// class Children {
//   Children({
//       num? id,
//       num? parentId,
//       dynamic belongsToId,
//       num? userId,
//       num? languageId,
//       String? title,
//       String? content,
//       dynamic relatedArticles,
//       String? metaTitle,
//       String? metaDescription,
//       dynamic metaKeywords,
//       String? url,
//       String? icon,
//       num? score,
//       String? createdAt,
//       String? updatedAt,
//       dynamic deletedAt,
//       num? price,
//       String? iconSvg,
//       List<Children>? children,
//       dynamic attributeId,
//       String? languageContraction,
//       Translate? translate,
//       List<Attributes>? attributes,
//       List<Translates>? translates,
//       Language? language,}){
//     _id = id;
//     _parentId = parentId;
//     _belongsToId = belongsToId;
//     _userId = userId;
//     _languageId = languageId;
//     _title = title;
//     _content = content;
//     _relatedArticles = relatedArticles;
//     _metaTitle = metaTitle;
//     _metaDescription = metaDescription;
//     _metaKeywords = metaKeywords;
//     _url = url;
//     _icon = icon;
//     _score = score;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _deletedAt = deletedAt;
//     _price = price;
//     _iconSvg = iconSvg;
//     _children = children;
//     _attributeId = attributeId;
//     _languageContraction = languageContraction;
//     _translate = translate;
//     _attributes = attributes;
//     _translates = translates;
//     _language = language;
// }
//
//   Children.fromJson(dynamic json) {
//     _id = json['id'];
//     _parentId = json['parent_id'];
//     _belongsToId = json['belongs_to_id'];
//     _userId = json['user_id'];
//     _languageId = json['language_id'];
//     _title = json['title'];
//     _content = json['content'];
//     _relatedArticles = json['related_articles'];
//     _metaTitle = json['meta_title'];
//     _metaDescription = json['meta_description'];
//     _metaKeywords = json['meta_keywords'];
//     _url = json['url'];
//     _icon = json['icon'];
//     _score = json['score'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _deletedAt = json['deleted_at'];
//     _price = json['price'];
//     _iconSvg = json['icon_svg'];
//     if (json['children'] != null) {
//       _children = [];
//       json['children'].forEach((v) {
//         _children?.add(Children.fromJson(v));
//       });
//     }
//     _attributeId = json['attribute_id'];
//     _languageContraction = json['language_contraction'];
//     _translate = json['translate'] != null ? Translate.fromJson(json['translate']) : null;
//     if (json['attributes'] != null) {
//       _attributes = [];
//       json['attributes'].forEach((v) {
//         _attributes?.add(Attributes.fromJson(v));
//       });
//     }
//     if (json['translates'] != null) {
//       _translates = [];
//       json['translates'].forEach((v) {
//         _translates?.add(Translates.fromJson(v));
//       });
//     }
//     _language = json['language'] != null ? Language.fromJson(json['language']) : null;
//   }
//   num? _id;
//   num? _parentId;
//   dynamic _belongsToId;
//   num? _userId;
//   num? _languageId;
//   String? _title;
//   String? _content;
//   dynamic _relatedArticles;
//   String? _metaTitle;
//   String? _metaDescription;
//   dynamic _metaKeywords;
//   String? _url;
//   String? _icon;
//   num? _score;
//   String? _createdAt;
//   String? _updatedAt;
//   dynamic _deletedAt;
//   num? _price;
//   String? _iconSvg;
//   List<Children>? _children;
//   dynamic _attributeId;
//   String? _languageContraction;
//   Translate? _translate;
//   List<Attributes>? _attributes;
//   List<Translates>? _translates;
//   Language? _language;
// Children copyWith({  num? id,
//   num? parentId,
//   dynamic belongsToId,
//   num? userId,
//   num? languageId,
//   String? title,
//   String? content,
//   dynamic relatedArticles,
//   String? metaTitle,
//   String? metaDescription,
//   dynamic metaKeywords,
//   String? url,
//   String? icon,
//   num? score,
//   String? createdAt,
//   String? updatedAt,
//   dynamic deletedAt,
//   num? price,
//   String? iconSvg,
//   List<Children>? children,
//   dynamic attributeId,
//   String? languageContraction,
//   Translate? translate,
//   List<Attributes>? attributes,
//   List<Translates>? translates,
//   Language? language,
// }) => Children(  id: id ?? _id,
//   parentId: parentId ?? _parentId,
//   belongsToId: belongsToId ?? _belongsToId,
//   userId: userId ?? _userId,
//   languageId: languageId ?? _languageId,
//   title: title ?? _title,
//   content: content ?? _content,
//   relatedArticles: relatedArticles ?? _relatedArticles,
//   metaTitle: metaTitle ?? _metaTitle,
//   metaDescription: metaDescription ?? _metaDescription,
//   metaKeywords: metaKeywords ?? _metaKeywords,
//   url: url ?? _url,
//   icon: icon ?? _icon,
//   score: score ?? _score,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   deletedAt: deletedAt ?? _deletedAt,
//   price: price ?? _price,
//   iconSvg: iconSvg ?? _iconSvg,
//   children: children ?? _children,
//   attributeId: attributeId ?? _attributeId,
//   languageContraction: languageContraction ?? _languageContraction,
//   translate: translate ?? _translate,
//   attributes: attributes ?? _attributes,
//   translates: translates ?? _translates,
//   language: language ?? _language,
// );
//   num? get id => _id;
//   num? get parentId => _parentId;
//   dynamic get belongsToId => _belongsToId;
//   num? get userId => _userId;
//   num? get languageId => _languageId;
//   String? get title => _title;
//   String? get content => _content;
//   dynamic get relatedArticles => _relatedArticles;
//   String? get metaTitle => _metaTitle;
//   String? get metaDescription => _metaDescription;
//   dynamic get metaKeywords => _metaKeywords;
//   String? get url => _url;
//   String? get icon => _icon;
//   num? get score => _score;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   dynamic get deletedAt => _deletedAt;
//   num? get price => _price;
//   String? get iconSvg => _iconSvg;
//   List<Children>? get children => _children;
//   dynamic get attributeId => _attributeId;
//   String? get languageContraction => _languageContraction;
//   Translate? get translate => _translate;
//   List<Attributes>? get attributes => _attributes;
//   List<Translates>? get translates => _translates;
//   Language? get language => _language;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['parent_id'] = _parentId;
//     map['belongs_to_id'] = _belongsToId;
//     map['user_id'] = _userId;
//     map['language_id'] = _languageId;
//     map['title'] = _title;
//     map['content'] = _content;
//     map['related_articles'] = _relatedArticles;
//     map['meta_title'] = _metaTitle;
//     map['meta_description'] = _metaDescription;
//     map['meta_keywords'] = _metaKeywords;
//     map['url'] = _url;
//     map['icon'] = _icon;
//     map['score'] = _score;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['deleted_at'] = _deletedAt;
//     map['price'] = _price;
//     map['icon_svg'] = _iconSvg;
//     if (_children != null) {
//       map['children'] = _children?.map((v) => v.toJson()).toList();
//     }
//     map['attribute_id'] = _attributeId;
//     map['language_contraction'] = _languageContraction;
//     if (_translate != null) {
//       map['translate'] = _translate?.toJson();
//     }
//     if (_attributes != null) {
//       map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
//     }
//     if (_translates != null) {
//       map['translates'] = _translates?.map((v) => v.toJson()).toList();
//     }
//     if (_language != null) {
//       map['language'] = _language?.toJson();
//     }
//     return map;
//   }
//
// }







Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      num? id, 
      num? attributeGroupId, 
      num? languageId, 
      String? title, 
      dynamic iconImage, 
      dynamic iconHost, 
      dynamic iconFull, 
      String? type, 
      num? hasListValue, 
      num? isSearchable, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? iconSvg, 
      String? useFor, 
      String? languageContraction, 
      Pivot? pivot, 
      Translate? translate, 
      List<DefaultValues>? defaultValues, 
      Language? language,}){
    _id = id;
    _attributeGroupId = attributeGroupId;
    _languageId = languageId;
    _title = title;
    _iconImage = iconImage;
    _iconHost = iconHost;
    _iconFull = iconFull;
    _type = type;
    _hasListValue = hasListValue;
    _isSearchable = isSearchable;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _iconSvg = iconSvg;
    _useFor = useFor;
    _languageContraction = languageContraction;
    _pivot = pivot;
    _translate = translate;
    _defaultValues = defaultValues;
    _language = language;
}

  Attributes.fromJson(dynamic json) {
    _id = json['id'];
    _attributeGroupId = json['attribute_group_id'];
    _languageId = json['language_id'];
    _title = json['title'];
    _iconImage = json['icon_image'];
    _iconHost = json['icon_host'];
    _iconFull = json['icon_full'];
    _type = json['type'];
    _hasListValue = json['has_list_value'];
    _isSearchable = json['is_searchable'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _iconSvg = json['icon_svg'];
    _useFor = json['use_for'];
    _languageContraction = json['language_contraction'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    _translate = json['translate'] != null ? Translate.fromJson(json['translate']) : null;
    if (json['default_values'] != null) {
      _defaultValues = [];
      json['default_values'].forEach((v) {
        _defaultValues?.add(DefaultValues.fromJson(v));
      });
    }
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }
  num? _id;
  num? _attributeGroupId;
  num? _languageId;
  String? _title;
  dynamic _iconImage;
  dynamic _iconHost;
  dynamic _iconFull;
  String? _type;
  num? _hasListValue;
  num? _isSearchable;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _iconSvg;
  String? _useFor;
  String? _languageContraction;
  Pivot? _pivot;
  Translate? _translate;
  List<DefaultValues>? _defaultValues;
  Language? _language;
Attributes copyWith({  num? id,
  num? attributeGroupId,
  num? languageId,
  String? title,
  dynamic iconImage,
  dynamic iconHost,
  dynamic iconFull,
  String? type,
  num? hasListValue,
  num? isSearchable,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? iconSvg,
  String? useFor,
  String? languageContraction,
  Pivot? pivot,
  Translate? translate,
  List<DefaultValues>? defaultValues,
  Language? language,
}) => Attributes(  id: id ?? _id,
  attributeGroupId: attributeGroupId ?? _attributeGroupId,
  languageId: languageId ?? _languageId,
  title: title ?? _title,
  iconImage: iconImage ?? _iconImage,
  iconHost: iconHost ?? _iconHost,
  iconFull: iconFull ?? _iconFull,
  type: type ?? _type,
  hasListValue: hasListValue ?? _hasListValue,
  isSearchable: isSearchable ?? _isSearchable,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  iconSvg: iconSvg ?? _iconSvg,
  useFor: useFor ?? _useFor,
  languageContraction: languageContraction ?? _languageContraction,
  pivot: pivot ?? _pivot,
  translate: translate ?? _translate,
  defaultValues: defaultValues ?? _defaultValues,
  language: language ?? _language,
);
  num? get id => _id;
  num? get attributeGroupId => _attributeGroupId;
  num? get languageId => _languageId;
  String? get title => _title;
  dynamic get iconImage => _iconImage;
  dynamic get iconHost => _iconHost;
  dynamic get iconFull => _iconFull;
  String? get type => _type;
  num? get hasListValue => _hasListValue;
  num? get isSearchable => _isSearchable;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get iconSvg => _iconSvg;
  String? get useFor => _useFor;
  String? get languageContraction => _languageContraction;
  Pivot? get pivot => _pivot;
  Translate? get translate => _translate;
  List<DefaultValues>? get defaultValues => _defaultValues;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['attribute_group_id'] = _attributeGroupId;
    map['language_id'] = _languageId;
    map['title'] = _title;
    map['icon_image'] = _iconImage;
    map['icon_host'] = _iconHost;
    map['icon_full'] = _iconFull;
    map['type'] = _type;
    map['has_list_value'] = _hasListValue;
    map['is_searchable'] = _isSearchable;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['icon_svg'] = _iconSvg;
    map['use_for'] = _useFor;
    map['language_contraction'] = _languageContraction;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    if (_translate != null) {
      map['translate'] = _translate?.toJson();
    }
    if (_defaultValues != null) {
      map['default_values'] = _defaultValues?.map((v) => v.toJson()).toList();
    }
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

}



DefaultValues defaultValuesFromJson(String str) => DefaultValues.fromJson(json.decode(str));
String defaultValuesToJson(DefaultValues data) => json.encode(data.toJson());
class DefaultValues {
  DefaultValues({
      num? id, 
      dynamic parentValueId, 
      num? languageId, 
      num? attributeId, 
      String? title, 
      dynamic url, 
      dynamic imageCfUrl, 
      dynamic imageUrl, 
      dynamic description, 
      dynamic metaTitle, 
      dynamic metaDescription, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      num? categoryId,}){
    _id = id;
    _parentValueId = parentValueId;
    _languageId = languageId;
    _attributeId = attributeId;
    _title = title;
    _url = url;
    _imageCfUrl = imageCfUrl;
    _imageUrl = imageUrl;
    _description = description;
    _metaTitle = metaTitle;
    _metaDescription = metaDescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _categoryId = categoryId;
}

  DefaultValues.fromJson(dynamic json) {
    _id = json['id'];
    _parentValueId = json['parent_value_id'];
    _languageId = json['language_id'];
    _attributeId = json['attribute_id'];
    _title = json['title'];
    _url = json['url'];
    _imageCfUrl = json['image_cf_url'];
    _imageUrl = json['image_url'];
    _description = json['description'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _categoryId = json['category_id'];
  }
  num? _id;
  dynamic _parentValueId;
  num? _languageId;
  num? _attributeId;
  String? _title;
  dynamic _url;
  dynamic _imageCfUrl;
  dynamic _imageUrl;
  dynamic _description;
  dynamic _metaTitle;
  dynamic _metaDescription;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  num? _categoryId;
DefaultValues copyWith({  num? id,
  dynamic parentValueId,
  num? languageId,
  num? attributeId,
  String? title,
  dynamic url,
  dynamic imageCfUrl,
  dynamic imageUrl,
  dynamic description,
  dynamic metaTitle,
  dynamic metaDescription,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  num? categoryId,
}) => DefaultValues(  id: id ?? _id,
  parentValueId: parentValueId ?? _parentValueId,
  languageId: languageId ?? _languageId,
  attributeId: attributeId ?? _attributeId,
  title: title ?? _title,
  url: url ?? _url,
  imageCfUrl: imageCfUrl ?? _imageCfUrl,
  imageUrl: imageUrl ?? _imageUrl,
  description: description ?? _description,
  metaTitle: metaTitle ?? _metaTitle,
  metaDescription: metaDescription ?? _metaDescription,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  categoryId: categoryId ?? _categoryId,
);
  num? get id => _id;
  dynamic get parentValueId => _parentValueId;
  num? get languageId => _languageId;
  num? get attributeId => _attributeId;
  String? get title => _title;
  dynamic get url => _url;
  dynamic get imageCfUrl => _imageCfUrl;
  dynamic get imageUrl => _imageUrl;
  dynamic get description => _description;
  dynamic get metaTitle => _metaTitle;
  dynamic get metaDescription => _metaDescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_value_id'] = _parentValueId;
    map['language_id'] = _languageId;
    map['attribute_id'] = _attributeId;
    map['title'] = _title;
    map['url'] = _url;
    map['image_cf_url'] = _imageCfUrl;
    map['image_url'] = _imageUrl;
    map['description'] = _description;
    map['meta_title'] = _metaTitle;
    map['meta_description'] = _metaDescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['category_id'] = _categoryId;
    return map;
  }

}





Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());
class Pivot {
  Pivot({
      num? categoryId, 
      num? attributeId,}){
    _categoryId = categoryId;
    _attributeId = attributeId;
}

  Pivot.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _attributeId = json['attribute_id'];
  }
  num? _categoryId;
  num? _attributeId;
Pivot copyWith({  num? categoryId,
  num? attributeId,
}) => Pivot(  categoryId: categoryId ?? _categoryId,
  attributeId: attributeId ?? _attributeId,
);
  num? get categoryId => _categoryId;
  num? get attributeId => _attributeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['attribute_id'] = _attributeId;
    return map;
  }

}







