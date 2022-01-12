import 'package:hetu_script/binding.dart';
import 'package:hetu_script/types.dart';
import 'package:hetu_script/values.dart';

typedef HetuFunctionCall<T> = T Function(
  HTEntity entity, {
  List<dynamic> positionalArgs,
  Map<String, dynamic> namedArgs,
  List<HTType> typeArgs,
});

HTExternalFunction createHTExternalFunction<T>(
  final HTExternalFunction function,
) =>
    function;

class HetuHelperFunction {
  const HetuHelperFunction({
    required final this.name,
    required final this.definition,
    required final this.declaration,
  });

  final String name;
  final Function definition;
  final String declaration;
}

class HetuHelperClass {
  const HetuHelperClass({
    required final this.definition,
    required final this.declaration,
  });

  final HTExternalClass definition;
  final String declaration;
}
