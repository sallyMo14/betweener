import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';
import 'package:tt9_betweener_challenge/views/widgets/secondary_button_widget.dart';

class AddLinkView extends StatefulWidget {
  static String id = '/AddLinkView';
  const AddLinkView({super.key});

  @override
  State<AddLinkView> createState() => _AddLinkViewState();
}

class _AddLinkViewState extends State<AddLinkView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: titleController,
                  hint: 'Snapchat',
                  keyboardType: TextInputType.emailAddress,
                  // autofillHints: const [AutofillHints.],
                  label: 'Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: linkController,
                  hint: 'http:\\\\www.example.com',
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.url],
                  label: 'Link',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                SecondaryButtonWidget(
                  onTap: submitAddingLink,
                  text: "ADD",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submitAddingLink() {
    if (_formKey.currentState!.validate()) {
      final body = {
        'title': titleController.text,
        'link': linkController.text,
      };
      addLink(context, body).then((value) {
        if (mounted) {
          Navigator.pop(context, true);
        }
      }).catchError((err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ));
      });
    }
  }
}

// login(body).then((user) async {
// //save user locally
// final SharedPreferences prefs = await SharedPreferences.getInstance();
// await prefs.setString('user', userToJson(user));
//
// if (mounted) {
// Navigator.pushNamed(context, MainAppView.id);
// }
// }).catchError((err) {
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// content: Text(err.toString()),
// backgroundColor: Colors.red,
// ));
// });
