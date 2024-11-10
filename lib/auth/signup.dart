// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login/auth/login.dart';
import 'package:login/auth/widgets/custom_button.dart';
import 'package:login/auth/widgets/customtextField.dart';
import 'package:login/home.dart';
import 'package:login/provider/provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool isCheckBox = false;
  bool isPassword = false;

  void LoginupNavigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) =>  const LoginPage()));
  }

  Future<void> signup() async {
    final signProvider = Provider.of<UserProvider>(context,listen: false);
    await signProvider.signUp(emailController.text, nameController.text, passwordController.text);
    homeNavigate();
  }

  void homeNavigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) =>  const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signProvider = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: signProvider.isLoading == true ? const Center(child: CircularProgressIndicator(),): Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/signup.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  hintText: "Name",
                  controller: nameController,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  hintText: "Email",
                  controller: emailController,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  obscureText: isPassword,
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffixIcon: isPassword
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  hintText: "Password",
                  controller: passwordController,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CustomcheckBox(
                //         value: isCheckBox,
                //         onChanged: (val) {
                //           isCheckBox = !isCheckBox;
                //           setState(() {});
                //         }),
                //     const Text('Forgot Password?')
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  width: double.infinity,
                  onPressed: signup,
                  text: 'SIGN UP',
                ),
                SizedBox(
                  height: size.height * 0.17,
                ),
                GestureDetector(
                  onTap: LoginupNavigate,
                  child: RichText(
                    text: const TextSpan(
                      text: "Already have an account?",
                      children: [
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
