import 'package:flutter/material.dart';
import 'package:time_keeper/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_keeper/screens/new_day_screen.dart';
import 'package:time_keeper/screens/punch_card_screen.dart';
import 'package:time_keeper/screens/welcome_screen.dart';
import 'package:time_keeper/screens/login_screen.dart';
import 'package:time_keeper/screens/registration_screen.dart';
import 'package:time_keeper/screens/work_days_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TimeKeeper());
}

class TimeKeeper extends StatelessWidget {
  const TimeKeeper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //     textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black54))),
      // home: WelcomeScreen(),

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        PunchCardScreen.id: (context) => const PunchCardScreen(),
        WorkDaysScreen.id: (context) => const WorkDaysScreen(),
        NewDayScreen.id: (context) => const NewDayScreen(),
        // ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}

