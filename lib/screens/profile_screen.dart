import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profil Pengguna', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: CeLOETheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header with Overlapping Card
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Maroon Background
                Container(
                  height: 140,
                  width: double.infinity,
                  color: CeLOETheme.primaryColor,
                ),
                
                // Profile Image & Name
                Positioned(
                  top: 10,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/header_gku.png'), // Placeholder or use a specific avatar asset
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'DANDY CANDRA PRATAMA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating Card (Tabs)
                Container(
                  margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabItem('About Me', isActive: true),
                      _buildTabItem('Kelas', isActive: false),
                      _buildTabItem('Edit Profile', isActive: false),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24), // Space for the floating card overlap

            // 2. User Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Email address', 'dandycandrap@365.telkomuniversity.ac.id'),
                  const Divider(height: 24),
                  _buildInfoRow('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
                  const Divider(height: 24),
                  _buildInfoRow('Fakultas', 'FIT'),
                  
                  const SizedBox(height: 32),
                  
                  const Text(
                    'Aktivitas Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('First access to site', 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)'),
                  const Divider(height: 24),
                  _buildInfoRow('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM (now)'),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, {required bool isActive}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black : Colors.grey,
            fontSize: 13,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 40,
            color: Colors.black, // Active indicator
          ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}
