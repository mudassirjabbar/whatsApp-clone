import 'package:flutter/material.dart';
import 'package:whats_app/common/extension/custom_theme_extension.dart';
import 'package:whats_app/common/utils/colors.dart';
import 'package:whats_app/features/auth/widgets/text_form_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController countryNameController =
      TextEditingController(text: 'Ethopia');
  final TextEditingController countryCodeController =
      TextEditingController(text: '251');
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Enter your phone number ',
          style: TextStyle(color: context.theme.authAppBarTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: context.theme.greyColor,
            ),
            iconSize: 22,
            splashRadius: 22,
            splashColor: Colors.transparent,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              text: TextSpan(
                  text: 'WhatsApp will need to verify your phone number. ',
                  style: TextStyle(color: context.theme.greyColor, height: 1.5),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(
                          color: context.theme.blueColor, height: 1.5),
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              controller: countryNameController,
              readOnly: true,
              onTap: () {},
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    controller: countryCodeController,
                    onTap: () {},
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    hintText: 'phone number',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
