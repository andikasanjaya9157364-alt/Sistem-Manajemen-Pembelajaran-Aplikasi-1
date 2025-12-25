import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';

class SessionDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> attachments;

  const SessionDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.attachments,
  });

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
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.5),
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
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.attachments.length,
      itemBuilder: (context, index) {
        final item = widget.attachments[index];
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
              Icon(item['icon'], size: 20, color: Colors.grey[600]),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item['title'],
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
