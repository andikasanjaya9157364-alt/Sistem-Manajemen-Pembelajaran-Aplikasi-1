import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'my_courses_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'course_detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:learning_management_system/screens/announcements_screen.dart';
import 'package:learning_management_system/screens/assignment_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userRole;
  
  const DashboardScreen({super.key, required this.userRole});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Course data reused for the Home tab summary


  /* 
     We will define the pages here. 
     Note that we are creating a method for the Home content to keep the build method clean,
     and reusing the new MyCoursesScreen for index 1.
  */

  XFile? _profileImage; // Stores selected profile image (XFile is web-ready)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of widgets for proper state switching
    // Index 0: Home (Custom method below)
    // Index 1: MyCoursesScreen
    // Index 2: Notifications Placeholder
    final List<Widget> pages = [
      _buildHomeContent(),
      const MyCoursesScreen(),
      const NotificationsScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      // We only show the custom AppBar if we are on the Home screen (Index 0).
      // MyCoursesScreen has its own AppBar.
      appBar: _selectedIndex == 0 ? AppBar(
        backgroundColor: CeLOETheme.primaryColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hallo,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'ANDIKA PRATAMA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10, bottom: 10),
            child: GestureDetector(
              onTap: () async {
                 // Navigate to Profile and wait for result (new image)
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(currentImage: _profileImage),
                  ),
                );

                // If a new image was returned, update state
                if (result != null && result is XFile) {
                   setState(() {
                     _profileImage = result;
                   });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF03A9F4), // Theme Blue
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Text(
                      'MAHASISWA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 16,
                       backgroundColor: Colors.white24,
                       backgroundImage: _profileImage != null 
                          ? (kIsWeb 
                              ? NetworkImage(_profileImage!.path) 
                              : AssetImage(_profileImage!.path)) as ImageProvider 
                          : const AssetImage('assets/images/user_avatar.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ) : null, // Null AppBar for other tabs to let them define their own
      
      body: pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), 
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CeLOETheme.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
      ),
    );
  }

  // Extracted Home Content
  Widget _buildHomeContent() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upcoming Assignments Card
              const Text(
                'Tugas Yang Akan Datang',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AssignmentDetailScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF03A9F4), // Theme Blue
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Tugas 11 - UID Android Mobile Game',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Waktu Pengumpulan',
                        style: TextStyle(
                           color: Colors.white70,
                           fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jumat, 14 Februari, 12:00 AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Announcements Banner
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text(
                    'Pengumuman Terakhir',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnnouncementsScreen()),
                      );
                    }, 
                    child: const Text('selengkapnya', 
                      style: TextStyle(color: Colors.blue, fontSize: 12)
                    )
                  ),
                 ],
               ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/announcement_banner.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  'Maintenance Pra UAS Semester Genap 2020/2021',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              
              // Course Progress List
              const Text(
                'Progres Kelas',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              
              // List Mock Data
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                   _buildCourseProgressItem('ui_ux', 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA (D4SM-41-GAB1)', 0.7),
                   _buildCourseProgressItem('pancasila', 'KEWARGANEGARAAN (D4SM-41-GAB1 [BBR]) - JUMAT 2', 0.5),
                   _buildCourseProgressItem('system', 'SISTEM OPERASI (D4SM-44-01 [CY])', 0.9),
                   _buildCourseProgressItem('blue_poly', 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA (D4SM-41-GAB1)', 0.85),
                   _buildCourseProgressItem('gray_poly', 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC (D4SM-41-GAB1)', 0.75),
                   _buildCourseProgressItem('blue_pattern', 'PEMROGRAMAN MULTIMEDIA INTERAKTIF (D4SM-41-04 [TPI])', 0.6),
                   _buildCourseProgressItem('purple_poly', 'OLAH RAGA (DTT-44-01 [CY])', 0.8),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
    );
  }

  Widget _buildCourseProgressItem(String styleType, String title, double progress) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailScreen(
              title: title,
              code: 'D4SM-44-01-GAB', // Mock code for dashboard items
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStyledIcon(styleType),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2020',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 6,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF03A9F4)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${(progress * 13).toInt()} / 13 Bahan', 
                        style: const TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStyledIcon(String type) {
    BoxDecoration decoration;
    Widget? child;

    switch (type) {
      case 'ui_ux':
        decoration = const BoxDecoration(color: Color(0xFF4FC3F7)); 
        child = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/course_uiux.png', fit: BoxFit.cover),
        );
        break;
      case 'pancasila':
        decoration = const BoxDecoration(color: Color(0xFF03A9F4)); // Blue
        child = const Center(child: Icon(Icons.security, color: Colors.amber, size: 30)); // Garuda placeholder
        break;
      case 'system':
        decoration = BoxDecoration(color: Colors.grey[200]);
        child = const Center(child: Text('System', style: TextStyle(color: CeLOETheme.primaryColor, fontWeight: FontWeight.bold)));
        break;
      case 'blue_poly':
        decoration = const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)], begin: Alignment.topLeft, end: Alignment.bottomRight)
        );
        break;
      case 'gray_poly':
        decoration = BoxDecoration(color: Colors.grey[300]);
        break;
      case 'blue_pattern':
        decoration = const BoxDecoration(color: Color(0xFF1976D2));
        child = const Icon(Icons.grid_view, color: Colors.white24, size: 40);
        break;
      case 'purple_poly':
        decoration = const BoxDecoration(color: Color(0xFF7E57C2));
        break;
      default:
        decoration = const BoxDecoration(color: Colors.grey);
    }

    return Container(
      width: 60,
      height: 60,
      decoration: decoration.copyWith(borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }

}
