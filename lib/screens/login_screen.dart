import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _handleLogin() {
    String role = 'Student';
    if (_emailController.text.toLowerCase().contains('dosen')) {
      role = 'Teacher';
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => DashboardScreen(userRole: role)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Header Image with Custom Curve
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 320,
                  width: double.infinity,
                  color: CeLOETheme.primaryColor, // Fallback color
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        'assets/images/logo_smk_assalam.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Email Input
                      const Text('Email 365', 
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16)
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: '',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CeLOETheme.primaryColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CeLOETheme.primaryColor, width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          isDense: true,
                          filled: false,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Password Input
                      const Text('Password', 
                         style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16)
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: CeLOETheme.primaryColor, width: 2),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: CeLOETheme.primaryColor, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          isDense: true,
                          filled: false,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                                  color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB71C1C), // Specific deep red
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                          child: const Text('Log In', 
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Bantuan ?',
                            style: TextStyle(
                              color: Color(0xFFB71C1C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                       const SizedBox(height: 100), // Space for bottom wave
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Bottom Wave
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: FooterClipper(),
              child: Container(
                height: 150,
                color: const Color(0xFFB71C1C).withOpacity(0.8), // Semi-transparent red
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    // Create a gentle upward curve/slope
    path.quadraticBezierTo(
      size.width / 4, 
      size.height, 
      size.width, 
      size.height - 80
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 50);
    path.quadraticBezierTo(
      size.width / 2, 
      -50, // Control point above for the wave crest
      size.width, 
      60   // End point
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
