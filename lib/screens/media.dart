import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../model/media.dart';


class GroupMediaWidget extends StatefulWidget {
  const GroupMediaWidget({super.key});

  @override
  State<GroupMediaWidget> createState() => _GroupMediaWidgetState();
}

class _GroupMediaWidgetState extends State<GroupMediaWidget> {
  late GroupMediaModel _model;

  @override
  void initState() {
    super.initState();
    _model = GroupMediaModel();  // Assuming a simpler constructor is available
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: theme.secondaryBackground,
        appBar: AppBar(
          backgroundColor: theme.secondaryBackground,
          leading: FlutterFlowIconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D), size: 30),
            onPressed: () => Navigator.of(context).pop(),
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
          ),
          title: Text('Nom groupe', style: theme.title2.copyWith(fontSize: 25)),
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
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('groupMediaDescriptionWidget'),
                    child: const Text('Description', style: TextStyle(color: Colors.grey,fontSize: 20)),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('groupChatScreen'),
                    child: const Text('Discussion', style: TextStyle(color: Colors.grey,fontSize: 20)),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('groupMedia'),
                    child: const Text('Media', style: TextStyle(color: Colors.black,fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                     _buildImageCard('assets/images/pexels-pixabay-54084.jpg'),
                    _buildImageCard('assets/images/pexels-pixabay-265242.jpg'),
                    _buildImageCard('assets/images/pexels-pixabay-533982.jpg'),
                  ]

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(String path) => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(
      path,  // Use a placeholder or relevant image path
      width: 110,
      height: 100,
      fit: BoxFit.cover,
    ),
  );
}
