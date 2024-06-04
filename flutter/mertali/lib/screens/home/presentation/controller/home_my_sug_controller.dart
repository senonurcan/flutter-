import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_constants.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';
import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/product/state/base/base_cubit.dart';

final class HomeMySugController extends BaseCubit<List<Oneri>> {
  HomeMySugController() : super(<Oneri>[]);
  List<Oneri> get oneriler => state;

  Future<void> getMySuggestions() async {
    final Map<String, String> all = await ProductStorageManager.getAll();
    all.forEach((key, value) {
      if (key.contains(ProductCacheConstants.mySuggestions.value)) {
        oneriler.add(Oneri(
          id: UniqueKey().hashCode,
          oneri: value,
          title: '',
        ));
      }
    });
    emit(oneriler);
  }

  Future<void> addSuggestion(Oneri oneri) async {
    oneriler.add(oneri);
    await ProductStorageManager.write(
      key: '${ProductCacheConstants.mySuggestions.value}${oneri.id}',
      value: oneri.oneri!,
    );

    emit(oneriler);
  }

  Future<void> removeSuggestion(Oneri oneri) async {
    emit(state..remove(oneri));
    await ProductStorageManager.delete(
      key: '${ProductCacheConstants.mySuggestions.value}${oneri.id}',
    );
  }

  Future<void> clear() async {
    emit(<Oneri>[]);
    // await ProductStorageManager.deleteAll();
  }
}
