import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'package:learning_management_system/screens/session_detail_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String code;

  const CourseDetailScreen({
    super.key,
    required this.title,
    required this.code,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
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
        backgroundColor: CeLOETheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.code,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
      ),
      body: Column(
        children: [
          // Header / Tab Bar Container
          Container(
            color: CeLOETheme.primaryColor,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: CeLOETheme.primaryColor,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "Materi"),
                  Tab(text: "Tugas Dan Kuis"),
                ],
              ),
            ),
          ),
          
          // Tab View Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMateriTab(),
                _buildTugasTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMateriTab() {
    final List<Map<String, dynamic>> sessions = [
      {
        'meeting': 'Pertemuan 1',
        'title': 'Pengantar User Interface Design',
        'details': '2 URL, 2 Files, 3 Interactive Content',
        'completed': true, // Grey Check
      },
      {
        'meeting': 'Pertemuan 2',
        'title': 'Konsep User Interface Design',
        'details': '2 URL, 1 Files, 3 Files, 1 Tugas',
        'completed': true, // Green Check
      },
      {
        'meeting': 'Pertemuan 3',
        'title': 'Interaksi pada User Interface Design',
        'details': '2 URL, 2 Files, 3 Interactive Content',
        'completed': true, // Green Check
      },
      {
        'meeting': 'Pertemuan 4',
        'title': 'Ethnographic Observation',
        'details': '',
        'completed': true, // Green Check
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        // Mocking 'checked' status visually
        // First item generic grey check, others green check in the image ref
        bool isGreenCheck = index > 0; 

        return GestureDetector(
          onTap: () {
            // Check if it's the 2nd meeting (index 1) which matches the design requirement
            // Or just navigate to the static detail screen for all items for demo purposes
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SessionDetailScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row: Badge and Check Icon
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          session['meeting'],
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.check_circle, 
                        color: isGreenCheck ? Colors.green : Colors.grey[400],
                        size: 20,
                      ),
                    ],
                  ),
                ),
                
                const Divider(height: 1),
                
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      if (session['details'].isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          session['details'],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTugasTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.assignment_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Belum ada tugas aktif', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
