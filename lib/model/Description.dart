import 'package:flutter/material.dart';

class GroupMediaDescriptionModel {
  late TextEditingController textController1;
  late FocusNode textFieldFocusNode1;

  late TextEditingController textController2;
  late FocusNode textFieldFocusNode2;

  late TextEditingController textController3;
  late FocusNode textFieldFocusNode3;

  late TextEditingController textController4;
  late FocusNode textFieldFocusNode4;

  late TextEditingController textController5;
  late FocusNode textFieldFocusNode5;

  String? radioButtonValue; // Holds the value for your radio button group

  GroupMediaDescriptionModel() {
    initializeControllers();
  }

  void initializeControllers() {
    textController1 = TextEditingController();
    textFieldFocusNode1 = FocusNode();

    textController2 = TextEditingController();
    textFieldFocusNode2 = FocusNode();

    textController3 = TextEditingController();
    textFieldFocusNode3 = FocusNode();

    textController4 = TextEditingController();
    textFieldFocusNode4 = FocusNode();

    textController5 = TextEditingController();
    textFieldFocusNode5 = FocusNode();

    radioButtonValue = 'En cours'; // Default value for radio buttons
  }

  void disposeControllers() {
    textController1.dispose();
    textFieldFocusNode1.dispose();

    textController2.dispose();
    textFieldFocusNode2.dispose();

    textController3.dispose();
    textFieldFocusNode3.dispose();

    textController4.dispose();
    textFieldFocusNode4.dispose();

    textController5.dispose();
    textFieldFocusNode5.dispose();
  }
}
