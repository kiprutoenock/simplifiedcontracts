import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walop/ui/routes/routes.dart';
import 'package:walop/ui/widgets/custombutton.dart';

bool obscure = true; // initially password text is hidden

class Startscreen extends StatelessWidget {
  const Startscreen({Key? key}) : super(key: key);

  void _showLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final themecolors = Theme.of(context).colorScheme;

        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Login to continue',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: themecolors.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black45),
                    floatingLabelStyle: TextStyle(color: themecolors.primary),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(66, 99, 99, 99),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: themecolors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                StatefulBuilder(
                  builder: (context, setState) {
                    return TextField(
                      obscureText: obscure,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black45),
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(66, 99, 99, 99),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey.shade600,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() => obscure = !obscure);
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: themecolors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: "Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  filled: true,
                  textColor: Colors.white,
                  borderRadius: 30,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR", style: TextStyle(color: Colors.black54)),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.google,
                            color: Colors.red, size: 18),
                        label: const Text(
                          "Google",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black26),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.facebookF,
                            color: Color(0xFF1877F2), size: 18),
                        label: const Text(
                          "Facebook",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black26),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: themecolors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Replace with your 5 wallpaper URLs
    const imageUrls = [
      'https://images.unsplash.com/photo-1597245352123-2a94f9c74729?auto=format&fit=crop&w=987&q=80',
      'https://images.unsplash.com/photo-1658345542617-63c9fee8a2e3?auto=format&fit=crop&w=987&q=80',
      'https://images.unsplash.com/photo-1596466214153-0c775ca72e03?auto=format&fit=crop&w=987&q=80',
      'https://images.unsplash.com/photo-1665830403042-e156463f8f58?auto=format&fit=crop&w=987&q=80',
      'https://images.unsplash.com/photo-1652418365134-7991f0e1744b?auto=format&fit=crop&w=987&q=80',
    ];

    // Pick one image at random each launch
    final random = Random();
    final imageUrl = imageUrls[random.nextInt(imageUrls.length)];

    final themecolors = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 3),
            child: Container(color: Colors.transparent),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 190),
                  Text(
                    'Welcome to Walop',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Browse & Download Amazing Phone Wallpapers For FREE. Available in HD & 4K Resolutions.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 180),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: "Login",
                      onPressed: () => _showLoginSheet(context),
                      filled: true,
                      textColor: Colors.white,
                      borderRadius: 30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: "Continue as guest",
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.home);
                      },
                      textColor: Colors.black,
                      filled: true,
                      borderRadius: 30,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 34),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Learn more about Walop App',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
