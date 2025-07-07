import 'package:cstech_test/presentation/login_screen.dart';
import 'package:cstech_test/presentation/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/gestures.dart';
import '../controllers/auth_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isTermsAccepted = false;

  final AuthController authController = Get.put(AuthController());

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final whController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    authController.dispose();
    super.dispose();
  }

  void checkAuth(BuildContext context){
    if(usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || mobileController.text.isEmpty || whController.text.isEmpty ){
      Get.snackbar("Please Field All Fields", "to submit form you need to enters all values.");
    }
    else{
      if (isTermsAccepted) {
        authController.register(usernameController.text, emailController.text, passwordController.text,whController.text,mobileController.text);

        isTermsAccepted=false;
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        mobileController.clear();
        whController.clear();
      } else {



        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "Please accept the Terms and Conditions"),
          ),
        );
      }

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24),
          child:
              Stack(
                children:[
                  if(authController.isLoading.value)...{
                    Center(
                      child: CircularProgressIndicator(),

                    ),
                  },

              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/Logo.png',
                  height: 60,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Please register to continue",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _inputField("Name", "assets/icons/persone.png",usernameController),
                    _inputField("Email address", "assets/icons/message.png",emailController),
                    _inputField("Password", "assets/icons/password.png",passwordController, obscure: true),
                    _whatsappInputField(),
                    _inputField("Mobile number", "assets/icons/phone.png",mobileController),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: isTermsAccepted,
                          onChanged: (value) {
                            setState(() {
                              isTermsAccepted = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree to the ",
                              children: [
                                TextSpan(
                                  text: "Terms and Conditions",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Sign In",
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
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                          checkAuth(context);

                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


          ])
        )
        )
      ),
    );
  }

  Widget _inputField(String hint, String icon,TextEditingController controller,
      {bool obscure = false, String? prefixText, IconData? suffixIcon}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(

          suffixIcon: Image.asset(icon),
          hintText: hint,
          prefixText: prefixText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _whatsappInputField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/india.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          const Text("+91"),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(

              controller: whController,
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                suffixIcon: Image.asset("assets/icons/whatsapp.png"),
                hintText: "",
                border: InputBorder.none,
              ),

            ),
          ),
        ],
      ),
    );
  }
}
