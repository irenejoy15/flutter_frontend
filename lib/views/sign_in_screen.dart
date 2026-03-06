import 'package:flutter/material.dart';
import 'package:shop_app/controllers/auth_controller.dart';

import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // VALIDATION
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // CONTROLLER
  final AuthController _authController = AuthController();
  
  late String email;
  late String password;

  bool _isloading = false;
  void _signInUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await _authController.signInUser(
        email: email, 
        password: password, 
        context: context
      );
      setState(() {
        _isloading = false;
      });
    }else {
      print('all fields are required');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'SIGN IN TO YOUR ACCOUNT',
                    style: TextStyle(
                      fontSize: 19, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7
                    ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
            
                InkWell(
                  onTap: () {
                      _signInUser();
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
                      child: _isloading? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ) : Text(
                        'SIGN IN',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('NEED AN ACCOUNT?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return SignUpScreen();
                          }),
                        );
                      }, 
                      child: Text('SIGN UP')
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}