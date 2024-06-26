import 'package:chatgpt_desktop/enums/model_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatInput extends StatelessWidget{
  final InputFinish? onFinish;
  ChatInput({super.key, this.onFinish});

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

   final selectModel = ModelEnums.models.first.obs;

  @override
  Widget build(BuildContext context) {
    // controller.addListener(() {
    //   if(controller.text.endsWith('\n')){
    //     if(onFinish != null){
    //       onFinish!(controller.text, 'gpt-3.5-turbo');
    //     }
    //     controller.clear();
    //   }
    // });
    
    return Container(
      color: const Color.fromARGB(255, 252, 252, 252),
      height: 180,
      child: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file), tooltip: 'Attach File'),
              IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt), tooltip: 'Attach Image'),
              IconButton(onPressed: (){}, icon: const Icon(Icons.cut), tooltip: 'Cut'),
              Expanded(child: Container()),
              Obx(() => DropdownButton<Model>(
                value: selectModel.value,
                items: ModelEnums.models
                    .map((Model value) {
                  return DropdownMenuItem<Model>(
                    value: value,
                    child: Text(value.displayName),
                  );
                }).toList(),
                underline: Container(),
                onChanged: (newValue) {
                  selectModel.value = newValue!;
                },
              )),
          
              // IconButton(onPressed: (){}, icon: Row(
              //   children: [
              //     Icon(Icons.model_training),
              //     const SizedBox(width: 5,),
              //     Text('gpt-3.5-turbo')
              //   ],
              // )),
            ],
          ),
          Expanded(
              child: KeyboardListener(
                focusNode: focusNode,
                onKeyEvent: handleKeyPress,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Type a message, press Enter to send, press Shift+Enter to newline.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 5,
                  controller: controller,
                ),
              ),
          )
        ],
      ),
    );
  }

  void handleKeyPress(event) {
    // print(event);
    if (event is KeyUpEvent) {
      if (event.logicalKey.keyLabel == "Enter" && !HardwareKeyboard.instance.physicalKeysPressed.contains(LogicalKeyboardKey.shiftLeft)) {
        final val = controller.value;
        final messageWithoutNewLine =
            controller.text.substring(0, val.selection.start - 1) +
                controller.text.substring(val.selection.start);
        controller.value = TextEditingValue(
          text: messageWithoutNewLine,
          selection: TextSelection.fromPosition(
            TextPosition(offset: messageWithoutNewLine.length),
          ),
        );
        String text = controller.text;
        controller.clear();
        if (onFinish != null) {
          onFinish!(text, selectModel.value.name);
        }
      }
    }
  }
}

typedef InputFinish = void Function(String message, String model);