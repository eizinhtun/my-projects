import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmail_login/View_Model/home_view_model.dart';
import 'package:gmail_login/View_Model/sign_in_view_model.dart';
import 'package:gmail_login/utils/locator.dart';
import 'package:gmail_login/utils/prefer.dart';
import 'package:gmail_login/utils/routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  setLocator();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        // builder: (context,_) => HomeViewModel(),
      )
      // ChangeNotifierProvider<HomeViewModel>(
      //   builder: (_) => HomeViewModel(),
      // ),
    ],
  ));
}

class MyApp extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Locale locale = Locale('', '');
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    print('initState()');

    //MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey[400],
//        statusBarColor: Styles.blueColor,
        statusBarIconBrightness:
            Brightness.light //or set color with: Color(0xFF0000FF)
        ));
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: Center(
        child: MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          theme: ThemeData(
            primaryColor: Colors.black,
            fontFamily: 'FA',
          ),
        ),
      ),
    );
    // return
    // ChangeNotifierProvider<SignInViewModel>(
    //   builder: (_) => SignInViewModel(),
    //   child: Center(
    //     child: MaterialApp(
    //       initialRoute: '/',
    //       debugShowCheckedModeBanner: false,
    //       onGenerateRoute: Routes.onGenerateRoute,
    //       theme: ThemeData(
    //         primaryColor: Colors.black,
    //         fontFamily: 'FA',
    //       ),
    //     ),
    //   ),
    // );
  }
}
