import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  final List<Map<String, String>> _announcements = const [
    {
      'title': 'Maintenance Pra UAS Semester Genap 2020/2021',
      'subtitle': 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
    },
    {
      'title': 'Pengumuman Maintance',
      'subtitle': 'By Admin Celoe - Senin, 11 Januari 2021, 7:52',
    },
    {
      'title': 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
      'subtitle': 'By Admin Celoe - Minggu, 10 Januari 2021, 9:30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: _announcements.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final item = _announcements[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.campaign, color: Colors.black, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['subtitle']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
