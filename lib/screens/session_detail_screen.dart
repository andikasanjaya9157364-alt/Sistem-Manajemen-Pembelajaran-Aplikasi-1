import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class SessionDetailScreen extends StatefulWidget {
  const SessionDetailScreen({super.key});

  @override
  State<SessionDetailScreen> createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Konsep User Interface Design',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Description Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deskripsi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna, lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari interaction.',
                  style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              tabs: const [
                Tab(text: "Lampiran Materi"),
                Tab(text: "Tugas dan Kuis"),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLampiranList(),
                const Center(child: Text("Belum ada tugas")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLampiranList() {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.link, 'title': 'Zoom Meeting Synchronous'},
      {'icon': Icons.article_outlined, 'title': 'Halaman-halaman Antarmuka Pengguna'},
      {'icon': Icons.article_outlined, 'title': 'UI Guidelines and Principles'},
      {'icon': Icons.article_outlined, 'title': 'User Profile'},
      {'icon': Icons.attach_file, 'title': 'Principles of User Interface Design.pdf'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(items[index]['icon'], size: 20, color: Colors.grey[600]),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  items[index]['title'],
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
            ],
          ),
        );
      },
    );
  }
}
