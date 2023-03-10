import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: child),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-10, 0),
                      blurRadius: 40,
                      color: Colors.black.withOpacity(.08))
                ],
              ),
              child: Image.asset('assets/images/login_picture.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
    this.authType = AuthType.signup,
  });

  final AuthType authType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            authType == AuthType.signup ? 'Sign up' : 'Log in',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 24),
          child: Column(
            children: [
              if (authType == AuthType.login)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              if (authType == AuthType.login) const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(height: 20),
              const PasswordTextField(),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password?'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {
                  context.go('/');
                },
                child: Text(authType == AuthType.signup ? 'SIGN UP' : 'LOG IN'),
              ),
              const SizedBox(height: 20),
              CustomTextSpan(
                firstText: authType == AuthType.signup
                    ? "Don't have an account?"
                    : 'Already have an account?',
                secondText: authType == AuthType.signup ? 'Sign up' : 'Log in',
                onPressed: () {
                  if (authType == AuthType.signup) {
                    context.go('/login');
                  } else {
                    context.go('/signup');
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    return StatefulBuilder(builder: (context, setState) {
      return TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              obscureText = !obscureText;
              setState(() {});
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      );
    });
  }
}

class CustomTextSpan extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function()? onPressed;
  const CustomTextSpan(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondText,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

enum AuthType { signup, login }
