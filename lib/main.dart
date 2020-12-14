import 'package:flutter/material.dart';

import 'package:hybrid_product_db/utility/globals.dart' as globals;
import 'package:hybrid_product_db/views/home_view.dart';
import 'package:hybrid_product_db/utility/QRscanner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Hybrid Product Database',
    debugShowCheckedModeBanner: false,
    home: HomeView(),
    theme: ThemeData(
      primarySwatch: globals.kThemeColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: <String, WidgetBuilder>{
      "/qr_scan": (BuildContext context) => QRScanner()
    },
  ));
}