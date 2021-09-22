import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hurry/app/modules/auth/pages/register/register_store.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:themes/buttons/primary_button.dart';
import 'package:themes/inputs/input.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  RegisterStore registerStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: LayoutBuilder(builder: (_, contrains) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Observer(
                          builder: (context) => CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: NetworkImage(registerStore.urlImg),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  registerStore.capturePhoto();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.camera,
                                  color: AppColors.primaryColor,
                                  size: 40,
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      foco: registerStore.nomeFocus,
                      funcao: () {},
                      width: contrains.maxWidth * 0.95,
                      typekey: TextInputType.text,
                      label: 'Nome',
                      title: 'Nome',
                      controller: registerStore.nomeController,
                      obscure: false,
                      hint: 'Nome',
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Input(
                      foco: registerStore.emailFocus,
                      funcao: () {},
                      width: contrains.maxWidth * 0.95,
                      typekey: TextInputType.text,
                      label: 'Email',
                      title: 'Email',
                      controller: registerStore.emailController,
                      obscure: false,
                      hint: 'Email',
                      icon: FontAwesomeIcons.envelope,
                      corIcon: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Input(
                      foco: registerStore.celularFocus,
                      funcao: () {},
                      width: contrains.maxWidth * 0.95,
                      typekey: TextInputType.number,
                      label: 'Celular',
                      title: 'Celular',
                      controller: registerStore.celularController,
                      obscure: false,
                      hint: 'Celular',
                      icon: FontAwesomeIcons.phone,
                      corIcon: AppColors.primaryColor,
                      mask: [
                        MaskTextInputFormatter(
                            mask: '(##) #-####-####',
                            filter: {"#": RegExp(r'[0-9]')})
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Input(
                      foco: registerStore.dataNascimentoFocus,
                      funcao: () {
                        registerStore.selectDate(context);
                      },
                      width: contrains.maxWidth * 0.95,
                      typekey: TextInputType.number,
                      label: 'Data Nascimento',
                      title: 'Data Nascimento',
                      controller: registerStore.dataNacimentoController,
                      obscure: false,
                      hint: 'Data Nascimento',
                      icon: FontAwesomeIcons.calendarPlus,
                      corIcon: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(
                      builder: (context) => Input(
                        foco: registerStore.senhaFocus,
                        funcao: () {
                          registerStore.obscureSenha();
                        },
                        width: contrains.maxWidth * 0.95,
                        typekey: TextInputType.text,
                        label: 'Senha',
                        title: 'Senha',
                        controller: registerStore.senhaController,
                        obscure: registerStore.verSenha,
                        hint: 'Senha',
                        icon: registerStore.verSenha
                            ? FontAwesomeIcons.unlock
                            : FontAwesomeIcons.lock,
                        corIcon: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(
                      builder: (context) => Input(
                        foco: registerStore.repetirSenhaFocus,
                        funcao: registerStore.obscureRepetirSenha,
                        width: contrains.maxWidth * 0.95,
                        typekey: TextInputType.text,
                        label: 'Repetir Senha',
                        title: 'Repetir Senha',
                        controller: registerStore.repetirSenhaController,
                        obscure: registerStore.verRepetirSenha,
                        hint: 'Repetir Senha',
                        icon: registerStore.verRepetirSenha
                            ? FontAwesomeIcons.unlock
                            : FontAwesomeIcons.lock,
                        corIcon: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(
                      builder: (context) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                              activeColor: AppColors.primaryColor,
                              value: registerStore.politicaPrivacidade,
                              onChanged: (value) {
                                registerStore.aceitarTermosPrivacidade();
                              }),
                          Text('Política de privacidade',
                              style: GoogleFonts.montserrat(
                                color: registerStore.politicaPrivacidade
                                    ? Colors.white
                                    : Colors.white24,
                                fontSize: 15,
                              ))
                        ],
                      ),
                    ),
                    Observer(
                      builder: (context) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                              activeColor: AppColors.primaryColor,
                              value: registerStore.termosUso,
                              onChanged: (value) {
                                registerStore.aceitarTermoUso();
                              }),
                          Text('Termo de Uso',
                              style: GoogleFonts.montserrat(
                                color: registerStore.termosUso
                                    ? Colors.white
                                    : Colors.white24,
                                fontSize: 15,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        registerStore.validaCampo(context);
                      },
                      text: 'CADASTRAR',
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
