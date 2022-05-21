import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartsaver/src/views/dashboard.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final isTab = maxWidth >= 769;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: isTab ? maxWidth * 0.3 : double.infinity,
            constraints: BoxConstraints(minHeight: maxHeight),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Heading Image
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: SvgPicture.asset(
                    'images/login.svg',
                    height: isTab ? maxWidth * 0.12 : maxWidth * 0.4,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // Heading Text
                Text(
                  'Hello there!',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Enter your credentials below to login',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 40,
                ),
                // Email Field
                Container(
                  width: maxWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(double.infinity),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Password Field
                Container(
                  width: maxWidth * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: maxWidth * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add user login api call
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Dashboard.routeName, (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
