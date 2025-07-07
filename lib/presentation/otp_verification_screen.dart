import 'package:cstech_test/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'home_screen.dart';

import 'package:get/get.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {


  final storage = FlutterSecureStorage();
  late String number;

  @override
  void initState() {
    // TODO: implement initState
    authController.readStoredNumber();
    super.initState();
  }





  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      body: SafeArea(
        child: Obx(() =>Stack(
          children: [
            if(authController.isLoading.value)...{
              Center(
                child: CircularProgressIndicator(),
              )
            },
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset("assets/Logo.png", height: 60),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.only(top: 16),
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context
                              ).size.height*0.08,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Text(
                                  "Whatsapp OTP Verification",
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Please ensure that the email id mentioned is valid.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              const Text(
                                "as we have sent an OTP to your email.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              const SizedBox(height: 24),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(6, (index) {
                                  return Container(
                                    width: 45,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade700),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextField(
                                      controller: authController.otpControllers[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),

                              const SizedBox(height: 16),
                               Text(
                                "+91 ${authController.number.value}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                               SizedBox(height: MediaQuery.of(context).size.height*0.21),


                              Text.rich(
                                TextSpan(
                                  text: "Didn't receive OTP code? ",
                                  children: [
                                    TextSpan(
                                      text: "Resend OTP",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 22),

                              // Verify Button
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0,right: 24.0,bottom: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      authController.verifyOTP();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      minimumSize: const Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "Verify",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}
