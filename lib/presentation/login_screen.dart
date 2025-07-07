import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'otp_verification_screen.dart';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});


   final AuthController authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void login(BuildContext context){
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar("Please Field All Fields", "to submit form you need to enters all values.");
    }else{
      authController.login(emailController.text, passwordController.text);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      body: SafeArea(

        child: Obx(() =>SingleChildScrollView(

          padding: const EdgeInsets.only(top: 24),
          child: Stack(
            children: [
              if(authController.isLoading.value)...{
                Center(
                  child: CircularProgressIndicator(),

                ),
              },
        Column(

            children: [
              const SizedBox(height: 40),
              Image.asset("assets/Logo.png", height: 60),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.13),
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Please sign-in to continue",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      _inputField(
                        controller:emailController,
                        hint: "Email address",
                        imagePath: "assets/icons/message.png",
                      ),
                      _inputField(
                        controller:passwordController,
                        hint: "Password",
                        imagePath: "assets/icons/password.png",
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        ),
                      ),
                       SizedBox(height: MediaQuery.of(context).size.height*0.18),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,


                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {

                                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      ElevatedButton(
                        onPressed: () {
                          login(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ])
        ),)
      ),
    );
  }

  Widget _inputField({
    required String hint,
    required String imagePath,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
