import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:elite_edge_labs/Services/auth_services.dart';
import 'package:elite_edge_labs/Utils/components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldData.buildField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => (value ?? "").length.isEqual(0)
                    ? "Email Cant Be Empty"
                    : ((value ?? "").contains("@") &&
                            (value ?? "").contains("."))
                        ? null
                        : "Enter a Valid Email",
                keyboardType: TextInputType.text,
                controller: _emailcontroller,
                label: const Text("Email Address"),
              ),
              const Gap(10),
              TextFieldData.buildField(
                obscureText: _isPasswordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => (value ?? "").length.isEqual(0)
                    ? "Password Can't Be Empty"
                    : (value ?? "").length.isLowerThan(6)
                        ? "Password length is too short"
                        : null,
                keyboardType: TextInputType.text,
                controller: _passwordcontroller,
                label: const Text("Password"),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.lock_open : Icons.lock,
                    color: Colors.grey,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration.zero, () async {
                    await AuthService()
                        .signInWithEmailAndPassword(
                      email: _emailcontroller.text,
                      password: _passwordcontroller.text,
                    )
                        .catchError((onError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(onError.toString())));
                    });
                  });
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
