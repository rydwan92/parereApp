import 'package:flutter/material.dart';
import '../../services/auth_api.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      bool success = await AuthApi.register(
        emailController.text,
        passwordController.text,
      );

      setState(() => isLoading = false);

      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rejestracja nie powiodła się')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rejestracja')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Podaj email' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Hasło'),
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Minimum 6 znaków' : null,
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                child: Text('Zarejestruj się'),
                onPressed: register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
