import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class NotificationDetailScreen extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationDetailScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Notifikasi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               children: [
                 Icon(notification['icon'], size: 40, color: CeLOETheme.primaryColor),
                 const SizedBox(width: 16),
                 Expanded(
                   child: Text(
                     notification['time'],
                     style: TextStyle(
                       color: Colors.grey[600],
                       fontSize: 14,
                       fontWeight: FontWeight.w500
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(height: 24),
             Text(
               notification['message'],
               style: const TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Colors.black87,
                 height: 1.5,
               ),
             ),
             const SizedBox(height: 32),
             Container(
               width: double.infinity,
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: Colors.grey[50],
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: Colors.grey[200]!),
               ),
               child: const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
                   SizedBox(height: 4),
                   Text('Berhasil Terkirim', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                   SizedBox(height: 16),
                   Text('Keterangan:', style: TextStyle(fontWeight: FontWeight.bold)),
                   SizedBox(height: 4),
                   Text('Tugas anda telah berhasil dikumpulkan ke sistem. Silahkan cek kembali file yang anda unggah jika diperlukan.', style: TextStyle(color: Colors.black54)),
                 ],
               ),
             ),
             const Spacer(),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () => Navigator.of(context).pop(),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: CeLOETheme.primaryColor,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                 ),
                 child: const Text('Kembali', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               ),
             ),
          ],
        ),
      ),
    );
  }
}
