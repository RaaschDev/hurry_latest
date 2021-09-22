import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/chat/chat_store.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class TextComposer extends StatefulWidget {
  const TextComposer({Key? key}) : super(key: key);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  ChatStore chatStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              chatStore.capturePhoto();
            },
            icon: Icon(
              Icons.photo,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: TextField(
              controller: chatStore.msgController,
              decoration: InputDecoration(
                  hintText: "Enviar uma Mensagem",
                  hintStyle: AppTextStyle.accentButtonTextStyle),
              style: AppTextStyle.accentButtonTextStyle,
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                chatStore.sendMessage(text);
                chatStore.msgController.clear();
              },
            ),
          ),
          IconButton(
            onPressed: _isComposing
                ? () {
                    chatStore.sendMessage(chatStore.msgController.text);
                  }
                : null,
            icon: Icon(
              Icons.send,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
