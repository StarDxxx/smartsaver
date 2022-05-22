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
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add user login api call
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Dashboard.routeName, (route) => false);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
