import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:time_keeper/constants.dart';

class NewDayScreen extends StatefulWidget {
  static const String id = 'new_day_screen';
  const NewDayScreen({super.key});

  @override
  State<NewDayScreen> createState() => _NewDayScreenState();
}

class _NewDayScreenState extends State<NewDayScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  final _newDayFormKey = GlobalKey<FormState>();
  //form fields
  late String workerId;
  late String locationId;

  late String startTime;
  late String startDate;

  late String endTime;
  late String endDate;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _newDayFormKey,
          child: Column(
            children: [
              Text(
                'App new day Body'
              ),

              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'worker id'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please eneter worker id';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  workerId = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.start,
        ),
      ),
    );
  }
}
