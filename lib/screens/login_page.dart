import 'package:flutter/material.dart';
import 'package:testing_project/models/newFun.dart';
import 'package:testing_project/screens/home_page.dart';
import 'package:testing_project/screens/onboarding_page.dart';
import 'package:testing_project/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key, required GlobalKey<State<StatefulWidget>> formKey});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform any UI updates or initialization here
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/th1.png'),
                  const SizedBox(height: 20),
                  const Text(
                    'Please login to your account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 54, 65, 132),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildEmailField(),
                  const SizedBox(height: 10),
                  _buildPasswordField(),
                  const SizedBox(height: 20),
                  _buildLoginButton(),
                  const SizedBox(height: 20),
                  _buildRegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (!value!.contains('@gmail.com')) {
          return 'email not valid';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.email_outlined, size: 30),
        hintText: 'Email',
        labelText: 'E-mail',
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
        labelStyle: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 0, 63, 114)),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      obscureText: !isVisibility,
      keyboardType: TextInputType.text,
      controller: passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isVisibility = !isVisibility;
            });
          },
          icon: Icon(isVisibility ? Icons.visibility : Icons.visibility_off),
        ),
        hintText: 'Password',
        labelText: 'Password',
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
        labelStyle: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 0, 63, 114)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2196F3),
        fixedSize: const Size(100, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // تحقق من إدخال الحقول
          if (emailController.text == "@gmail.com") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid credentials')),
            );
          }
        }
      },
      child: const Text('Login'),
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: () {
        navigateReplacement(context: context, widget: const RegisterPage());
      },
      child: const Text('Register'),
    );
  }
}
