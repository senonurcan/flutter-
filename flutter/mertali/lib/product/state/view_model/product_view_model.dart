import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/init/product_localization.dart';
import 'package:mertaliveonurcan/product/state/base/base_cubit.dart';
import 'package:mertaliveonurcan/product/state/view_model/product_state.dart';

///ProductViewModel
final class ProductViewModel extends BaseCubit<ProductState> {
  ///initialState
  ProductViewModel() : super(const ProductState());

  ///setThemeMode
  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  ///setLocale
  void setLocale(BuildContext context, Locale locale) {
    emit(state.copyWith(locale: locale));
    ProductLocalization.updateLangEx(context);
  }
}
