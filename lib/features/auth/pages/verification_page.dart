import 'package:flutter/material.dart';

import 'package:whats_app/common/extension/custom_theme_extension.dart';
import 'package:whats_app/features/auth/widgets/text_form_fields.dart';
import 'package:whats_app/widgets/custom_icon_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'Verify your number',
          style: TextStyle(
            color: context.theme.authAppBarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: context.theme.greyColor,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            "You've tried to register +25 091234578. wait before requesting an sms or call write your code.  ",
                      ),
                      TextSpan(
                        text: 'Wrong number?',
                        style: TextStyle(
                          color: context.theme.blueColor,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                controller: codeController,
                hintText: '- - -  - - -',
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter 6-digit code',
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20),
                Text(
                  'Resend SMS',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20),
                Text(
                  'Call Me',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
