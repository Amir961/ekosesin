

import '../../../../core/res/media_res.dart';
import '../../domain/entity/app_language.dart';

class AppLanguageModel extends AppLanguage {
  const AppLanguageModel({
    required String language,
    required String nameEnglish,
    required String nameNative,
    required String iconSvg,
  }) : super(
    iconSvg: iconSvg,
          language: language,
          nameEnglish: nameEnglish,
          nameNative: nameNative,
        );

  factory AppLanguageModel.fromTag(
          String tag, String nameEnglish, String nameNative,String iconSvg) =>
      AppLanguageModel(
        language: tag,
        nameEnglish: nameEnglish,
        nameNative: nameNative,
        iconSvg: iconSvg,
      );

  String get tag => language;

  factory AppLanguageModel.defaultLanguage() =>
      // ServerHelper.instance.typeServer == TypeServer.salemsaz
      //     ?
      AppLanguageModel(
              language: 'fa',
              nameEnglish: 'Farsi',
              nameNative: 'فارسی',
               iconSvg:MediaRes.fa
            )
      //     :
      // const AppLanguageModel(
      //         language: 'en',
      //         nameEnglish: 'English',
      //         nameNative: 'English',
      //       )
  ;

  factory AppLanguageModel.fromEntity(AppLanguage entity) => AppLanguageModel(
        language: entity.language,
        nameEnglish: entity.nameEnglish,
        nameNative: entity.nameNative,
        iconSvg: entity.iconSvg,
      );
  factory AppLanguageModel.fromJson(Map<String, dynamic> json) =>
      AppLanguageModel(
        iconSvg: json['icon_svg'],
        language: json['id'],
        nameEnglish: json['name_native'],
        nameNative: json['name_english'],
      );
}
