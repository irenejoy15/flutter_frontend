import 'package:flutter/material.dart';

class ConfirmSignUpScreen extends StatefulWidget {
  final String email;
  const ConfirmSignUpScreen({super.key, required this.email});
  @override
  State <ConfirmSignUpScreen> createState() =>  ConfirmSignUpScreenState();
}

class ConfirmSignUpScreenState extends State <ConfirmSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'VERIFY YOUR ACCOUNT',
                  style: TextStyle(
                    fontSize: 19, 
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.7
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Enter the OTP sent to your email address ${widget.email} to verify your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.grey[600],
                    letterSpacing: 1.7
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) => value == null || value.isEmpty ? 'Please enter the OTP' : null,
                  decoration: InputDecoration(
                    labelText: 'ENTER OTP',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Confirming OTP'); // Call your confirmSignUp function here
                    }else{
                      print('OTP validation failed');
                    }
                  },
                  child: Container(
                    width:319,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'VERIFY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5
                        ),
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