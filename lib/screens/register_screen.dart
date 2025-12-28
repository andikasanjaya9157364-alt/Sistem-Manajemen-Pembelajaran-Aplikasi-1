import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _handleRegister() {
    // Implement registration logic here
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardScreen(userRole: 'Student')),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const LoginScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Header height matches login screen
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
                          border: Border.all(color: CeLOETheme.primaryColor, width: 2),
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
                   // Masuk Tab (Inactive)
                   GestureDetector(
                     onTap: _navigateToLogin,
                     child: Column(
                       children: [
                         Row(
                           children: const [
                             Icon(Icons.login, color: Colors.grey, size: 20),
                             SizedBox(width: 8),
                             Text('Masuk', style: TextStyle(
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
                   ),
                   const SizedBox(width: 40),
                   // Daftar Tab (Active)
                   Column(
                     children: [
                       Row(
                         children: const [
                           Icon(Icons.person_add_outlined, color: Color(0xFF03A9F4), size: 20),
                           SizedBox(width: 8),
                           Text('Daftar', style: TextStyle(
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
                    'Daftar',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Nama Lengkap
                  const Text('Nama Lengkap', 
                    style: TextStyle(color: Colors.grey, fontSize: 14)
                  ),
                  TextFormField(
                    controller: _nameController,
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

                  // Email
                  const Text('Email', 
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

                  // Password
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
                  
                  const SizedBox(height: 24),

                  // Ulangi Password
                  const Text('Ulangi Password', 
                     style: TextStyle(color: Colors.grey, fontSize: 14)
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
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
                          _isConfirmPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                              color: Colors.black54,
                              size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF03A9F4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      child: const Text('Daftar', 
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
