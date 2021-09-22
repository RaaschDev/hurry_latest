import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes/themes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Input extends StatelessWidget {
  final String title;
  final String hint;
  final String label;
  final IconData? icon;
  final Color? corIcon;
  final TextEditingController controller;
  final TextInputType typekey;
  final obscure;
  final VoidCallback? funcao;
  final List<TextInputFormatter>? mask;
  final FocusNode? foco;
  final double width;
  const Input({
    Key? key,
    this.title = "CustomFormFieldWidget",
    required this.label,
    this.icon,
    required this.controller,
    required this.typekey,
    required this.obscure,
    this.funcao,
    this.corIcon,
    this.foco,
    required this.width,
    required this.hint,
    this.mask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: 50,
      //70% da largura da tela
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          blurRadius: 3,
          color: Colors.black45,
          offset: Offset(2, 2),
        )
      ]),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            inputFormatters: mask,
            focusNode: foco,
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none, hintText: label, hintStyle: GoogleFonts.abel()),
            keyboardType: typekey,
            obscureText: obscure,
          )),
          InkWell(
            onTap: funcao,
            child: Icon(
              icon,
              color: corIcon,
            ),
          ) // Pode passar imagens ou icons
        ],
      ),
    );
  }
}
