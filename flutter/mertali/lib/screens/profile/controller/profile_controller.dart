import 'dart:developer';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_constants.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';
import 'package:mertaliveonurcan/product/service/product_file_service.dart';
import 'package:mertaliveonurcan/product/state/base/base_cubit.dart';

final class ProfileController extends BaseCubit<File> {
  ProfileController() : super(File(''));

  Future<void> getProfilePicture() async {
    final file = await ProductStorageManager.read(
        key: ProductCacheConstants.profilePhoto.value);
    if (file != null) {
      emit(File(file));
    }
  }

  Future<void> setProfilePicture() async {
    final file = await ProductFileService.instance.pickImage();
    final result = await ProductFileService.instance.addFile(file);

    if (result == null || file == null) {
      Fluttertoast.showToast(msg: 'No image selected');
      return;
    }

    await ProductStorageManager.write(
      key: ProductCacheConstants.profilePhoto.value,
      value: result.path,
    );

    log('Profile picture set');
    emit(file);
  }
}
