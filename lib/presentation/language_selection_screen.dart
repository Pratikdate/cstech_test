import 'package:cstech_test/presentation/registration_screen.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'name': 'English', 'greeting': 'Hi'},
    {'name': 'Hindi', 'greeting': 'नमस्ते'},
    {'name': 'Bengali', 'greeting': 'হ্যালো'},
    {'name': 'Kannada', 'greeting': 'ಹೆಲೋ'},
    {'name': 'Punjabi', 'greeting': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'name': 'Tamil', 'greeting': 'வணக்கம்'},
    {'name': 'Telugu', 'greeting': 'హలో'},
    {'name': 'French', 'greeting': 'Bonjour'},
    {'name': 'Spanish', 'greeting': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 243, 248, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose Your Language",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 28),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        final lang = languages[index];
                        return RadioListTile<String>(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          title: Text(
                            lang['name']!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(lang['greeting']!),
                          value: lang['name']!,
                          groupValue: selectedLanguage,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              )

              ,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Select",style: TextStyle(color: Colors.white,fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
