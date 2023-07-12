import 'package:accout_manager/Splash_screen.dart';
import 'package:accout_manager/colors.dart';
import 'package:accout_manager/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    dataLoading();
  }

  void dataLoading() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? '';
    email = sp.getString('email') ?? '';
    phone = sp.getString('phone') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Screen',
          style: TextStyle(
              color: Pallete.gradient3,
              fontFamily: 'DancingScript',
              fontSize: 30,
              fontWeight: FontWeight.bold),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('images/burak.jpg'),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500),
            child: Row(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  'Name: ',
                  style: const TextStyle(
                    color: Pallete.gradient2,
                    fontFamily: 'Caprasimo',
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                Text(
                  name.toString(),
                  style: const TextStyle(
                    color: Pallete.gradient3,
                    fontFamily: 'DancingScript',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500),
            child: Row(
              children: [
                const Text(
                  'Email: ',
                  style: TextStyle(
                    color: Pallete.gradient2,
                    fontFamily: 'Caprasimo',
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                Text(
                  email.toString(),
                  style: const TextStyle(
                      color: Pallete.gradient3,
                      fontFamily: 'DancingScript',
                      fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500),
            child: Row(
              children: [
                const Text(
                  'Contact No.: ',
                  style: TextStyle(
                    color: Pallete.gradient2,
                    fontFamily: 'Caprasimo',
                  ),
                ),
                const SizedBox(
                  width: 255,
                ),
                Text(
                  phone.toString(),
                  style: const TextStyle(
                    color: Pallete.gradient3,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // ignore: avoid_unnecessary_containers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 700),
            child: InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()));
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Pallete.gradient1,
                        Pallete.gradient2,
                        Pallete.gradient3
                      ])),
                  child: const Center(
                      child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
