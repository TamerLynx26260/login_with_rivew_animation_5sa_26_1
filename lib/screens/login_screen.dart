import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _login_screenState();
}

class _login_screenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //Evita que se quite espacio del nudge
      body: SafeArea(
        child: Column(
          children: [
            Expanded ( 
              child: RiveAnimation.asset('animateds/login_screen.riv'),

            )
          ],
        ),
      ),
    ) ;
  }
}