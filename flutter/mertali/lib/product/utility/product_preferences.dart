import 'package:mertaliveonurcan/product/cache/product_cache_constants.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';

final class ProductPreferences {
  const ProductPreferences._();

  ///instance
  static const ProductPreferences instance = ProductPreferences._();

  ///isFirstOpened
  Future<bool> get isFirstOpened async {
    final String? isFirstOpened = await ProductStorageManager.read(
        key: ProductCacheConstants.firstOpen.value);
    if (isFirstOpened == null) {
      await ProductStorageManager.write(
          key: ProductCacheConstants.firstOpen.value, value: 'false');
      return true;
    }
    return false;
  }
}
