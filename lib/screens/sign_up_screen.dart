import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final invitationCodeController = TextEditingController();
  bool _hasNoInvitationCode = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    invitationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant_menu, color: Colors.black, size: 30),
                    SizedBox(width: 8),
                    Text(
                      'hellofood',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: 'First Name',
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Last Name',
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                CustomTextField(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  controller: phoneController,
                ),
                SizedBox(height: 16),

                CustomTextField(
                  hintText: 'Invitation Code',
                  prefixIcon: Icon(Icons.code),
                  controller: invitationCodeController,
                ),
                SizedBox(height: 8),

                Row(
                  children: [
                    Checkbox(
                      value: _hasNoInvitationCode,
                      onChanged: (value) {
                        setState(() {
                          _hasNoInvitationCode = value ?? false;
                          if (_hasNoInvitationCode) {
                            invitationCodeController.clear();
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Leave empty if you don’t have Invitation Code',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    print('Sign Up tapped');
                    print('First Name: ${firstNameController.text}');
                    print('Last Name: ${lastNameController.text}');
                    print('Phone: ${phoneController.text}');
                    print('Invitation Code: ${invitationCodeController.text}');
                  },
                ),
                SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Or', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      letter: 'f',
                      onPressed: () {
                        print('Facebook Sign-Up');
                      },
                    ),
                    SizedBox(width: 24),
                    SocialButton(
                      letter: 'G',
                      onPressed: () {
                        print('Google Sign-Up');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Already have an account? Sign In',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
