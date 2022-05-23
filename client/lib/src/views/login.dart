import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartsaver/src/utils/messenger.dart';
import 'package:smartsaver/src/views/dashboard.dart';

import '../gql/auth.graphql.dart';
import '../providers/auth.dart';

class Login extends ConsumerStatefulWidget {
  static const routeName = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  bool isLoading = false;

  void toggleLoading() => setState(() {
        isLoading = !isLoading;
      });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final isTab = maxWidth >= 769;

    void login(String email, String password) async {
      try {
        toggleLoading();
        await ref.read(authStateProvider.notifier).login(
              Variables$Mutation$Login(
                email: email,
                password: password,
              ),
            );

        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
      } catch (e) {
        toggleLoading();
        showMessenger(
          context,
          message: "$e",
          type: MessageType.error,
        );
        return null;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: isTab ? maxWidth * 0.6 : double.infinity,
              constraints: BoxConstraints(minHeight: maxHeight, maxWidth: 620),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Heading Image
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: SvgPicture.asset(
                      'images/login.svg',
                      height: isTab ? maxWidth * 0.12 : maxWidth * 0.4,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  // Heading Text
                  Text(
                    'Hello there!',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Enter your credentials below to login',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Email Field
                  Container(
                    width: maxWidth * 0.9,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      enabled: !isLoading,
                      enableSuggestions: true,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Password Field
                  Container(
                    width: maxWidth * 0.9,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      enabled: !isLoading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              // Basic validation
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                login(email.trim(), password.trim());
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          isLoading ? 'LOGGING IN...' : 'LOGIN',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
