import 'package:accout_manager/Signup_screen.dart';
import 'package:accout_manager/colors.dart';
// ignore: unused_import
import 'package:accout_manager/home_screen.dart';
import 'package:accout_manager/sec_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text(
          'Login Screen',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Pallete.gradient3,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Center(child: Image.asset('images/balls.png')),
          const SizedBox(
            height: 20,
          ),
          const Text('Provide your details to login your account',
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
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.alternate_email,
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
                  Icons.password_outlined,
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
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('password', passwordController.text.toString());
                sp.setBool('islogin', true);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoadingScreen()),
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
                    'Login',
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
                'Does not have an account?',
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
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Sign up',
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
