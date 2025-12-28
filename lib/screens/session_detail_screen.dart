import 'package:flutter/material.dart';

import 'package:learning_management_system/screens/material_slide_screen.dart';

class SessionDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> attachments;

  const SessionDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.attachments,
    this.assignments = const [],
  });

  final List<Map<String, dynamic>> assignments;

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
                _buildTugasList(),
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
        final bool isCompleted = item['completed'] ?? false;

        return GestureDetector(
          onTap: () {
             // Check if it's the specific "Pengantar" material
             if (item['title'].toString().contains('Pengantar')) {
               Navigator.push(
                 context, 
                 MaterialPageRoute(builder: (context) => const MaterialSlideScreen())
               );
             }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), // Pill/Stadium shape
              border: Border.all(color: Colors.grey[300]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(item['icon'], size: 24, color: Colors.black87),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item['title'],
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black87),
                  ),
                ),
                const SizedBox(width: 8),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF03A9F4), // Light Blue
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 14),
                  )
                else
                  const Icon(Icons.check_circle, color: Colors.grey, size: 24), // Grey check for incomplete
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTugasList() {
    if (widget.assignments.isEmpty) {
      return const Center(child: Text("Belum ada tugas"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.assignments.length,
      itemBuilder: (context, index) {
        final item = widget.assignments[index];
        bool isCompleted = item['completed'] ?? false;
        // Check if title or type indicates a Quiz
        bool isQuiz = item['title'].toString().toLowerCase().contains('quiz') || 
                      item['title'].toString().toLowerCase().contains('kuis');

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            // Blue border for Quiz, light grey for Assignment
            border: Border.all(
              color: isQuiz ? const Color(0xFF2196F3) : Colors.grey[300]!,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top Section: Icon, Title, Checkmark
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Container
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: isQuiz 
                        ? const Icon(Icons.quiz_outlined, size: 28, color: Colors.black87)
                        : const Icon(Icons.description_outlined, size: 28, color: Colors.black87),
                    ),
                    // Title
                    Expanded(
                      child: Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87
                        ),
                      ),
                    ),
                    // Checkmark
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.check_circle,
                        color: isCompleted ? const Color(0xFF03A9F4) : Colors.grey[300],
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Divider
              if (item['description'] != null && item['description'].toString().isNotEmpty)
                Divider(height: 1, color: Colors.grey[200]),

              // Description Section
              if (item['description'] != null && item['description'].toString().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    item['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 12, 
                      color: Colors.black87, 
                      height: 1.5
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
