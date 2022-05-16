part of 'app_control_cubit.dart';

class AppControlState extends Equatable {
  final Locale locale;
  final ThemeMode theme;

  const AppControlState({
    required this.locale,
    required this.theme,
  });

  AppControlState copyWith({
    Locale? locale,
    ThemeMode? theme,
  }) {
    return AppControlState(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [locale, theme];
}
