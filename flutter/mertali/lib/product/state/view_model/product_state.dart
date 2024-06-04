import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///ProductState
@immutable
final class ProductState extends Equatable {
  ///ProductState constructor
  const ProductState({
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('tr'),
  });

  ///themeMode
  final ThemeMode themeMode;

  ///locale
  final Locale locale;

  @override
  List<Object> get props => [
        themeMode,
        locale,
      ];

  ///copyWith
  ProductState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
