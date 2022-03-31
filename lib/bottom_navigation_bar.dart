import 'package:flutter/material.dart';
import 'package:ngo/homepage/home_page.dart';
import 'package:ngo/providers/bottom_navigation_bar.dart';
import 'package:ngo/screens/chat/people_screen.dart';
import 'package:provider/provider.dart';

class ShowBottomNavigationBar extends StatefulWidget {
  const ShowBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _ShowBottomNavigationBarState createState() => _ShowBottomNavigationBarState();
}

class _ShowBottomNavigationBarState extends State<ShowBottomNavigationBar> {

  int currentIndex = 0;
  var currentTab = [
    const HomePage(key: PageStorageKey('map'),),
    const AllUsersChatList(key: PageStorageKey('people'),)
  ];

  PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationProvider>(
        builder: (context,value,child){
          return PageStorage(
            bucket: bucket,
            child: currentTab[value.currentIndex],
          );
        }
      ),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context,value,child){
          return BottomNavigationBar(
            onTap: (index){
                value.currentIndex=index;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Map'),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chat'),
            ],
          );
        },
      )
    );
  }
}
