import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  TextEditingController nomeController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController celularController =
      TextEditingController(text: '999999999');
  @observable
  TextEditingController dataNacimentoController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();
  @observable
  TextEditingController repetirSenhaController = TextEditingController();
  @observable
  bool verSenha = false;
  @observable
  bool verRepetirSenha = false;
  @observable
  bool politicaPrivacidade = false;
  @observable
  bool termosUso = false;
  @observable
  FocusNode nomeFocus = FocusNode();
  @observable
  FocusNode emailFocus = FocusNode();
  @observable
  FocusNode celularFocus = FocusNode();
  @observable
  FocusNode dataNascimentoFocus = FocusNode();
  @observable
  FocusNode senhaFocus = FocusNode();
  @observable
  FocusNode repetirSenhaFocus = FocusNode();

  @action
  void obscureSenha() {
    verSenha = !verSenha;
  }

  @action
  void obscureRepetirSenha() {
    verRepetirSenha = !verRepetirSenha;
  }

  @action
  void aceitarTermoUso() {
    termosUso = !termosUso;
  }

  @action
  void aceitarTermosPrivacidade() {
    politicaPrivacidade = !politicaPrivacidade;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (date != null) //if the user has selected a date
      dataNacimentoController.text = DateFormat("dd/MM/yyyy").format(date);
  }

  @action
  void validaCampo(BuildContext context) {
    if (politicaPrivacidade && termosUso) {
      if (nomeController.text == '') {
        showScaffold(context, 'Informe o Nome', Duration(milliseconds: 4));
        nomeFocus.requestFocus();
      } else if (!emailController.text.contains('@')) {
        showScaffold(context, 'Email Iválido', Duration(milliseconds: 4));
        emailFocus.requestFocus();
      } else if (emailController.text == '') {
        showScaffold(context, 'Inform o Email', Duration(milliseconds: 4));
        emailFocus.requestFocus();
      } else if (celularController.text == '') {
        showScaffold(context, 'Inform o Telefone', Duration(milliseconds: 4));
        celularFocus.requestFocus();
      } else if (dataNacimentoController.text == '') {
        showScaffold(
            context, 'Informe  Data Nascimento', Duration(milliseconds: 4));
        dataNascimentoFocus.requestFocus();
      } else if (senhaController.text == '') {
        showScaffold(
            context, 'Senha não pode esta vazio', Duration(milliseconds: 4));
        senhaFocus.requestFocus();
      } else if (repetirSenhaController.text == '') {
        showScaffold(context, 'Repetir  Senha não pode esta vazio',
            Duration(milliseconds: 4));
        repetirSenhaFocus.requestFocus();
      } else if (senhaController.text != repetirSenhaController.text) {
        showScaffold(
            context, 'As Senhas devem ser iguais', Duration(milliseconds: 4));
        repetirSenhaFocus.requestFocus();
      }
    } else {
      showScaffold(
          context,
          'Necessario aceitar a Política de privacidade e os Termos de uso',
          Duration(milliseconds: 4));
    }
  }

  void showScaffold(BuildContext context, String message, Duration duration) {
    final SnackBar snackBar = SnackBar(
        duration: duration,
        content: Text(message),
        action: SnackBarAction(
          label: 'Sair',
          onPressed: () {},
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @observable
  XFile? imgFile;

  void capturePhoto() async {
    imgFile = await (ImagePicker().pickImage(source: ImageSource.camera));
    salvaFotoFireStore();
  }

  @observable
  String urlImg = '';

  @action
  Future<void> salvaFotoFireStore() async {
    DateTime dataTime = DateTime.now();
    if (imgFile != null) {
      if (imgFile!.path != '') {
        UploadTask task = FirebaseStorage.instance
            .ref()
            .child(dataTime.toString())
            .putFile(File(imgFile!.path));
        var img = await (await task).ref.getDownloadURL();
        urlImg = img.toString();
        urlImg = urlImg;
      }
    } else {
      urlImg = '';
    }
  }
}
