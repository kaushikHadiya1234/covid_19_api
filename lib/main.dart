import 'package:covid_19/Screen/Provider/covid_provider.dart';
import 'package:covid_19/Screen/View/home_screen.dart';
import 'package:covid_19/Screen/View/search_screen.dart';
import 'package:covid_19/Screen/View/splace_screen.dart';
import 'package:covid_19/Screen/View/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => CovidProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => SplaceScreen(),
            'home': (context) => HomeScreen(),
            'view': (context) => ViewScreen(),
            'search': (context) => SearchScreen(),
          },
        ),
      ),
    ),
  );
}
