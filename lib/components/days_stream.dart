import 'package:time_keeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_keeper/components/single_day_display.dart';

class DaysStream extends StatelessWidget {
  const DaysStream({
    super.key,
    required FirebaseFirestore firestore,
    required this.user,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(kMainChatCollectionName)
          .orderBy('timestamp')
          .snapshots(),
      builder: (context, snapshot) {
        List<SingleDayDisplay> daysEntries = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final messages = snapshot.data?.docs.reversed;
          for (var message in messages!) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final messageNickname = message.get('displayName');

            // DateTime dt = (map['timestamp'] as Timestamp).toDate();
            final timestamp = (message.get('timestamp') as Timestamp).toDate();
            final userEmail = user?.email;
            final dayEntry = SingleDayDisplay(
              sender: messageSender,
              text: messageText,
              displayName: messageNickname,
              isMe: userEmail == messageSender,
              time: timestamp.toString(),
            );
            daysEntries.add(dayEntry);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: daysEntries,
          ),
        );
      },
    );
  }
}
