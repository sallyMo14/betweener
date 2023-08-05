import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/models/link.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';
import 'package:tt9_betweener_challenge/views/widgets/secondary_button_widget.dart';

class EditLinkView extends StatefulWidget {
  static String id = '/EditLinkView';
  final Link link;
  const EditLinkView({super.key, required this.link});

  @override
  State<EditLinkView> createState() => _EditLinkViewState();
}

class _EditLinkViewState extends State<EditLinkView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Link link;

  @override
  void initState() {
    link = widget.link;
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
                  hint: link.title,
                  keyboardType: TextInputType.emailAddress,
                  // autofillHints: const [AutofillHints.],
                  label: 'Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: linkController,
                  hint: link.link,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.url],
                  label: 'Link',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the link';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                SecondaryButtonWidget(
                  onTap: submitEdittingLink,
                  text: "Edit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submitEdittingLink() {
    if (_formKey.currentState!.validate()) {
      final body = {
        'title': titleController.text,
        'link': linkController.text,
      };
      final id = link.id;
      editLink(context, body, id!).then((value) {
        if (mounted) {
          Navigator.pop(context, true);

          // Navigator.pop(context);
        }
      }).catchError((err) {
        print("//////////////////////////In SubmitEditing Linkb");
        print(body);
        print(link.id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ));
      });
    }
  }
}
