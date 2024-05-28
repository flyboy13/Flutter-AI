import 'package:chatgpt_desktop/components/chat.dart';
import 'package:chatgpt_desktop/components/chat_history_controller.dart';
import 'package:chatgpt_desktop/components/chat_history_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsView extends StatelessWidget {
  final inputValue = ''.obs;
  final Color textColor = const Color.fromARGB(255, 115, 98, 140);
  final Color bgDarkColor = const Color.fromARGB(255, 54, 37, 79);
  final Color bgColor = const Color.fromARGB(150, 64, 46, 88);
  final ChatHistoryController chatHistoryController =
      Get.put(ChatHistoryController());

  ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 240,
          color: bgColor,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: bgDarkColor,
                ))),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: bgDarkColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            maxLines: 1,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Search your chats',
                              hintStyle: TextStyle(color: textColor),
                              prefixIcon: Icon(Icons.search, color: textColor),
                              prefixIconConstraints:
                                  const BoxConstraints.tightFor(
                                      width: 30, height: 20), 
                            ),
                            style: TextStyle(
                                fontSize: 12, 
                                fontFamily:
                                    'Roboto;Arial;Helvetica;Georgia;微软雅黑',
                                color: textColor),
                            onChanged: (value) {
                              inputValue.value = value;
                            },
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        // 原型按钮
                        IconButton(
                          onPressed: () {
                            chatHistoryController.addChat();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                bgDarkColor), 
                          ),
                          icon: const Icon(Icons.add),
                          color: textColor,
                          hoverColor: const Color.fromARGB(255, 53, 23, 85),
                          padding: const EdgeInsets.all(0),
                          iconSize: 20,
                          constraints:
                              const BoxConstraints.tightFor(width: 30, height: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: ChatHistoryList()),
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.transparent,
          child: Obx(() => chatHistoryController.selectedChatId.value.isEmpty
              ? Container(
                  color: Colors.white,
                  child: const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, size: 100, color: Colors.grey),
                      SizedBox(height: 20),
                      Text(
                        "Welecome to GPT App",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )))
              : Chat(id: chatHistoryController.selectedChatId.value)),
        ))
      ],
    );
  }
}
