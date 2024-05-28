import 'package:chatgpt_desktop/components/chat_history_controller.dart';
import 'package:chatgpt_desktop/components/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHistoryList extends StatelessWidget {
  final ChatHistoryController controller = Get.put(ChatHistoryController());

  ChatHistoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return ChatListItem(item: controller.items[index]);
        },
      );
    });
  }
}
