import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/core/data/raw/languages.dart';

class LanguagesData {
  static List<Language> data = _dataFromMap();

  static List<Language> _dataFromMap() =>
      languagesRawData.map(Language.fromJson).toList();
}
