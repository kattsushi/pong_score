import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pong_score/ui/global/theme/app_themes.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent([List props = const <dynamic>[]]);
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  const ThemeChanged({ @required this.theme });

  @override
  List<Object> get props => [theme];

  @override
  String toString() => 'UpdateTab { tab: $theme }';
}
