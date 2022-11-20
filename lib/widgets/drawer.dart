import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/model/user_model.dart';
import 'package:flutter/material.dart';

import '../screens/drawer_screens/ProfilePage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage('asset/bg_ct.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            accountName: Text(
              'Ayan Sharma',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            accountEmail: Text(
              'ayansharma.davv@gmail.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            currentAccountPicture: Image.asset('p_photo.png'),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // Icon(Icons.person),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('Ayan Sharma',textAlign: TextAlign.center,style: TextStyle(
          //     color: Colors.green[900],
          //     fontSize: 18,
          //   ),),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // Icon(Icons.email),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('ayansharma.davv@gmail.com',textAlign: TextAlign.center,style: TextStyle(
          //     color: Colors.green[900],
          //     fontSize: 18,
          //   ),),
          // ),
          // SizedBox(
          //   height: 30,
          // ),

          ListTile(
            leading: const Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward),
            title: const Text('Profile'),
            onTap: () => {Navigator.pushNamed(context, '/profile-page')},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            trailing: Icon(Icons.arrow_forward),
            title: const Text('About Us'),
            onTap: () => {Navigator.pushNamed(context, '/about-us')},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            trailing: Icon(Icons.arrow_forward),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            //trailing: Icon(Icons.arrow_forward),
            title: const Text('Logout'),
            onTap: () async {
              await auth.signOut().then((value) =>
                  Navigator.of(context).popUntil((route) => route.isFirst));
            },
          ),
        ],
      ),
    );
  }
}
