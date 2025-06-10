import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Updated _signInWithGoogle method with better error handling and debugging

  Future<void> _signInWithGoogle() async {
    try {
      print('🔄 Starting Google Sign-In process...');

      // Initialize GoogleSignIn - remove explicit scopes if causing issues
      final GoogleSignIn googleSignIn = GoogleSignIn(
        // Try without scopes first
        // scopes: ['email'], // Comment this out temporarily
      );

      // Sign out first to ensure clean state
      await googleSignIn.signOut();
      print('✅ Signed out from previous session');

      // Trigger the authentication flow
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      if (gUser == null) {
        print('❌ Google Sign-In cancelled by user');
        return;
      }

      print('✅ Google account selected: ${gUser.email}');

      // Obtain the auth details from the request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      print(
        '🔍 Access Token: ${gAuth.accessToken != null ? "Present" : "Missing"}',
      );
      print('🔍 ID Token: ${gAuth.idToken != null ? "Present" : "Missing"}');

      if (gAuth.accessToken == null || gAuth.idToken == null) {
        throw Exception('Failed to get Google authentication tokens');
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken!,
        idToken: gAuth.idToken!,
      );

      print('✅ Firebase credential created');

      // Sign in to Firebase with the Google credential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to get user from Firebase Auth');
      }

      print('✅ Firebase Auth successful: ${user.email}');

      // Check if user document exists in Firestore
      final userDoc =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();

      // Create user document if it doesn't exist
      if (!userDoc.exists) {
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "email": user.email ?? '',
          "name": user.displayName ?? '',
          "photoURL": user.photoURL ?? '',
          "createdAt": Timestamp.now(),
          "loginMethod": "google",
        });
        print('✅ New user document created in Firestore');
      } else {
        print('✅ Existing user found in Firestore');
      }

      if (!mounted) return;

      print('✅ Google Sign-In complete, navigating to home...');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      print('❌ Google Sign-In error details: $e');
      print('❌ Error type: ${e.runtimeType}');

      if (!mounted) return;

      String errorMessage = 'Google Sign-In failed';

      // More specific error handling
      if (e is FirebaseAuthException) {
        print('❌ Firebase Auth Error Code: ${e.code}');
        print('❌ Firebase Auth Error Message: ${e.message}');

        switch (e.code) {
          case 'account-exists-with-different-credential':
            errorMessage =
                'An account already exists with a different sign-in method.';
            break;
          case 'invalid-credential':
            errorMessage = 'The credential is invalid or has expired.';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Google Sign-In is not enabled in Firebase Console.';
            break;
          case 'user-disabled':
            errorMessage = 'This user account has been disabled.';
            break;
          default:
            errorMessage = 'Firebase Auth error: ${e.message}';
        }
      } else if (e.toString().contains('network_error')) {
        errorMessage = 'Network error. Please check your internet connection.';
      } else if (e.toString().contains('sign_in_canceled')) {
        errorMessage = 'Sign-in was cancelled.';
      } else if (e.toString().contains('sign_in_failed')) {
        errorMessage = 'Sign-in failed. Please try again.';
      } else if (e.toString().contains('PlatformException')) {
        errorMessage =
            'Platform error. Please check your Google Services configuration.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset('assets/images/bg_2.png', fit: BoxFit.cover),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 16.0),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF9ABD40),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Color(0xFF282828),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.1),
                        const Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFF9ABD40),
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create your new account',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 32),

                        // Email
                        _buildInputField(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 16),

                        // Password
                        _buildInputField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.lock,
                          isPassword: true,
                          obscureText: _obscurePassword,
                          onToggleObscure: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        const SizedBox(height: 32),

                        // Sign Up button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );

                                // Create user document in Firestore
                                final user = credential.user;
                                if (user != null) {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(user.uid)
                                      .set({
                                        "uid": user.uid,
                                        "email": user.email ?? '',
                                        "name": '',
                                        "photoURL": '',
                                        "createdAt": Timestamp.now(),
                                        "loginMethod": "email",
                                      });
                                }

                                if (!mounted) return;
                                Navigator.pop(context);
                              } on FirebaseAuthException catch (e) {
                                String errorMessage = 'Registration failed';

                                if (e.code == 'weak-password') {
                                  errorMessage =
                                      'The password provided is too weak.';
                                } else if (e.code == 'email-already-in-use') {
                                  errorMessage =
                                      'The account already exists for that email.';
                                } else if (e.code == 'invalid-email') {
                                  errorMessage =
                                      'The email address is not valid.';
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9ABD40),
                              foregroundColor: const Color(0xFF282828),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        const Center(
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Google only
                        Center(
                          child: GestureDetector(
                            onTap: _signInWithGoogle,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/google.png', // pastikan ada file ini
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),

                        // Back to login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Color(0xFF9ABD40)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleObscure,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscureText : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: Colors.white70),
          suffixIcon:
              isPassword
                  ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: onToggleObscure,
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
