import 'package:accout_manager/Splash_screen.dart';
import 'package:accout_manager/colors.dart';
import 'package:accout_manager/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Pallete.backgroundColor),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/burak.jpg'),
                ),
                accountName: Text('Burak Ozcivit'),
                accountEmail: Text('burakofficial@gmail.com')),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Pallete.gradient2,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.home_filled,
                color: Pallete.gradient2,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Pallete.gradient2,
              ),
              title: const Text('Exit'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // ignore: avoid_unnecessary_containers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 700),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(colors: [
                      Pallete.gradient1,
                      Pallete.gradient2,
                      Pallete.gradient3
                    ])),
                child: const Center(
                    child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
