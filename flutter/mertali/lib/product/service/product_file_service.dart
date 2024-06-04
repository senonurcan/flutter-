import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final class ProductFileService {
  const ProductFileService._();

  static const ProductFileService instance = ProductFileService._();

  ImagePicker get _imagePicker => ImagePicker();

  Future<Directory> _getFile() async =>
      await getApplicationDocumentsDirectory();

  Future<File?> pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return File(file.path);
    }
    return null;
  }

  Future<File?> addFile(File? file) async {
    if (file != null) {
      final dir = await _getFile();
      final filePath =
          await file.copy('${dir.path}/${file.path.split('/').last}');
      return filePath;
    }
    return null;
  }
}
