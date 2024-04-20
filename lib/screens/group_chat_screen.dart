import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage {
  String messageContent;
  String senderName;
  String messageType;
  DateTime timestamp;
  String avatarUrl;

  ChatMessage({
    required this.messageContent,
    required this.senderName,
    required this.messageType,
    required this.timestamp,
    required this.avatarUrl,
  });
}

class GroupChatScreen extends StatefulWidget {
  GroupChatScreen({Key? key}) : super(key: key);

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "That sounds great!",
      senderName: "John Doe",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "Indeed, the earlier we can set it up the better.",
      senderName: "Jane Smith",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(Duration(minutes: 2)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "Can we finalize the meeting by tomorrow?",
      senderName: "Will Johnson",
      messageType: "sender",
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      avatarUrl: "assets/images/user.png",
    ),
    ChatMessage(
      messageContent: "I’ll share the agenda by EOD today.",
      senderName: "Emma Brown",
      messageType: "receiver",
      timestamp: DateTime.now().subtract(Duration(seconds: 30)),
      avatarUrl: "assets/images/user.png",
    ),
  ];

  final TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      messages.insert(
        0,
        ChatMessage(
          messageContent: text,
          senderName: "You",
          messageType: "sender",
          timestamp: DateTime.now(),
          avatarUrl: "assets/images/user.png", // Your avatar
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Chat"),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Add your onPressed function here
            },
            itemBuilder: (BuildContext context) {
              return {'Modifier le groupe', 'Supprimer le groupe', 'Fremer le groupe', 'Paramtres de groupe' , 'ajouter au groupe'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(  // This row is for fixed buttons below the AppBar
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed('groupMediaDescriptionWidget'),
                child: const Text('Description',style: TextStyle(color: Colors.grey,fontSize: 20) ),
              ),
              TextButton(

                onPressed: () {
                  // Add your onPressed function here
                },
                child: const Text('Descution', style: TextStyle(color: Colors.black, fontSize: 20 , ) ),

                ),

              TextButton(
                onPressed: () => Navigator.of(context).pushNamed('groupMedia'),
                child: const Text('Media',style: TextStyle(color: Colors.grey,fontSize: 20) ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                bool isMe = msg.messageType == "sender";
                return Row(
                  mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      CircleAvatar(
                        backgroundImage: AssetImage(msg.avatarUrl),
                        radius: 16,
                      ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (isMe ? const Color(0xFFF4C534) : Colors.grey[200]),
                      ),
                      child: Column(
                        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          if (!isMe)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                msg.senderName,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                            ),
                          Container(
                            width: 200, // Maximum width of the text
                            child: Text(
                              msg.messageContent,
                              softWrap: true,
                              style: TextStyle(color: isMe? Colors.white : Colors.black),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('hh:mm a').format(msg.timestamp),
                            style:  TextStyle(
                              fontSize: 10,
                              color: isMe? Colors.white : Colors.black45,
                            ),
                            softWrap: true,
                          ),
                        ],
                      )
                      ,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Send a message...",
                      fillColor: Colors.grey[100],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      _handleSubmitted(_controller.text);
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFF4C534),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: GroupChatScreen()));
