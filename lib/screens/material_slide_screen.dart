import 'package:flutter/material.dart';

class MaterialSlideScreen extends StatelessWidget {
  const MaterialSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0288D1), // Deep Light Blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white54),
            ),
            child: const Center(
              child: Text(
                'Halaman\n1/26',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 10, height: 1.2),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSlide1(),
          const SizedBox(height: 16),
          _buildSlide2(),
          const SizedBox(height: 16),
          _buildSlide3(),
          const SizedBox(height: 16),
          _buildSlide4(),
        ],
      ),
    );
  }

  Widget _buildSlideContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[400]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // Aspect ratio to mimic a slide (4:3 roughly)
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          child: child,
        ),
      ),
    );
  }

  // Slide 1: Title Slide
  Widget _buildSlide1() {
    return _buildSlideContainer(
      child: Stack(
        children: [
          // Background accents (Red triangles/shapes)
          Positioned(
            top: -50,
            left: -50,
            child: Transform.rotate(
              angle: 0.5,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.lightBlue[50],
              ),
            ),
          ),
          
          // Main Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Logos/Images Mockup
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     // Phone Mockups (Red screens)
                     Expanded(
                       child: Column(
                         children: [
                           Container(height: 60, width: 80, color: Colors.lightBlueAccent),
                           const SizedBox(height: 8),
                           Row(
                             children: [
                               Container(height: 40, width: 60, color: Colors.grey[800]),
                               const SizedBox(width: 8),
                               Container(height: 50, width: 40, color: Colors.lightBlueAccent),
                             ],
                           )
                         ],
                       ),
                     ),
                     // Logo Placeholder
                     Column(
                       children: [
                         const Icon(Icons.school, size: 60, color: Colors.grey),
                         Text(
                           "Universitas\nTelkom",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 14,
                             color: Colors.grey[800],
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
                 
                 const Spacer(),
                 
                 // Bottom Title Bar
                 Container(
                   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                   color: const Color(0xFF424242), // Dark Grey
                   child: Row(
                     children: [
                       const Expanded(
                         child: Text(
                           "Pengantar Desain\nAntarmuka Pengguna",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 16,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ),
                       Container(width: 1, height: 40, color: Colors.grey),
                       const SizedBox(width: 12),
                       const Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text("VERSION", style: TextStyle(color: Colors.lightBlue, fontSize: 10)),
                           Text("UI / UX Design", style: TextStyle(color: Colors.lightBlue, fontSize: 10)),
                         ],
                       ),
                     ],
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Slide 2: Perkenalan
  Widget _buildSlide2() {
    return _buildSlideContainer(
      child: Stack(
        children: [
          // Background watermark
           Positioned.fill(
             child: Opacity(
               opacity: 0.05,
               child: Container(color: Colors.lightBlue),
             ),
           ),
           
           Padding(
             padding: const EdgeInsets.all(24),
             child: Column(
               children: [
                 const Text(
                   "Perkenalan",
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 ),
                 const SizedBox(height: 24),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     // Profile Picture Placeholder
                     Container(
                       width: 80,
                       height: 80,
                       decoration: const BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.grey,
                         image: DecorationImage(
                           image: NetworkImage("https://via.placeholder.com/150"), // Placeholder
                           fit: BoxFit.cover,
                         ),
                       ),
                       child: const Icon(Icons.person, color: Colors.white, size: 40),
                     ),
                     const SizedBox(width: 16),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text("• Ady Purna Kurniawan-> ADY", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                           SizedBox(height: 4),
                           Text("• E-mail:\n  adypurnakurniawan@telkomuniversity.ac.id", style: TextStyle(fontSize: 12)),
                           SizedBox(height: 4),
                           Text("• Bidang Keahlian:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                           Padding(
                             padding: EdgeInsets.only(left: 16.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("- Information System", style: TextStyle(fontSize: 11)),
                                 Text("- Web Programming and Design", style: TextStyle(fontSize: 11)),
                                 Text("- Game Development", style: TextStyle(fontSize: 11)),
                               ],
                             ),
                           ),
                           SizedBox(height: 4),
                           Text("• No.HP: 085727930642 -> SMS/Telp/Whatsapp", style: TextStyle(fontSize: 12)),
                         ],
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }

  // Slide 3: User Interface
  Widget _buildSlide3() {
    return _buildSlideContainer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "User Interface",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      "Antarmuka/ user interface (UI) merupakan bagian dari komputer dan perangkat lunaknya yang dapat **dilihat**, **didengar**, **disentuh**, dan **diajak bicara**, baik secara langsung maupun dengan proses pemahaman tertentu.",
                      isBoldHighlights: true,
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint(
                      "UI yang baik adalah UI yang **tidak disadari**, dan UI yang memungkinkan pengguna fokus pada informasi dan task tanpa perlu mengetahui mekanisme untuk menampilkan informasi dan melakukan task tersebut.",
                      isBoldHighlights: true,
                    ),
                    const SizedBox(height: 8),
                    const Text("• Komponen utamanya:", style: TextStyle(fontSize: 12, height: 1.4)),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text("- Input\n- Output", style: TextStyle(fontSize: 12, height: 1.4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Slide 4: Pentingnya Desain UI
  Widget _buildSlide4() {
    return _buildSlideContainer(
      child: Stack(
        children: [
          // Bottom image placeholder
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 80,
              color: Colors.grey[200],
              child: const Icon(Icons.computer, size: 50, color: Colors.grey),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  "Pentingnya Desain UI yang Baik",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint("Banyak sistem dengan fungsionalitas yang baik tapi tidak efisien, membingungkan, dan tidak berguna karena **desain UI yang buruk**.", isBoldHighlights: true),
                        const SizedBox(height: 8),
                        _buildBulletPoint("Antarmuka yang baik merupakan jendela untuk melihat kemampuan sistem serta jembatan bagi kemampuan perangkat lunak."),
                        const SizedBox(height: 8),
                        _buildBulletPoint("Desain yang buruk akan **membingungkan**, **tidak efisien**, bahkan menyebabkan **frustasi**.", isBoldHighlights: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBulletPoint(String text, {bool isBoldHighlights = false}) {
    // Simple parser for **bold** text if needed, or just plain text
    // For simplicity in this mock, we'll try to visually approximate bolding if easy, 
    // but standard Text with RichText span is better.
    
    List<InlineSpan> spans = [];
    if (isBoldHighlights) {
      final parts = text.split("**");
      for (int i = 0; i < parts.length; i++) {
        if (i % 2 == 1) {
          // Odd parts are inside ** **, so bold them
          spans.add(TextSpan(text: parts[i], style: const TextStyle(fontWeight: FontWeight.bold)));
        } else {
          spans.add(TextSpan(text: parts[i]));
        }
      }
    } else {
      spans.add(TextSpan(text: text));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 12, height: 1.4)),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.4, fontFamily: 'Roboto'),
              children: spans,
            ),
          ),
        ),
      ],
    );
  }
}
