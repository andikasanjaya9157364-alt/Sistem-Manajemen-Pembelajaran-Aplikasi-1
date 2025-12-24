import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  final List<Map<String, dynamic>> _courses = const [
    {
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA (UI/UX)', 
      'code': 'D4SM-44-03 [GAB]',
      'progress': 0.85, 
      'color': Colors.amber, 
      'icon': 'UI\nUX'
    },
    {
      'title': 'KEWARGANEGARAAN', 
      'code': 'D4SM-44-02 [GAB], JUMAT 2',
      'progress': 0.65, 
      'color': Colors.redAccent, 
      'icon': 'Pancasila'
    },
    {
      'title': 'SISTEM OPERASI', 
      'code': 'D4SM-44-07 [DDS]',
      'progress': 0.50, 
      'color': Colors.blueGrey, 
      'icon': 'System'
    },
    {
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 
      'code': 'D4SM-44-03 [APJ]',
      'progress': 0.30, 
      'color': Colors.cyan, 
      'icon': 'Mobile'
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
             // In a real app with navigation stack, this would look different.
             // Since this is a tab, maybe it shouldn't have a back button, 
             // but the design shows one. We'll leave it but maybe it switches tab?
             // For now, let's just keep it visual.
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
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Thumbnail (Placeholder)
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: course['color'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    course['icon'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // 2. Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2024/2', // Hardcoded semester based on reference
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
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB71C1C)), // Deep Red
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
          );
        },
      ),
    );
  }
}
