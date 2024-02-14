import 'package:flutter/material.dart';

import '../utils/theme.dart';
import '../widgets/auth_title.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bodySmall = Theme.of(context).primaryTextTheme.bodySmall;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.gradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AuthTitle(label: "Sign in with email"),
            height16,
            EmailInput(hint: "Enter email address", controller: emailController),
            height12,
            PasswordInput(hint: "Enter password", controller: passwordController),
            height24,
            SizedBox(
              width: 280.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99.0),
                  ),
                ),
                child: Text("Sign In", style: TextStyle(color: AppColors.white)),
              ),
            ),
            height32,
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/signin', (route) => false);
                },
                child: Text("Sign in with social network", style: bodySmall!.copyWith(color: Colors.white, decoration: TextDecoration.underline))),
          ],
        ),
      ),
    );
  }
}
