import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth101/screens/price_list.dart';
import 'package:firebase_auth101/screens/pickup_req.dart';
import 'package:firebase_auth101/screens/history.dart';
import 'package:lottie/lottie.dart';
int buttonSelected = 1;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String? userName = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      'Side menu',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/cover.jpg'))),
                  ),
                  ListTile(
                    leading: Icon(Icons.input),
                    title: Text('Welcome'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user),
                    title: Text('Profile'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color),
                    title: Text('Feedback'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.menu),
        ),
        title: Text('HOME',style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          Text("Hello $userName", style: TextStyle(fontSize: 15),),
          Center(
            child:  Lottie.network('https://assets8.lottiefiles.com/packages/lf20_tja8xM0Y9R.json'),
          ),

          Center(
            child: Container(
              height: 30,
              width: 30,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
              child: const Text("Sign Out",style: TextStyle(fontSize: 18),))

        ],
      ),

      bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.home, size: 32.0,color: buttonSelected==1 ? Colors.blueGrey : Colors.black,),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const WelcomeScreen()));
                      setState(() {
                        buttonSelected =1;
                      });
                  },),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.currency_rupee, size: 32.0,color: buttonSelected==2 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PriceList()));
                  setState(() {
                    buttonSelected =2;
                  });
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.delivery_dining, size: 32.0,color: buttonSelected==3 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PickupReq()));
                  setState(() {
                    buttonSelected =3;
                  });
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.history, size: 32.0,color: buttonSelected==4 ? Colors.blueGrey : Colors.black),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HistoryPage()));
                  setState(() {
                    buttonSelected =4;
                  });
                },),
            ),

          ],
          ),
            //child: Icon(Icons.home),
      ),


    );
  }
}
