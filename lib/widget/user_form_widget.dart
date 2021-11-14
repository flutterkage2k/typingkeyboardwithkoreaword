import 'package:flutter/material.dart';
import 'package:fluttergooglesheetapi/model/word.dart';
import 'package:fluttergooglesheetapi/widget/button_widget.dart';

class UserFormWidget extends StatefulWidget {
  final UserWord? userWord;
  final ValueChanged<UserWord> onSavedUserWord;

  const UserFormWidget({Key? key, required this.onSavedUserWord, this.userWord})
      : super(key: key);

  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  late FocusNode myFocusNode;

  final formKey = GlobalKey<FormState>();

  late TextEditingController contorllerShowWord;
  late TextEditingController contorllerUserInput;

  @override
  void initState() {
    super.initState();
    initWord();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant UserFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initWord();
  }

  void initWord() {
    final kwordSample =
        widget.userWord == null ? '' : widget.userWord!.kwordSample;

    setState(() {
      contorllerShowWord = TextEditingController(text: kwordSample);
      contorllerUserInput = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildShowWord(),
            const SizedBox(height: 16),
            buildUserInput(),
            const SizedBox(height: 16),
            // buildSubmit(),
          ],
        ),
      );

  Widget buildShowWord() => TextFormField(
        readOnly: true,
        controller: contorllerShowWord,
      );

  Widget buildUserInput() => TextFormField(
        focusNode: myFocusNode,
        controller: contorllerUserInput,
        validator: (value) =>
            value != null && value.isEmpty ? '빈칸은 안되요!' : null,
      );

  Widget buildSubmit() => ButtonWidget(
      text: 'Save',
      onClicked: () {
        final form = formKey.currentState!;
        final isValid = form.validate();
        if (isValid) {
          final userword = UserWord(
            kwordSample: contorllerShowWord.text,
            kwordUserInput: contorllerUserInput.text,
          );
          widget.onSavedUserWord(userword);
        }
      });
}
