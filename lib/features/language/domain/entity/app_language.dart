import 'package:equatable/equatable.dart';

class AppLanguage extends Equatable {
  final String language;
  final String nameNative;
  final String nameEnglish;
  final String iconSvg;

  const AppLanguage({
    required this.language,
    required this.nameNative,
    required this.nameEnglish,
    required this.iconSvg,
  });

  @override
  List<Object?> get props => [iconSvg,language, nameNative, nameEnglish];


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppLanguage &&
              runtimeType == other.runtimeType &&
              language == other.language;

  @override
  int get hashCode => language.hashCode;
}
