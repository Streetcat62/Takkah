import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'presentation/app_widget.dart';
import 'presentation/styles/style.dart';
import 'infrastructure/services/services.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

const fetchBackground = 'fetchBackground';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(
    (task, inputData) async {
      switch (task) {
        case fetchBackground:
          Position userLocation = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          final Dio client = Dio(
            BaseOptions(
              headers: {
                'Accept':
                    'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
                'Content-type': 'application/json',
                'Authorization': 'Bearer ${LocalStorage.instance.getToken()}'
              },
            ),
          );
          await client.post(
            'https://api.sundaymart.net/api/v1/dashboard/deliveryman/settings/location',
            data: {
              'location':
                  "{'latitude': '${userLocation.latitude}', 'longitude': '${userLocation.longitude}'}"
            },
          );
          break;
      }
      return Future.value(true);
    },
  );
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await Workmanager().initialize(callbackDispatcher);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Style.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: AppWidget()));
}
