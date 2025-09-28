import '../../../core/res/constant.dart';

class City {
  final int? id;
  final int? countryId;
  final int? stateId;
  final String title;
  final int? userId;
  final int? belongsToId;
  final int? languageId;
  final String? url;
  final String? imageUrl;
  final String languageContraction;
  final List<City>? translates;

  City({
    required this.id,
    required this.countryId,
    this.stateId,
    required this.title,
    required this.userId,
    required this.belongsToId,
    required this.languageId,
    required this.url,
    required this.imageUrl,
    required this.languageContraction,
    this.translates = const [],
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      countryId: json['country_id'] ?? 0,
      stateId: json['state_id'],
      title: json['title'] ?? '',
      userId: json['user_id'] ?? 0,
      belongsToId: json['belongs_to_id'] ?? 0,
      languageId: json['language_id'] ?? 0,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      languageContraction: json['language_contraction'] ?? '',
      translates: (json['translates'] as List? ?? [])
          .map((t) => City.fromJson(t))
          .toList(),
    );
  }

  String translateTitle() {
    for (City city in translates??[]) {
      if (city.languageContraction == globalLanguageId) {
        return city.title;
      }
    }
    return title;
  }

  int translateID(String globalLanguageId) {
    for (City city in translates??[]) {
      if (city.languageContraction == globalLanguageId) {
        return city.belongsToId??0;
      }
    }
    return id??0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is City &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
