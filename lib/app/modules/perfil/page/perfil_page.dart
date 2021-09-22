import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hurry/app/modules/auth/pages/register/register_page.dart';
import 'package:hurry/app/modules/auth/pages/register/register_store.dart';
import 'package:hurry/app/modules/perfil/perfil_store.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:themes/buttons/primary_button.dart';
import 'package:themes/inputs/input.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = 'PerfilPage'}) : super(key: key);
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State<PerfilPage> {
  PerfilStore perfilStore = Modular.get();
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: AppTextStyle.primaryTitleStyle,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (_, contrains) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Observer(
                        builder: (context) => CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: NetworkImage(perfilStore.urlImg),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                //registerStore.capturePhoto();
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
                    foco: perfilStore.nomeFocus,
                    funcao: () {},
                    width: contrains.maxWidth * 0.95,
                    typekey: TextInputType.text,
                    label: 'Nome',
                    title: 'Nome',
                    controller: perfilStore.nomeController,
                    obscure: false,
                    hint: 'Nome',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Input(
                    foco: perfilStore.emailFocus,
                    funcao: () {},
                    width: contrains.maxWidth * 0.95,
                    typekey: TextInputType.text,
                    label: 'Email',
                    title: 'Email',
                    controller: perfilStore.emailController,
                    obscure: false,
                    hint: 'Email',
                    icon: FontAwesomeIcons.envelope,
                    corIcon: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Input(
                    foco: perfilStore.celularFocus,
                    funcao: () {},
                    width: contrains.maxWidth * 0.95,
                    typekey: TextInputType.number,
                    label: 'Celular',
                    title: 'Celular',
                    controller: perfilStore.celularController,
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
                    foco: perfilStore.dataNascimentoFocus,
                    funcao: () {
                      perfilStore.selectDate(context);
                    },
                    width: contrains.maxWidth * 0.95,
                    typekey: TextInputType.number,
                    label: 'Data Nascimento',
                    title: 'Data Nascimento',
                    controller: perfilStore.dataNacimentoController,
                    obscure: false,
                    hint: 'Data Nascimento',
                    icon: FontAwesomeIcons.calendarPlus,
                    corIcon: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DropdownSearch<String>(
                      mode: Mode.DIALOG,
                      showSelectedItems: true,
                      items: [
                        "undefined",
                        "male",
                        "female",
                      ],
                      hint: "Gênero",
                      dialogMaxWidth: 30,
                      dropdownSearchBaseStyle:
                          AppTextStyle.accentButtonTextStyle,
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                      selectedItem: "undefined"),
                  SizedBox(
                    height: 12,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      // registerStore.validaCampo(context);
                    },
                    text: 'CADASTRAR',
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
