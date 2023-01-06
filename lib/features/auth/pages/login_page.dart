import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/common/extension/custom_theme_extension.dart';
import 'package:whats_app/common/helper/show_alert_dialog.dart';
import 'package:whats_app/common/utils/colors.dart';
import 'package:whats_app/features/auth/widgets/text_form_fields.dart';
import 'package:whats_app/widgets/custom_elevated_button.dart';

import '../../../widgets/custom_icon_button.dart';

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

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryCodeController.text;

    if (phone.isEmpty) {
      showAlertDialog(
        context: context,
        message: "Please enter your phone number",
      );
    } else if (phone.length < 9) {
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too short for the country: $name.\n\nInclude your area code if you haven't",
      );
    } else if (phone.length > 10) {
      showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for this country: $name.",
      );
    }
  }

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ET'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.greenDark,
          ),
          hintText: 'Search country code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Coloors.greenDark,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.countryCode;
      },
    );
  }

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
          CustomIconButton(
            icon: Icons.more_vert,
            onPressed: () {},
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
              onTap: showCountryCodePicker,
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
                    onTap: showCountryCodePicker,
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
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Carrier charges may apply',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}
