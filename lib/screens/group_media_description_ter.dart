

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../model/group_media_description_ter.dart';

class GroupMediaDescriptionSuitWidget extends StatefulWidget {
  const GroupMediaDescriptionSuitWidget({super.key});

  @override
  _GroupMediaDescriptionSuitWidgetState createState() => _GroupMediaDescriptionSuitWidgetState();
}

class _GroupMediaDescriptionSuitWidgetState extends State<GroupMediaDescriptionSuitWidget> {
  late final GroupMediaDescriptionSuitModel _model;

  @override
  void initState() {
    super.initState();
    _model = GroupMediaDescriptionSuitModel();
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
            borderColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
          title: Row(
            children: [
              Text('Nom groupe', style: theme.title2),

            ],
          ),
          elevation: 2,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Text('Description', style: theme.title3, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('groupMediaDescriptionSuit'),
                child: const Center(child: Text('Media', style: TextStyle(letterSpacing: 0))),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Text('Statut : Fermer', style: theme.bodyText1.copyWith(color: theme.error))),
                        Expanded(child: Text('Éditeur : Nom Admin', style: theme.bodyText1)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Description : Hello World', style: theme.bodyText1),
                    const SizedBox(height: 20),
                    Text('Résumé : Hello World', style: theme.bodyText1),
                  ].divide(const SizedBox(height: 20)),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('detail'),
          backgroundColor: const Color(0xFFF4C534),
          child: const Icon(Icons.group_add, color: Colors.white),
        ),
      ),
    );
  }
}
