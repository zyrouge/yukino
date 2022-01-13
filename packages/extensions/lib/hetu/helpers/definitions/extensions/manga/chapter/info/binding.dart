import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:utilx/utilities/locale.dart';
import '../../../../../../../models/manga/chapter/info.dart';
import '../../../../../model.dart';

class ChapterInfoClassBinding extends HTExternalClass {
  ChapterInfoClassBinding() : super('ChapterInfo');

  @override
  dynamic memberGet(
    final String varName, {
    final String? from,
  }) {
    switch (varName) {
      case 'ChapterInfo':
        return createHTExternalFunction(
          (
            final HTEntity entity, {
            final List<dynamic> positionalArgs = const <dynamic>[],
            final Map<String, dynamic> namedArgs = const <String, dynamic>{},
            final List<HTType> typeArgs = const <HTType>[],
          }) =>
              ChapterInfo(
            chapter: namedArgs['chapter'] as String,
            url: namedArgs['url'] as String,
            locale: Locale.parse(namedArgs['locale'] as String),
            title: namedArgs['title'] as String?,
            volume: namedArgs['volume'] as String?,
          ),
        );

      default:
        throw HTError.undefined(varName);
    }
  }
}