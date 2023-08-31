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
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'location id'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please eneter location id';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  locationId = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'start time'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please eneter start time';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  startTime = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'start date'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please enter start date';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  startDate = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'end time'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please eneter end time';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  endTime = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextFormFieldTextColor,
                ),
                decoration: kTextFieldInputDecoration.copyWith(hintText: 'end date'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please enter end date';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  endDate = value;
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
        onPressed: () async{
          if(_newDayFormKey.currentState!.validate()){
            setState(() {
              showSpinner = true;
            });
            try{
              //TODO: store the day
            }catch(e){
              print(e.hashCode);
            }
          }

        },
        child: Icon(
          Icons.save,
        ),
      ),
    );
  }
}
