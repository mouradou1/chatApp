import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../model/group_chat.dart';
import 'chat.dart';

class GroupsPageWidget extends StatefulWidget {
  const GroupsPageWidget({super.key});

  @override
  State<GroupsPageWidget> createState() => _GroupsPageWidgetState();
}

class _GroupsPageWidgetState extends State<GroupsPageWidget> {
  late final GroupsPageModel _model;

  @override
  void initState() {
    super.initState();
    _model = GroupsPageModel();  // Assuming GroupsPageModel does not need context in constructor
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2A343D)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Groups'),
          elevation: 4,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              _buildToggleButtons(context),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _buildGroupItem(context, index + 1),
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

  Widget _buildToggleButtons(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
        child: Container(
          width: 309,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildButton(context, 'Messages', HomePageWidget(), true),
                _buildButton(context, 'Groups', GroupsPageWidget(), false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination, bool isLight) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isLight ? const Color(0xFFD9D9D9) : FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination)),
          child: Center(
            child: Text(
              text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Outfit',
                color: const Color(0xFF57636C),
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroupItem(BuildContext context, int groupNumber) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/multiple-users-silhouette.png'),  // Assuming a group image asset
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: const Color(0xFF46F25D),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        ],
      ),
      title: Text('Group Name $groupNumber', style: FlutterFlowTheme.of(context).bodyMedium),
      subtitle: Text('Message', style: FlutterFlowTheme.of(context).bodyMedium.copyWith(fontWeight: FontWeight.w300)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Résolu', style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
            color: const Color(0xFF39D2C0), // Hex color code for turquoise
          ), ),
          Text('30/09/2024', style: FlutterFlowTheme.of(context).bodyMedium),
        ],
      ),
    );
  }
}
