import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yes_no_app/config/helper/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/massage.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesnoAnswer();

  List<Message> messageList = [
    Message(text: 'Siuuuu', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del partido?', fromWho: FromWho.me),
  ];

  Future<void> sendmMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }
    notifyListeners();
    SchedulerBinding.instance.addPostFrameCallback((_){
      moveScrollToBottom();
    });
    
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    SchedulerBinding.instance.addPostFrameCallback((_){
      moveScrollToBottom();
    });
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
