import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/new_group_detail.dart';


class NewGroupDetailWidget extends StatefulWidget {
  const NewGroupDetailWidget({Key? key}) : super(key: key);

  @override
  _NewGroupDetailWidgetState createState() => _NewGroupDetailWidgetState();
}

class _NewGroupDetailWidgetState extends State<NewGroupDetailWidget> {
  late NewGroupDetailModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = NewGroupDetailModel(); // Proper initialization

    // Properly initializing all controllers and focus nodes as non-nullable
    _model.textController1 = TextEditingController();
    _model.textFieldFocusNode1 = FocusNode();
    _model.textController2 = TextEditingController();
    _model.textFieldFocusNode2 = FocusNode();
    _model.textController3 = TextEditingController();
    _model.textFieldFocusNode3 = FocusNode();
  }

  @override
  void dispose() {
    // Disposing all resources properly
    _model.textController1?.dispose();
    _model.textFieldFocusNode1?.dispose();
    _model.textController2?.dispose();
    _model.textFieldFocusNode2?.dispose();
    _model.textController3?.dispose();
    _model.textFieldFocusNode3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Nouveau Groupe', style: GoogleFonts.notoSans(fontSize: 25)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField(context, 'Nom de groupe'),
                _buildDropdown('Sélectionner Client', ['Option 1', 'Option 2'], _model),
                _buildInputField(context, 'Sujet' ),
                _buildMultiLineInputField(context, 'Description'),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('groupChatScreen'),
          backgroundColor: const Color(0xFFF4C534),
          child: const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.subtitle1),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,  // Added for better form fitting
          ),
          style: GoogleFonts.readexPro(),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> options, NewGroupDetailModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.subtitle1),
        ),
        DropdownButtonFormField<String>(
          value: model.dropDownValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              model.dropDownValue = newValue!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildMultiLineInputField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: Theme.of(context).textTheme.subtitle1),
        ),
        TextField(
          maxLines: 8,
          minLines: 3,
          decoration: InputDecoration(
            hintText: "Enter text here...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          style: GoogleFonts.readexPro(),
        ),
      ],
    );
  }
}
