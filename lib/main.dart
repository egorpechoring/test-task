import 'package:flutter/material.dart';
import 'package:test_task_north_coast_code/screens/home_screen.dart';
import 'package:test_task_north_coast_code/screens/profile_screen.dart';
import 'common/default_scaffold.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          //headline6: TextStyle(fontStyle: FontStyle.italic),
          bodyText2: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          bodyText1: TextStyle(color: Color.fromARGB(255, 110, 137, 165)),
        ),
      ),
      home: const DefaultScaffold("WELCOME!", HomeScreen()),
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == '/profileScreen') {
          return PageRouteBuilder(
              transitionDuration: const Duration(seconds: 0),
              pageBuilder: (context, a1, a2) => FadeTransition(
                    opacity: a1,
                    child: const DefaultScaffold("MY PROFILE", ProfileScreen()),
                  ));
        }
        return null;
      },
    );
  }
}
