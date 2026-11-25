import 'package:flutter/material.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('@amayra_', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('Ayam Rica-Rica Kemangi', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // 1. Kartu Ringkasan Resep di Atas
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.restaurant, color: Colors.red),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ayam Rica-Rica Kemangi', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('oleh @amayra_', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('24 diskusi · 12 suka', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          // 2. Tab Diskusi & Hasil Masakan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text('Diskusi', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                ],
              ),
              const Text('Hasil masakan', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Divider(),

          // 3. Daftar Komentar / Diskusi
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Komentar 1
                ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.grey),
                  title: const Text('ulmiaaa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      const Text('Kalau cabe merahnya diganti cabe ijo bisa nggak?'),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Text('12 menit lalu', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          SizedBox(width: 12),
                          Text('Balas', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Balasan Komentar (Nested Reply Box)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('@amayra_ · Pembuat resep', style: TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            const Text('Bisa! Tetep enak kok!', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                      const Text('4', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 4. Input Kotak Komentar di Bawah
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                const CircleAvatar(radius: 16, backgroundColor: Colors.grey),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bagikan pendapat atau tanyakan sesuatu...',
                      hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.send, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}