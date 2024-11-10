// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login/auth/signUp.dart';
import 'package:login/auth/widgets/custom_button.dart';
import 'package:login/auth/widgets/customcheck_box.dart';
import 'package:login/auth/widgets/customtextField.dart';
import 'package:login/home.dart';
import 'package:login/provider/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isCheckBox = false;
  bool isPassword = false;

  void SignUpNavigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => const SignUpPage()));
  }

  Future<void> login() async {
    if(isCheckBox == true){
      final loginProvider = Provider.of<UserProvider>(context, listen: false);
      await loginProvider.login(emailController.text, passwordController.text);
      homeNavigate();
    }else{
      ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar( const SnackBar(content: Text("Selected the chek box")));
    }
    
  }

  void homeNavigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) =>  const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      appBar:  AppBar(),
      body: loginProvider.isLoading == true ? const Center(child: CircularProgressIndicator(),): Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset('assets/login.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomtextField(
                  hintText: "email",
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
                  hintText: "password",
                  controller: passwordController,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomcheckBox(value: isCheckBox, onChanged: (val) {
                      isCheckBox= !isCheckBox;
                      setState(() {
                        
                      });
                    }),
                    const Text('Forgot Password?')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  width: double.infinity,
                  onPressed: login,
                  text: 'LOGIN',
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                GestureDetector(
                  onTap: SignUpNavigate,
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have an account?",
                      children: [
                        TextSpan(
                          text: " SignUp",
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
