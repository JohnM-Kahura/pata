import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pata/auth/login.dart';
import 'package:pata/utils/main_page.dart';
import 'package:pata/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'pages/get_started.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs=await SharedPreferences.getInstance();
  final showGetStarted=prefs.getBool('showGetStarted') ?? true;
  
  runApp( MyApp(showGetStarted:showGetStarted));
}

class MyApp extends StatelessWidget {
  final bool showGetStarted;
  const MyApp({super.key, required this.showGetStarted});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Utils utils=Utils();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey:utils.messengerKey,
      title: 'pata',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      // the main page is just a wrapper so I can decide if there is a user on the device or not
      home:showGetStarted==true? const GetStarted():const Login(),
    );
  }
}

