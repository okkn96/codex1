import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _chatHistory = <String>[];
  late final OpenAIService _openai;

  @override
  void initState() {
    super.initState();
    _openai = OpenAIService('DEIN_OPENAI_API_KEY');
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() => _chatHistory.add('Du: $text'));
    _controller.clear();

    try {
      final reply = await _openai.sendMessage(text);
      setState(() => _chatHistory.add('Coach: $reply'));
    } catch (e) {
      setState(() => _chatHistory.add('Coach: Fehler – $e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KI-Coach')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_chatHistory[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Frage an den Coach...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
