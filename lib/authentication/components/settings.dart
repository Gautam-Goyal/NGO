import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7EBE1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          "UserProfile",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Poppins"),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _size.width,
            height: _size.height,
            color: const Color(0xffF7EBE1),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 80,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blueAccent),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_outlined,
                                color: Colors.white),
                            iconSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Sushant Dhiman",
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "@" + "SushantDhiman",
                      style: TextStyle(fontSize: 15, fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: _size.height / 3.5,
            child: Container(
              width: _size.width,
              height: _size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    const MenuListTile(
                        text: "Accepted Requests",
                        icon: Icon(
                          Icons.request_page_outlined,
                          color: Colors.black,
                        )),
                    Divider(color: Colors.grey[500]),
                    const MenuListTile(
                        text: "User Managment",
                        icon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        )),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    const MenuListTile(
                        text: "About Us",
                        icon: Icon(
                          Icons.help_outline,
                          color: Colors.black,
                        )),
                    Divider(color: Colors.grey[500]),
                    const MenuListTile(
                        text: "Log Out",
                        icon: Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                        )),
                    Divider(color: Colors.grey[500]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(fontFamily: "Poppins", fontSize: 16),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ));
  }
}
