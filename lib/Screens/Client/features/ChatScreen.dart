import 'package:advans_app/Data/Controllers/ChatController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String clientId = '2452'; // Replace with actual client ID
  final String staffId = '1'; // Replace with actual staff ID

  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse(
        'ws://10.0.2.2:8080/ws'), // Update the URL to your backend WebSocket endpoint
  );

  @override
  Widget build(BuildContext context) {
    final ChatController chatController =
        Get.put(ChatController(channel, clientId, staffId));
    final _advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      drawer: SideMenu(),
      openRatio: 0.60,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MyColors.MainGreenColor,
              MyColors.MainGreenColor.withOpacity(0.8)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBarDelegate(
                minHeight: 80.h,
                maxHeight: 80.h,
                child: Appbar(
                  name: "",
                  paddingtop: 30,
                  title: "chat",
                  onPressedMenu: () {},
                  onPressedNotification: () {},
                ),
              ),
            ),
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Obx(() {
                        if (chatController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            height: ScreenUtil.defaultSize.height - 80.h,
                            child: ListView.builder(
                              itemCount: chatController.messages.length,
                              itemBuilder: (context, index) {
                                final message = chatController.messages[index];
                                final isSentByClient = message.from == clientId;
                                final isSentByStaff = message.from == staffId;

                                return ListTile(
                                  title: Text(
                                    message.content,
                                    textAlign: isSentByClient
                                        ? TextAlign.end
                                        : TextAlign.start,
                                  ),
                                  subtitle: Text(
                                    isSentByClient
                                        ? 'You'
                                        : isSentByStaff
                                            ? 'Staff'
                                            : 'Unknown',
                                    textAlign: isSentByClient
                                        ? TextAlign.end
                                        : TextAlign.start,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration:
                                  InputDecoration(labelText: 'Send a message'),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                chatController.sendMessage(_controller.text);
                                _controller.clear();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
