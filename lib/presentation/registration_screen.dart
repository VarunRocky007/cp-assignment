import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/domain/usecase/sign_up_use_case.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _error = '';

  void _registerUser() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });
    SignUpUseCase signUpUseCase = SignUpUseCase();
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final response = await signUpUseCase.execute(
      username: username,
      password: password,
      emailAddress: email,
    );

    setState(() {
      _isLoading = false;
    });

    if (response) {
      showSuccessAndNavigateToLogin();

    } else {
      throwError();
    }
  }

  void showSuccessAndNavigateToLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration successful! Please log in.')),
    );
    context.router.replaceAll([
      const LoginRoute(),
    ]);
  }

  void throwError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration failed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _registerUser,
              child:
                  _isLoading ? CircularProgressIndicator() : Text('Register'),
            ),
            if (_error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _error,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
