import 'package:flutter/material.dart';

import 'package:learning_management_system/screens/course_detail_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  final List<Map<String, dynamic>> _courses = const [
    {
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA (UI/UX)', 
      'code': 'D4SM-44-03 [GAB]',
      'progress': 0.85, 
      'image': 'assets/images/book_ui_ux.png',
    },
    {
      'title': 'KEWARGANEGARAAN', 
      'code': 'D4SM-44-02 [GAB], JUMAT 2',
      'progress': 0.65, 
      'image': 'assets/images/book_civics.png',
    },
    {
      'title': 'SISTEM OPERASI', 
      'code': 'D4SM-44-07 [DDS]',
      'progress': 0.50, 
      'image': 'assets/images/book_os.png',
    },
    {
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 
      'code': 'D4SM-44-03 [APJ]',
      'progress': 0.30, 
      'image': 'assets/images/book_mobile_dev.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             // Navigation logic
          },
        ),
        title: const Text('Kelas Saya', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _courses.length,
        itemBuilder: (context, index) {
          final course = _courses[index];
          return GestureDetector(
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    title: course['title'],
                    code: course['code'],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Thumbnail Information
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      course['image'],
                      width: 70, // Slightly smaller to match book ratio usually
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // 2. Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2024/2', 
                          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          course['code'],
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        // Progress Bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: course['progress'],
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF03A9F4)), // Theme Blue
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${(course['progress'] * 100).toInt()}% Selesai',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
