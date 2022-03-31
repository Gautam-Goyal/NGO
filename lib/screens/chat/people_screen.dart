import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/chat_user_list_layout/contact_view.dart';
import '../../widgets/chat_user_list_layout/quiet_box.dart';

class AllUsersChatList extends StatefulWidget {
  const AllUsersChatList({Key? key}) : super(key: key);

  @override
  _AllUsersChatListState createState() => _AllUsersChatListState();
}

class _AllUsersChatListState extends State<AllUsersChatList> with AutomaticKeepAliveClientMixin{
  // User currentUser = FirebaseAuth.instance.currentUser!;

  // Stream<QuerySnapshot> fetchContacts({String userId}) => _userCollection
  //     .document(userId)
  //     .collection(CONTACTS_COLLECTION)
  //     .snapshots();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<String>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('chatContacts').snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          const Center(
            child: Text(
                "There was some error in fetching the contacts list! Please try again"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          var docList = snapshot.data!.docs;
          if (docList.isEmpty) {
            return const Scaffold(body: QuietBox());
          }

          return Scaffold(
            body: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: docList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> chatUserListData = docList[index].data() as Map<String,dynamic>;
                print("%%%%--->>>>   ${chatUserListData}");
                return ContactView(chatUserListData,uid);
              },
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      }
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
