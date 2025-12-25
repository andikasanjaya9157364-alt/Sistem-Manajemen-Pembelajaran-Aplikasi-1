import 'package:flutter/material.dart';



class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {
      'message': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': 'Jumat, 9 Jan Yang Lalu',
      'icon': Icons.description_outlined,
    },
    {
      'message': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': 'Jumat, 9 Jan Yang Lalu',
      'icon': Icons.description_outlined,
    },
    {
      'message': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': 'Jumat, 9 Jan Yang Lalu',
      'icon': Icons.description_outlined,
    },
    {
      'message': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': 'Jumat, 9 Jan Yang Lalu',
      'icon': Icons.description_outlined,
    },
     {
      'message': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': 'Jumat, 9 Jan Yang Lalu',
      'icon': Icons.description_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(notif['icon'], color: Colors.grey[700], size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notif['message'],
                      style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notif['time'],
                      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
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
