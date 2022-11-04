import 'package:flutter/material.dart';
import 'custom_text_form.dart';

class NameScreen extends StatelessWidget {
  final TextEditingController nameController;
  const NameScreen({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 36),
          const Text(
            "We are glad you joined us! Let's get acquainted",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF9EA1B2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 36),
            child: Text(
              'Your name is',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF40445C),
              ),
            ),
          ),
          CustomTextForm(
            controller: nameController,
            hintText: 'enter your name here',
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
