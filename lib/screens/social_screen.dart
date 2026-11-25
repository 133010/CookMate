import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apa kegiatanmu hari ini?'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.redAccent,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text('User $index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),

          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey),
                title: Text('amayra_', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            
              Container(
                height: 250,
                color: Colors.orange[100],
                child: const Center(
                  child: Icon(Icons.restaurant, size: 60, color: Colors.red),
                ),
              ),

              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mode_comment_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
                ],
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'amayra_ Ayam Rica-Rica Kemangi pedas manis gurih!',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Jelajah'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Sosial'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Tersimpan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}