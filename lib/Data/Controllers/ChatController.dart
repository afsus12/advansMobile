import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends GetxController {
  final WebSocketChannel channel;
  final String clientId;
  final String staffId;
  final box = GetStorage();
  var token = "";
  var messages = <MessageDTO>[].obs; // Change to List<Map<String, String>>
  var isLoading = false.obs;

  ChatController(
    this.channel,
    this.clientId,
    this.staffId,
  );

  @override
  void onInit() {
    super.onInit();
    token = box.read("TOKEN");
    _loadMessages();
    channel.stream.listen((message) {
      final decodedMessage = json.decode(message);
      messages.add(MessageDTO(
        from: decodedMessage['from'].toString(),
        to: decodedMessage['to'].toString(),
        content: decodedMessage['content'].toString(),
      ));
    });
  }

  void _loadMessages() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/messages/client/$clientId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        messages.assignAll(data
            .map((msg) => MessageDTO(
                  from: msg['from'].toString(),
                  to: msg['to'].toString(),
                  content: msg['content'].toString(),
                ))
            .toList());
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void sendMessage(String content) async {
    final message = {
      'from': clientId,
      'to': staffId,
      'content': content,
    };
    channel.sink.add(json.encode(message));

    messages.add(MessageDTO(
      from: clientId,
      to: staffId,
      content: content,
    ));
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/messages'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(message),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to save message');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }
}

class MessageDTO {
  final String from;
  final String to;
  final String content;

  MessageDTO({required this.from, required this.to, required this.content});

  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    return MessageDTO(
      from: json['from'],
      to: json['to'],
      content: json['content'],
    );
  }
}
