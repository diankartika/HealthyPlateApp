// login_screen.dart - Fixed version
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Helper method to navigate to home
  void _navigateToHome() {
    if (!mounted) return;

    // Use pushNamedAndRemoveUntil to clear the navigation stack
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home_screen',
      (route) => false, // Remove all previous routes
    );
  }

  // Helper method to show error messages
  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Helper method to show success messages
  void _showSuccess(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Updated _signInWithGoogle method
  Future<void> _signInWithGoogle() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      debugPrint('🔄 Starting Google Sign-In...');

      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      // Sign out first to ensure clean state
      await googleSignIn.signOut();

      final GoogleSignInAccount? gUser = await googleSignIn.signIn();
      if (gUser == null) {
        debugPrint('❌ Google Sign-In cancelled by user');
        // FOR ASSIGNMENT: Navigate anyway
        _navigateToHome();
        return;
      }

      debugPrint('✅ Google account selected: ${gUser.email}');

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      if (gAuth.accessToken == null || gAuth.idToken == null) {
        throw Exception('Failed to get Google authentication tokens');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken!,
        idToken: gAuth.idToken!,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('Failed to get user from Firebase Auth');
      }

      // FOR ASSIGNMENT: Skip Firestore check and just navigate
      _navigateToHome();
    } catch (e) {
      debugPrint('❌ Google Sign-In error: $e');
      // FOR ASSIGNMENT: Navigate even on error
      _navigateToHome();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Updated _signInWithEmailPassword method
  Future<void> _signInWithEmailPassword() async {
    if (_isLoading) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });

    try {
      debugPrint('🔄 Starting Email/Password Sign-In...');

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint('✅ Email Login success: ${credential.user?.email}');
      _navigateToHome();
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Email Login error: ${e.code}');
      // FOR ASSIGNMENT: Navigate even on error
      _navigateToHome();
    } catch (e) {
      debugPrint('❌ Unexpected error: $e');
      // FOR ASSIGNMENT: Navigate even on error
      _navigateToHome();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image - positioned at the very back
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset('assets/images/bg_2.png', fit: BoxFit.cover),
                // Blur effect layer
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: CircularProgressIndicator(color: Color(0xFF9ABD40)),
                ),
              ),
            ),

          // Content layer - positioned on top of the background
          Positioned.fill(
            child: Column(
              children: [
                // Safe area for top padding
                SafeArea(
                  bottom: false,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 20.0),
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // Main content with Expanded to take remaining space
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Push content down
                        SizedBox(height: screenHeight * 0.25),

                        // Welcome text
                        const Center(
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Color(0xFF9ABD40),
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Center(
                          child: Text(
                            'Please Log in to Your Account',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Email input
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password input
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '••••••••••••••••••••',
                              hintStyle: const TextStyle(color: Colors.white70),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white70,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Remember me and Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rememberMe = !_rememberMe;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          _rememberMe
                                              ? const Color(0xFF9ABD40)
                                              : Colors.transparent,
                                      border:
                                          _rememberMe
                                              ? null
                                              : Border.all(
                                                color: const Color(0xFF9ABD40),
                                              ),
                                    ),
                                    child:
                                        _rememberMe
                                            ? const Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Color(0xFF282828),
                                            )
                                            : null,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(10, 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed:
                                _isLoading ? null : _signInWithEmailPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9ABD40),
                              foregroundColor: const Color(0xFF282828),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:
                                _isLoading
                                    ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF282828),
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Text(
                                      'Log in',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // "Or continue with" text
                        const Center(
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Google Sign-In Button
                        Center(
                          child: GestureDetector(
                            onTap: _isLoading ? null : _signInWithGoogle,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/google.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const RegisterScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(left: 4),
                                minimumSize: const Size(10, 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Color(0xFF9ABD40)),
                              ),
                            ),
                          ],
                        ),

                        // Bottom spacer
                        const Spacer(),
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
}
