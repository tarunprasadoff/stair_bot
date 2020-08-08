import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stair_bot/navigation/tab_manager.dart';
import 'package:stair_bot/providers/profile.dart';
import 'package:stair_bot/screens/login_screen.dart';
import 'package:stair_bot/screens/otp_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ChangeNotifierProvider(
      create: (_) => Profile(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.black,
              iconTheme: IconThemeData(size: 24),
              textTheme: TextTheme(
                bodyText1:
                    TextStyle(color: Colors.blue, fontSize: 21, height: 1.4),
                bodyText2: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                caption: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              )),
          home: LoginScreen(),
          routes: {
            OtpScreen.routeName: (_) => OtpScreen(),
            TabManager.routeName: (_) => TabManager(),
          },
          // ignore: missing_return
          onGenerateRoute: (routeSettings) {
            //
          }),
    );
  }
}
