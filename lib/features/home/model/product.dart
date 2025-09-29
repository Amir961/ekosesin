import '../../../core/res/constant.dart';
import 'city.dart'; // جایی که globalLanguageId تعریف شده

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? url;
  final num? price;
  final String? convertedPrice;
  final String? status;
  final String? stockStatus;
  final int? userId;
  final int? categoryId;
  final int? cityId;
  final int? currencyId;
  final int? languageId;
  final String? languageContraction;
  final String? createdAt;

  final List<ProductImage>? images;
  final Currency? currency;
  final City? city;
  final Category? category;
  final List<Product>? translates;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.price,
    required this.convertedPrice,
    required this.status,
    required this.stockStatus,
    required this.userId,
    required this.categoryId,
    required this.cityId,
    required this.currencyId,
    required this.languageId,
    required this.languageContraction,
    required this.createdAt,
    required this.images,
    required this.currency,
    required this.city,
    required this.category,
    required this.translates,
  });

  /// عنوان ترجمه‌شده محصول
  String translateTitle() {
    for (var p in translates??[]) {
      if (p.languageContraction == globalLanguageId) {
        return p.title;
      }
    }
    return title??'';
  }

  /// عنوان ترجمه‌شده شهر
  String translateCityTitle() {
    return city?.translateTitle()??'';
  }

  /// عنوان ترجمه‌شده دسته‌بندی
  String translateCategoryTitle() {
    return category?.translateTitle()??'';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      price: (json['price']??0 as num),
      convertedPrice: json['converted_price'] ?? '',
      status: json['status'] ?? '',
      stockStatus: json['stock_status'] ?? '',
      userId: json['user_id'],

      categoryId: json['category_id'],
      cityId: json['city_id'],
      currencyId: json['currency_id'],
      languageId: json['language_id'],
      languageContraction: json['language_contraction'] ?? '',
      createdAt: json['created_at'] ?? '',
      images: (json['images'] as List<dynamic>?)
          ?.map((i) => ProductImage.fromJson(i))
          .toList() ??
          [],
      currency: json['currency']==null?null: Currency.fromJson(json['currency']),
      city: json['city']==null?null: City.fromJson(json['city']),
      category: json['category']==null?null: Category.fromJson(json['category']),
      translates: (json['translates'] as List<dynamic>?)
          ?.map((t) => Product.fromJson(t))
          .toList() ??
          [],
    );
  }
}

class ProductImage {
  final int? id;
  final int? posterId;
  final String? filename;
  final String? alt;
  final String? title;
  final Map<String, String>? extra;
  final String? cfUrl;

  ProductImage({
    required this.id,
    required this.posterId,
    this.filename,
    this.alt,
    this.title,
    this.extra,
    required this.cfUrl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      posterId: json['poster_id'],
      filename: json['filename'],
      alt: json['alt'],
      title: json['title'],
      extra:   json['extra'] != null
    ? Map<String, String>.from(json['extra'] as Map)
        : null,
      cfUrl: json['cf_url'],
    );
  }
}

class Currency {
  final int? id;
  final String? title;
  final String? icon;
  final String? contraction;
  final String? sign;

  Currency({
    required this.id,
    required this.title,
    this.icon,
    required this.contraction,
    required this.sign,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      contraction: json['contraction'],
      sign: json['sign'],
    );
  }
}

class Category {
  final int? id;
  final String? title;
  final String? url;
  final int? parentId;
  final int? languageId;
  final String? languageContraction;
  final List<Category>? translates;

  Category({
    required this.id,
    required this.title,
    required this.url,
    required this.parentId,
    required this.languageId,
    required this.languageContraction,
    required this.translates,
  });

  /// عنوان ترجمه‌شده دسته‌بندی
  String translateTitle() {
    for (var c in translates??[]) {
      if (c.languageContraction == globalLanguageId) {
        return c.title;
      }
    }
    return title??'';
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      parentId: json['parent_id'],
      languageId: json['language_id'],
      languageContraction: json['language_contraction'] ?? '',
      translates: (json['translates'] as List<dynamic>?)
          ?.map((t) => Category.fromJson(t))
          .toList() ??
          [],
    );
  }
}
