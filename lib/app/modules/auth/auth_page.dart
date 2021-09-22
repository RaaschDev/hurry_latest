import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: AppTextStyle.primaryTitleStyle,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  controller: emailController,
                  obscure: false,
                  hint: 'Email',
                ),
                Input(
                  controller: passwordController,
                  obscure: true,
                  hint: 'Password',
                ),
                PrimaryButton(
                  onPressed: () {
                    store.login(passwordController.text, emailController.text);
                  },
                  text: 'ENTRAR',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
