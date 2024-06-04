import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/navigator.dart';
import 'package:permission_handler/permission_handler.dart';

@immutable
final class ProductNotificationPermission {
  const ProductNotificationPermission._();

  static void checkPermission(BuildContext context) {
    Permission.notification.status.then((status) {
      if (status.isGranted) {
        log('Permission is granted');
      } else if (status.isDenied) {
        log('Permission is denied');
        Permission.notification.request();
      } else if (status.isPermanentlyDenied) {
        log('Permission is permanently denied');
        _showSettingsDialog(context);
      }
    });
  }

  static void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('İzinler'),
          content: const Text(
              'Uygulamanın bildirimlere erişim izni yok. Ayarlara gidip izinleri etkinleştirmek ister misiniz?'),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  PNavigator.backPage(context);
                },
                child: const Text('İptal')),
            ElevatedButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text('Ayarlar'),
            ),
          ],
        );
      },
    );
  }
}
