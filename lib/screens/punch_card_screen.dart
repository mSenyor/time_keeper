import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:time_keeper/constants.dart';
import 'package:analog_clock/analog_clock.dart';

class PunchCardScreen extends StatefulWidget {
  static const String id = 'punch_card_screen';
  const PunchCardScreen({super.key});

  @override
  State<PunchCardScreen> createState() => _PunchCardScreenState();
}

class _PunchCardScreenState extends State<PunchCardScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('App Title'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: AnalogClock(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.white,),
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          width: 250.0,
          isLive: true,
          hourHandColor: Colors.white,
          minuteHandColor: Colors.pink,
          showSecondHand: true,
          secondHandColor: Colors.deepPurpleAccent,
          numberColor: Colors.purple,
          showNumbers: true,
          showAllNumbers: true,
          textScaleFactor: 1.4,
          showTicks: false,
          showDigitalClock: true,
          digitalClockColor: Colors.white,
          useMilitaryTime: true,
          // datetime: DateTime(2019),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon( Icons.start,),
      ),
    );
  }
}
