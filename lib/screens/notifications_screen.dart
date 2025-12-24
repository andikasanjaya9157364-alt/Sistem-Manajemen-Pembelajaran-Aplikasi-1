import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'notification_detail_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {
      'title': 'Tugas Segera Tenggat',
      'message': 'Tugas "UID Android Mobile Game" akan tenggat dalam 2 hari.',
      'time': '2 Jam yang lalu',
      'type': 'assignment',
    },
    {
      'title': 'Materi Baru',
      'message': 'Materi "Minggu 4: Thread & Process" ditambahkan di Sistem Operasi.',
      'time': '5 Jam yang lalu',
      'type': 'material',
    },
    {
      'title': 'Pengumuman Penting',
      'message': 'Maintenance Server akan dilakukan pada tgl 25 Des.',
      'time': '1 Hari yang lalu',
      'type': 'system',
    },
    {
      'title': 'Presensi Dibuka',
      'message': 'Presensi untuk mata kuliah "Kewarganegaraan" telah dibuka.',
      'time': '1 Hari yang lalu',
      'type': 'attendance',
    },
     {
      'title': 'Nilai Keluar',
      'message': 'Nilai Kuis 1 "Bahasa Inggris" telah dipublikasikan.',
      'time': '2 Hari yang lalu',
      'type': 'grade',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, 
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              leading: _buildIcon(notif['type']),
              title: Text(
                notif['title'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(notif['message'], style: TextStyle(fontSize: 13, color: Colors.grey[800])),
                  const SizedBox(height: 8),
                  Text(notif['time'], style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                ],
              ),
              isThreeLine: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              onTap: () {
                // Prepare data for detail screen
                final detailData = Map<String, dynamic>.from(notif);
                detailData['icon'] = _getIconData(notif['type']);
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetailScreen(notification: detailData),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  IconData _getIconData(String type) {
    switch (type) {
      case 'assignment': return Icons.assignment_late;
      case 'material': return Icons.book;
      case 'system': return Icons.warning_amber_rounded;
      case 'attendance': return Icons.access_time;
      case 'grade': return Icons.grade;
      default: return Icons.notifications;
    }
  }

  Widget _buildIcon(String type) {
    IconData iconData = _getIconData(type);
    Color color;

    switch (type) {
      case 'assignment': color = Colors.orange; break;
      case 'material': color = Colors.blue; break;
      case 'system': color = Colors.red; break;
      case 'attendance': color = Colors.green; break;
      case 'grade': color = Colors.purple; break;
      default: color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: color, size: 24),
    );
  }
}
