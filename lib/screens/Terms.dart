import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money/screens/USer.dart';

class terms extends StatelessWidget {
  final String username;
  const terms({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowGlow();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              usersettings(username: username),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'Terms & Conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    '''Money Management App Terms and ConditionsThese terms and conditions ('Terms') govern your use of the Money Management App . By using the App, you agree to be bound by these Terms. If you do not agree with these Terms, please do not use the App.\n 1. Account Registration \n  a. You must create an account to use the App. You are responsible for maintaining the confidentiality of your account information and for any activity that occurs under your account. \n    b. You agree to provide accurate and complete information during the registration process and to update your account information as necessary. \n  c. You must be at least 18 years old to create an account and use the App.\n  2. Use of the App \n  a. The App is intended for personal, non-commercial use only. You may not use the App for any illegal or unauthorized purpose.\n  b. You agree to use the App in compliance with all applicable laws and regulations.\n  c. You understand and acknowledge that the App is provided for informational purposes only and does not constitute financial advice. You should consult with a qualified financial professional for personalized advice.\n  3. Privacy \n  a. Your privacy is important to us. Please refer to our Privacy Policy [provide a link to your Privacy Policy] for information on how we collect, use, and disclose your personal information. \n  4. Intellectual Property \n  a. The App and all its content, including but not limited to text, graphics, logos, icons, and software, are the property of [Your Company Name] and are protected by intellectual property laws. \n  b. You may not modify, reproduce, distribute, or create derivative works based on the App or its content without our prior written consent. \n  5. Limitation of Liability \n  a. The App is provided on an 'as is' basis without warranties of any kind, either expressed or implied. \n   b. We do not guarantee the accuracy, completeness, or reliability of any information provided by the App. \n  c. In no event shall [Your Company Name] be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use of the App. \n  6. Termination \n  a. We reserve the right to terminate or suspend your access to the App at any time for any reason, without prior notice. \n   b. Upon termination, all provisions of these Terms which by their nature should survive termination shall survive, including but not limited to intellectual property provisions, disclaimers, and limitations of liability. \n  7. Governing Law and Jurisdiction \n  a. These Terms shall be governed by and construed in accordance with the laws of [Your Country/Region], without regard to its conflict of law provisions. \n  b. Any dispute arising out of or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts in [Your City, Country/Region]. \n   8. Changes to the Terms\n  a. We reserve the right to update or modify these Terms at any time without prior notice. Any changes to the Terms will be effective immediately upon posting on the App. \n  b. Your continued use of the App after the posting of any changes constitutes your acceptance of the modified Terms.\n'''),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
