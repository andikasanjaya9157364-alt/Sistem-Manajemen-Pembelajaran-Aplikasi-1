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
    // Simple role logic
    if (_emailController.text.toLowerCase().contains('dosen')) {
      role = 'Teacher';
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => DashboardScreen(userRole: role)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Header height
    const double headerHeight = 240;
    const double logoSize = 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: headerHeight + (logoSize / 2),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // 1. Header Image with Curve
                  ClipPath(
                    clipper: ConvexHeaderClipper(),
                    child: Container(
                      height: headerHeight,
                      width: double.infinity,
                      color: CeLOETheme.primaryColor,
                      child: Image.asset(
                        'assets/images/header_gku.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  
                  // 2. Circular Logo Overlapping
                  Positioned(
                    bottom: 0, 
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: logoSize,
                        height: logoSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          border: Border.all(color: CeLOETheme.primaryColor, width: 2), // Theme color border
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/logo_smk_assalam.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 3. Masuk / Daftar Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Column(
                     children: [
                       Row(
                         children: const [
                           Icon(Icons.login, color: Color(0xFF03A9F4), size: 20),
                           SizedBox(width: 8),
                           Text('Masuk', style: TextStyle(
                             fontSize: 16, 
                             fontWeight: FontWeight.bold,
                             color: Color(0xFF03A9F4)
                           )),
                         ],
                       ),
                       const SizedBox(height: 8),
                       Container(height: 2, width: 80, color: const Color(0xFF03A9F4))
                     ],
                   ),
                   const SizedBox(width: 40),
                   Column(
                     children: [
                       Row(
                         children: const [
                           Icon(Icons.person_add_outlined, color: Colors.grey, size: 20),
                           SizedBox(width: 8),
                           Text('Daftar', style: TextStyle(
                             fontSize: 16, 
                             fontWeight: FontWeight.bold, 
                             color: Colors.grey
                           )),
                         ],
                       ),
                       const SizedBox(height: 8),
                       Container(height: 2, width: 80, color: Colors.transparent)
                     ],
                   ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email / NPM Input
                  const Text('Email / NPM', 
                    style: TextStyle(color: Colors.grey, fontSize: 14)
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CeLOETheme.primaryColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Password Input
                  const Text('Password', 
                     style: TextStyle(color: Colors.grey, fontSize: 14)
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: CeLOETheme.primaryColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      isDense: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                              color: Colors.black54,
                              size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){}, 
                      child: const Text('Lupa Password?',
                        style: TextStyle(color: Color(0xFF03A9F4), fontWeight: FontWeight.bold)
                      )
                    ),
                  ),
                  
                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF03A9F4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      child: const Text('Masuk', 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Bantuan footer
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Convex Curve (Curves Downward) matches the "Kampus Lima Menara" screenshot
class ConvexHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2, 
      size.height + 40, // Control point below the edge
      size.width, 
      size.height - 40
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
