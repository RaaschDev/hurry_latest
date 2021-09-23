import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: LayoutBuilder(
        builder: (_, contrains) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 220,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/img/hurry_logo.png'), fit: BoxFit.fitWidth),
                      ),
                    ),
                    Input(
                      funcao: () {},
                      width: contrains.maxWidth * 0.9,
                      typekey: TextInputType.text,
                      label: 'Email',
                      title: 'Email',
                      controller: emailController,
                      obscure: false,
                      hint: 'Email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      funcao: () {},
                      width: contrains.maxWidth * 0.9,
                      typekey: TextInputType.text,
                      label: 'Password',
                      title: 'Password',
                      controller: passwordController,
                      obscure: true,
                      hint: 'Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        store.login(passwordController.text, emailController.text);
                      },
                      text: 'ENTRAR',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ButtomText(
                        onPressed: () {
                          Modular.to.pushNamed('/auth/register');
                        },
                        text: 'Cadastrar'),
                    ButtomText(onPressed: () {}, text: 'Esqueceu sua Senha'),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        store.loginGoogle();
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'sign in Google',
                              style: AppTextStyle.accentTitleStyle,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              FontAwesomeIcons.google,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        store.logout();
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'sign in Facebook',
                              style: AppTextStyle.accentTitleStyle,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              FontAwesomeIcons.facebook,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
