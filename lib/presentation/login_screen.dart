import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/domain/usecase/login_use_case.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _error = '';

  void _loginUser() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    LoginUseCase loginUseCase = LoginUseCase();
    final response = await loginUseCase.execute(
      username: _usernameEmailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (response) {
      navigateToHome();
    } else {
      throwError();
    }
  }

  void navigateToHome() {
    context.router.replaceAll([
      const HomeRoute(),
    ]);
  }

  void throwError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed:')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(36.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Story Diaries",
                  style: TextStyle(
                    fontSize: 46.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 256.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameEmailController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _loginUser,
                  child: _isLoading ? CircularProgressIndicator() : Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(RegistrationRoute());
                  },
                  child: Text('Register new user'),
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
        ),
      ),
    );
  }
}
