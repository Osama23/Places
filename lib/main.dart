import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';
import './screens/places_list_screen.dart';
import './providers/great_places.dart';
import './helpers/custom_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            }),
          ),
          debugShowCheckedModeBanner: false,
          home: PlacesList(),
          routes: {
            AddplaceScreen.routeName: (ctx) => AddplaceScreen(),
          }
      ),
    );
  }
}
