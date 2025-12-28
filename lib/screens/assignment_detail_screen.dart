import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class AssignmentDetailScreen extends StatelessWidget {
  const AssignmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14, // Adjusted size to fit
          ),
        ),
        backgroundColor: const Color(0xFF03A9F4), // Theme Blue
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Text(
              'Tampilan Page Tugas',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
             const SizedBox(height: 20),
            
            // Description Text
            const Text(
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 12),
            const Text(
              '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
             const SizedBox(height: 12),
            const Text(
              '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
             const SizedBox(height: 12),
             const Text(
              '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
             const SizedBox(height: 12),
             const Text(
              '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.',
               style: TextStyle(fontSize: 13, height: 1.5),
            ),
             const SizedBox(height: 12),
             const Text(
              '6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),

            const SizedBox(height: 30),

            // Status Table
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                children: [
                  // Status Header
                   Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4FC3F7), // Lighter Blue
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: const Text(
                      'Status Tugas',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildStatusRow('Status', 'Sudah Mengirim untuk dinilai'),
                  const Divider(height: 1, color: Colors.grey),
                  _buildStatusRow('Status Nilai', 'Belum Di nilai'),
                  const Divider(height: 1, color: Colors.grey),
                  _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB'),
                  const Divider(height: 1, color: Colors.grey),
                  _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya'),
                  const Divider(height: 1, color: Colors.grey),
                  _buildStatusRow('File Tugas', 'Dandy Candra Pratama_770817084.pdf', isFile: true),
                ],
              ),
            ),

             const SizedBox(height: 40),

            // Button
            Center(
               child: ElevatedButton(
                 onPressed: () => _showUploadBottomSheet(context),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[200],
                   foregroundColor: Colors.black,
                   elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                 ),
                 child: const Text('Tambahkan Tugas', style: TextStyle(fontSize: 12)),
               ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isFile = false}) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.grey[50], // Very light background for rows
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             width: 120, // Fixed width for labels
             child: Text(
               label,
               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
             ),
           ),
           Expanded(
             child: isFile 
             ? Row(
               children: [
                 const Icon(Icons.picture_as_pdf, size: 16, color: Colors.grey),
                 const SizedBox(width: 8),
                 Expanded(
                   child: Text(
                      value, 
                      style: const TextStyle(fontSize: 12, color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                   ),
                 ),
               ],
             )
             : Text(
               value,
               style: const TextStyle(fontSize: 12, color: Colors.black87),
             ),
           ),
         ],
       ),
    );
  }

  void _showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF03A9F4), // Theme Blue
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Text(
                    'Upload File',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Maksimum File 5MB , Maksimum Jumlah File 20',
                        style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Dashed Border Area
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, style: BorderStyle.solid), // Fallback if dashed is hard without package
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // Custom Dashed Implementation for web/canvas could be tricky without packages, 
                        // using solid grey border as placeholder similar to dashed look or custom painter.
                        // Let's use a simple container for now.
                        child: CustomPaint(
                          painter: DashedRectPainter(color: Colors.grey, strokeWidth: 1.0, gap: 5.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.cloud_upload, size: 80, color: Color(0xFF2196F3)), // Blue cloud icon
                                SizedBox(height: 16),
                                Text(
                                  'File yang akan di upload akan tampil di sini',
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Buttons
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              foregroundColor: Colors.black,
                              elevation: 0,
                              minimumSize: const Size(150, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Pilih File', style: TextStyle(fontSize: 12)),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              foregroundColor: Colors.black,
                              elevation: 0,
                              minimumSize: const Size(150, 45),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Simpan', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 1.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = 0;
    double y = 0;
    double w = size.width;
    double h = size.height;

    _drawDashedLine(canvas, Offset(x, y), Offset(w, y), dashedPaint);
    _drawDashedLine(canvas, Offset(w, y), Offset(w, h), dashedPaint);
    _drawDashedLine(canvas, Offset(w, h), Offset(x, h), dashedPaint);
    _drawDashedLine(canvas, Offset(x, h), Offset(x, y), dashedPaint);
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    // Simple dashed line implementation
    double distance = (p2 - p1).distance;
    double dx = (p2.dx - p1.dx) / distance;
    double dy = (p2.dy - p1.dy) / distance;
    double dashWidth = 5.0;
    double gapWidth = gap;
    
    double currentDistance = 0.0;
    while (currentDistance < distance) {
      double x1 = p1.dx + dx * currentDistance;
      double y1 = p1.dy + dy * currentDistance;
      double x2 = p1.dx + dx * (currentDistance + dashWidth);
      double y2 = p1.dy + dy * (currentDistance + dashWidth);
      
      // Clamp to end
      if (currentDistance + dashWidth > distance) {
        x2 = p2.dx;
        y2 = p2.dy;
      }
      
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
      currentDistance += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
