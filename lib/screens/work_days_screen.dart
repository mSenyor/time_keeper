import 'package:flutter/material.dart';
import 'package:time_keeper/components/days_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class WorkDaysScreen extends StatefulWidget {
  static const String id = 'work_days_screen';
  const WorkDaysScreen({super.key});

  @override
  State<WorkDaysScreen> createState() => _WorkDaysScreenState();
}

class _WorkDaysScreenState extends State<WorkDaysScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
      ),
      body: Column(
        children: [
          DaysStream(firestore: _firestore, user: _auth.currentUser),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.start),
      ),
    );
  }
}
