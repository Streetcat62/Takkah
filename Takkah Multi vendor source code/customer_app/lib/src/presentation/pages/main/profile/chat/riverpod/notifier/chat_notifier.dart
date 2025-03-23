import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/chat_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ChatNotifier() : super(ChatState(textController: TextEditingController()));

  Future<void> fetchChats({VoidCallback? errorFirebase}) async {
    state = state.copyWith(isLoading: true);
    final userId = LocalStorage.instance.getUser()?.id;
    QuerySnapshot? query;
    try {
      query = await _fireStore
          .collection('chats')
          .where('user.id', isEqualTo: userId)
          .get();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      errorFirebase?.call();
    }
    if (query?.size == 0) {
      final CollectionReference chats = _fireStore.collection('chats');
      chats.doc().set(
        {
          'shop_id': -1,
          'created_at': Timestamp.now(),
          'user': {
            'firstname': LocalStorage.instance.getUser()?.firstname,
            'id': LocalStorage.instance.getUser()?.id,
            'img': LocalStorage.instance.getUser()?.img,
            'lastname': LocalStorage.instance.getUser()?.lastname,
          },
        },
      );
      final String chatId = chats.id;
      state = state.copyWith(chatId: chatId, isLoading: false);
    } else {
      state =
          state.copyWith(chatId: query?.docs.first.id ?? '', isLoading: false);
    }
  }
  void updateData() {
    state = state.copyWith(isLoading: true);
  }

  Future<void> sendMessage() async {
    debugPrint('===> send message chat id ${state.chatId}');
    try {
      CollectionReference message = _fireStore.collection('messages');
      message.add(
        {
          'chat_content': state.textController?.text.trim(),
          'chat_id': state.chatId,
          'created_at': Timestamp.now(),
          'sender': 1,
          'unread': true,
        },
      );
      state.textController?.clear();
    } catch (e) {
      debugPrint('==> send message send $e');
    }
  }

  void checkAuthorised(BuildContext context) {
    if (LocalStorage.instance.getToken().isEmpty) {
      AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
      );
      context.router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (route) => false,
      );
    } else {
      context.router.popAndPush(const ChatRoute());
    }
  }
}
