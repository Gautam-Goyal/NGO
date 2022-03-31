import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/chat/chat_screen.dart';
import 'custom_tile.dart';
import 'last_send_message.dart';

class ContactView extends StatelessWidget {
  final Map<String, dynamic> contact;
  final String currentUserUid;
  // final String contactId;
  ContactView(this.contact, this.currentUserUid);

  @override
  Widget build(BuildContext context) {
    print("****--->>>>  ${contact['uid']}");
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('NGO')
          .doc(contact['uid'])
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          const Center(
            child: Text(
                "There was some error in fetching details for this contact. Please try again"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData && snapshot.data!.exists) {
          Map<String, dynamic> ngoData =
              snapshot.data!.data() as Map<String, dynamic>; //TODO: To check here-- only ngo name is being fetched in futurebuilder
          print("^^^^--->>  $ngoData");
          return ViewLayout(
            ngoData: ngoData,
            currentUserUid: currentUserUid,
            contact:contact
          );
        }
        return const Center(
          child: Text("Looks like there is not data present for this NGO."),
        );
      },
    );
  }
}

class ViewLayout extends StatelessWidget {
  final Map<String, dynamic> ngoData;
  final String currentUserUid;
  final Map<String, dynamic> contact;
  ViewLayout({
    required this.ngoData,
    required this.currentUserUid,
    required this.contact
  });

  @override
  Widget build(BuildContext context) {
    print("####--->>>  ${contact['uid']}");
    return CustomTile(
      mini: false,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              ngoName: ngoData['name'],
              currentUserUid: currentUserUid,
              ngoUid: contact['uid'], //TODO: Can use ngoData here after storing ngo uid in it's database
            ),
          )),
      title: Text(
        (ngoData != null ? ngoData['name'] : null) != null
            ? ngoData['name']
            : "..",
        style: const TextStyle(
            color: Colors.red, fontFamily: "Arial", fontSize: 19),
      ),
      subtitle: LastMessageContainer(
        future: FirebaseFirestore.instance
            .collection('usersChats')
            .where('users',
                isEqualTo: {"donor": currentUserUid, "ngo": contact['uid']}).limit(1).snapshots(),
      ),
      leading: Container(
        constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Stack(
          children: const <Widget>[
            CircleAvatar(
                // child: Image.asset(),
                )
            // CachedImage(
            //   contact.profilePhoto,
            //   radius: 80,
            //   isRound: true,
            // ),
            // OnlineDotIndicator(
            //   uid: contact.uid,
            // ),
          ],
        ),
      ),
    );
  }
}
