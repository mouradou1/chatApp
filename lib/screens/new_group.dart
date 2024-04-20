import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/new_group.dart';


class NewGroupWidget extends StatefulWidget {
  const NewGroupWidget({Key? key}) : super(key: key);

  @override
  _NewGroupWidgetState createState() => _NewGroupWidgetState();
}

class _NewGroupWidgetState extends State<NewGroupWidget> {
  late NewGroupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Set<int> _selectedContacts = Set<int>(); // State to track selected contacts
  final TextEditingController _searchController = TextEditingController(); // Controller for search bar

  @override
  void initState() {
    super.initState();
    _model = NewGroupModel();

    _model.textController = TextEditingController();
    _model.textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _model.textController?.dispose();
    _model.textFieldFocusNode?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Créer un nouveau groupe',
            style: GoogleFonts.notoSans(fontSize: 20, color: Colors.black),
          ),
          elevation: 1,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => buildContactTile(context, index),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('detail2'),
          backgroundColor: const Color(0xFFF4C534),
          child: const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildContactTile(BuildContext context, int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      title: Text(
        'Nom d’utilisateur $index',
        style: GoogleFonts.readexPro(),
      ),
      subtitle: Text('Message $index'),
      trailing: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          value: _selectedContacts.contains(index),
          onChanged: (bool? value) {
            setState(() {
              if (value ?? false) {
                _selectedContacts.add(index);
              } else {
                _selectedContacts.remove(index);
              }
            });
          },
          shape: const CircleBorder(),
          side: const BorderSide(color: Colors.yellow),
        ),
      ),
    );
  }
}
