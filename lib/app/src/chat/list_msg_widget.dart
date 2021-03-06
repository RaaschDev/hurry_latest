import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/chat/chat_store.dart';
import 'package:hurry/app/src/chat/chat_message_widget.dart';

class ListMsgWidget extends StatelessWidget {
  final String title;
  //final BuildContext context;
  const ListMsgWidget({
    Key? key,
    this.title = "ListMsgWidget",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatStore chatStore = Modular.get();
    return StreamBuilder<QuerySnapshot>(
      stream: chatStore.buscarConversa('usuario1', 'user5'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            List<DocumentSnapshot> documents =
                snapshot.data!.docs.reversed.toList();

            return ListView.builder(
              itemCount: documents.length,
              reverse: true,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  data: documents[index],
                  userID: 5,
                );
              },
            );
        }
      },
    );
  }
}
