import 'dart:convert';

import 'package:chatgpt_desktop/components/chat/chat_setting_controller.dart';
import 'package:chatgpt_desktop/components/chat_history_controller.dart';
import 'package:chatgpt_desktop/gpt/plugins/gpt_plugin_interface.dart';

import 'package:chatgpt_desktop/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PluginItem extends StatelessWidget {
  final GPTPluginInterface plugin;

  PluginItem({super.key, required this.plugin});

  final ChatSettingController controller = Get.put(ChatSettingController());
  final ChatHistoryController chatHistoryController = Get.put(ChatHistoryController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: plugin.icon,
          ),
          const SizedBox(width: 10),
          Text(plugin.name),
          Expanded(child: Container()),
          Obx(() => Switch(
            value: controller.currentChat.value.plugins.contains(plugin.name),
            onChanged: (value) {
              if (value) {
                controller.currentChat.update((val) {
                  val!.plugins.add(plugin.name);
                  Util.writeFile('chats/${controller.currentChat.value.id}.json',
                      jsonEncode(controller.currentChat.value));
                });
              } else {
                controller.currentChat.update((val) {
                  val!.plugins.remove(plugin.name);
                  Util.writeFile('chats/${controller.currentChat.value.id}.json',
                      jsonEncode(controller.currentChat.value));
                });
              }
            },
          )),
        ],
      ),
      subtitle: Text(plugin.description),
    );
  }
}