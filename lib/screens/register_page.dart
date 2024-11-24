import 'package:flutter/material.dart';
import 'package:testing_project/models/newFun.dart';
import 'package:testing_project/screens/home_page.dart';
import 'package:testing_project/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, GlobalKey<FormState>? formKey});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform any UI updates or initialization here
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(
              context: context,
              widget: LoginPage(formKey: GlobalKey()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.grey,
      resizeToAvoidBottomInset: true, // Adjust layout when keyboard is shown
      body: SingleChildScrollView(
        // Make content scrollable
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/th (1).png'),
                const SizedBox(height: 16),
                const Text(
                  'Please sign up now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 54, 65, 132),
                  ),
                ),
                const SizedBox(height: 20),
                _buildNameField(),
                const SizedBox(height: 10),
                _buildEmailField(),
                const SizedBox(height: 10),
                _buildPasswordField(),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    fixedSize: const Size(100, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Registration Successful!')),
                      );
                      navigateReplacement(
                        context: context,
                        widget: const HomePage(),
                      );
                    }
                  },
                  child: const Text('Done'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
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
        prefixIcon: const Icon(Icons.person, size: 30),
        hintText: 'Enter your name',
        labelText: 'Full Name',
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
        labelStyle: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 0, 63, 114)),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!value.contains('@gmail.com')) {
          return 'Email must end with @gmail.com';
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
      controller: passwordController,
      obscureText: !isPasswordVisible,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
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
        prefixIcon: const Icon(Icons.lock, size: 20, color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        hintText: 'Password',
        labelText: 'Password',
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
        labelStyle: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 0, 63, 114)),
      ),
    );
  }
}
