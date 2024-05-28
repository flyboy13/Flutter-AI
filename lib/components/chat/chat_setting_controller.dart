import 'package:chatgpt_desktop/entity/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSettingController extends GetxController{
  Rx<ChatItem> currentChat = ChatItem(id: '-', name: "New Chat", avatar: "", lastMessage: "", lastMessageTime: "", subtitle: 'Empty Description').obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController systemController = TextEditingController();
}