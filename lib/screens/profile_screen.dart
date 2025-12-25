import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfileScreen extends StatefulWidget {
  final XFile? currentImage;

  const ProfileScreen({super.key, this.currentImage});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late XFile? _image;
  final ImagePicker _picker = ImagePicker();
  int _selectedTabIndex = 0;

  // Controllers for Edit Profile
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _countryController;
  late TextEditingController _descController;

  // Mock data for Kelas tab
  final List<Map<String, String>> _kelasData = [
    {
      'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'code': 'D4SM-41-GAB1 [ARG]',
      'date': 'Tanggal Mulai: Monday, 8 February 2021',
    },
    {
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'code': 'D4SM-41-03 [ADP]',
      'date': 'Tanggal Mulai: Monday, 8 February 2021',
    },
    {
      'title': 'KEWARGANEGARAAN',
      'code': 'D4SM-41-GAB1 [BBR] - JUMAT 2',
      'date': 'Tanggal Mulai: Monday, 15 February 2021',
    },
    {
      'title': 'OLAH RAGA (DTT-44-01 [CY])',
      'code': 'DTT-44-01 [CY]',
      'date': 'Tanggal Mulai: Monday, 15 February 2021',
    },
    {
      'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'code': 'D4SM-41-04 [TPI]',
      'date': 'Tanggal Mulai: Monday, 15 February 2021',
    },
     {
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'code': 'D4SM-41-GAB1 [APJ]',
      'date': 'Tanggal Mulai: Monday, 15 February 2021',
    },
  ];

  @override
  void initState() {
    super.initState();
    _image = widget.currentImage;
    
    // Initialize with mock data
    _firstNameController = TextEditingController(text: 'ANDIKA');
    _lastNameController = TextEditingController(text: 'PRATAMA');
    _emailController = TextEditingController(text: 'andika.pratama@365.telkomuniversity.ac.id');
    _countryController = TextEditingController(text: 'Indonesia');
    _descController = TextEditingController(text: 'Mahasiswa D4 Teknologi Rekayasa Multimedia');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profil Pengguna', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: CeLOETheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, _image); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header with Overlapping Card
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Maroon Background
                Container(
                  height: 140,
                  width: double.infinity,
                  color: CeLOETheme.primaryColor,
                ),
                
                // Profile Image & Name
                Positioned(
                  top: 10,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              color: Colors.grey[300],
                              image: _image != null 
                                ? DecorationImage(
                                    image: NetworkImage(_image!.path), 
                                    fit: BoxFit.cover,
                                  )
                                : const DecorationImage(
                                    image: AssetImage('assets/images/user_avatar.png'),
                                    fit: BoxFit.cover,
                                  ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: _pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt, size: 20, color: CeLOETheme.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        // Dynamically show name from controllers
                        '${_firstNameController.text} ${_lastNameController.text}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating Card (Tabs)
                Container(
                  margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabItem('About Me', index: 0),
                      _buildTabItem('Kelas', index: 1),
                      _buildTabItem('Edit Profile', index: 2),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24), // Space for the floating card overlap

            // 2. Dynamic Content Area
            if (_selectedTabIndex == 0) 
              _buildAboutMeContent()
            else if (_selectedTabIndex == 1)
              _buildKelasContent()
            else
              _buildEditProfileContent(),
              
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, {required int index}) {
    final bool isActive = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey,
              fontSize: 13,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 40,
              color: Colors.black, // Active indicator
            ),
        ],
      ),
    );
  }

  Widget _buildAboutMeContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi User',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Email address', _emailController.text),
          const Divider(height: 24),
          _buildInfoRow('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
          const Divider(height: 24),
          _buildInfoRow('Fakultas', 'FIT'),
          
          const SizedBox(height: 32),
          
          const Text(
            'Aktivitas Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('First access to site', 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)'),
          const Divider(height: 24),
          _buildInfoRow('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM (now)'),
        ],
      ),
    );
  }

  Widget _buildKelasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _kelasData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final course = _kelasData[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course['code']!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course['date']!,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
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

  Widget _buildEditProfileContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          _buildTextField('Nama Pertama', _firstNameController),
          const SizedBox(height: 16),
          _buildTextField('Nama Terakhir', _lastNameController),
          const SizedBox(height: 16),
          _buildTextField('E-mail Address', _emailController),
          const SizedBox(height: 16),
          _buildTextField('Negara', _countryController),
          const SizedBox(height: 16),
          _buildTextField('Deskripsi', _descController, maxLines: 3),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CeLOETheme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Simpan Perubahan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: CeLOETheme.primaryColor),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}
