import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication/signup.dart';
import '../homepage/home_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // print(_auth.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser == null
        ? const LoginPage()
        : Provider<String>.value(
            value: _auth.currentUser!.uid,
            child: const HomePage(),
          );
  }
}
