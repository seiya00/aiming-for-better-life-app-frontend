import 'package:better_life_frontend/Screens/Evidence/processed_food.dart';
import 'package:better_life_frontend/Screens/Evidence/processed_food2.dart';
import 'package:better_life_frontend/Screens/Home/home_screen.dart';
import 'package:better_life_frontend/Screens/Question/finish_question.dart';
import 'package:better_life_frontend/Screens/Home/example.dart';
import 'package:better_life_frontend/Screens/Question/sleep_question.dart';
import 'package:better_life_frontend/Screens/SignUp/signup.dart';
import 'package:better_life_frontend/Screens/SignUp/signup_screen_choose.dart';
import 'package:better_life_frontend/global_state.dart';
import 'package:flutter/material.dart';
import 'package:better_life_frontend/Screens/SignUp/signup_screen.dart';
import 'package:better_life_frontend/Screens/SignUp/signup_screen_birthday.dart';
import 'package:better_life_frontend/Screens/SignUp/signup_screen_nightshift.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: IsNightShift(),
      home: ProcessedFoodVersionTwo(),
    );
  }
}
