import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/src/chat/list_msg_widget.dart';
import 'package:hurry/app/src/chat/text_composer.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          title: Text(
            'Conversa Com',
            style: AppTextStyle.accentButtonTextStyle,
            textAlign: TextAlign.center,
          ),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(),
        ),
        preferredSize: Size(double.maxFinite, 60),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListMsgWidget(),
          ),
          TextComposer()
        ],
      ),
    );
  }
}
