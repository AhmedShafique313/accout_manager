// ignore_for_file: file_names

import 'package:accout_manager/colors.dart';
// ignore: unused_import
import 'package:accout_manager/home_screen.dart';
import 'package:accout_manager/login_screen.dart';
import 'package:accout_manager/sec_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign up Screen',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Pallete.gradient3,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(child: Image.asset('images/balls.png')),
          const SizedBox(
            height: 20,
          ),
          const Text('Provide your details to create an account',
              style: TextStyle(
                fontFamily: 'caprasimo',
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Pallete.gradient3,
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Pallete.backgroundColor,
                ),
                hintText: 'Enter your name',
                hintStyle: const TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.gradient2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.backgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.gradient3,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Pallete.backgroundColor,
                ),
                hintText: 'Enter your Email',
                hintStyle: const TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.gradient2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.backgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.gradient2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Pallete.backgroundColor,
                ),
                hintText: 'Enter your Phone No.',
                hintStyle: const TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.gradient2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.backgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.gradient3,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password,
                  color: Pallete.backgroundColor,
                ),
                hintText: 'Enter your Password',
                hintStyle: const TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.gradient2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.backgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Pallete.gradient2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: InkWell(
              onTap: () async {
                // recordig data and saving it in shared preferences
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', nameController.text.toString());
                sp.setString('email', emailController.text.toString());
                sp.setString('phone', phoneController.text.toString());
                sp.setString('password', passwordController.text.toString());
                sp.setBool('islogin', true);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoadingScreen(),
                  ),
                );
              },
              child: Container(
                height: 45,
                width: double.infinity,
                // color: Pallete.gradient2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Pallete.gradient1,
                      Pallete.gradient2,
                      Pallete.gradient3,
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // ignore: prefer_const_constructors
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Pallete.gradient3,
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Pallete.gradient2,
                      fontFamily: 'Caprasimo',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
