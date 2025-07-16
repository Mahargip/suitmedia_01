// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:suitmedia_01/presentation/first_page.dart' as _i1;
import 'package:suitmedia_01/presentation/second_page.dart' as _i2;
import 'package:suitmedia_01/presentation/third_page.dart' as _i3;

/// generated route for
/// [_i1.FirstPage]
class FirstRoute extends _i4.PageRouteInfo<void> {
  const FirstRoute({List<_i4.PageRouteInfo>? children})
    : super(FirstRoute.name, initialChildren: children);

  static const String name = 'FirstRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.FirstPage();
    },
  );
}

/// generated route for
/// [_i2.SecondPage]
class SecondRoute extends _i4.PageRouteInfo<void> {
  const SecondRoute({List<_i4.PageRouteInfo>? children})
    : super(SecondRoute.name, initialChildren: children);

  static const String name = 'SecondRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SecondPage();
    },
  );
}

/// generated route for
/// [_i3.ThirdPage]
class ThirdRoute extends _i4.PageRouteInfo<void> {
  const ThirdRoute({List<_i4.PageRouteInfo>? children})
    : super(ThirdRoute.name, initialChildren: children);

  static const String name = 'ThirdRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ThirdPage();
    },
  );
}
