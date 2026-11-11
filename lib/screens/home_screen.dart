import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String selectedCategory = 'Semua Resep';

  final List<String> categories = [
    'Semua Resep',
    'Populer',
    'Nusantara',
    'Western',
    'Camilan',
    'Minuman',
    'Diet',
  ];

  final List<Map<String, String>> recipes = [
    {
      'name' : 'Rendang Daging Sapi',
      'time' : '90 menit',
      'cal' : '470 Kal',
    },
    {
      'name' : 'Matcha Latte',
      'time' : '5 menit',
      'cal' : '140 Kal'
    },
    {
      'name' : 'Donat Kentang',
      'time' : '70 menit',
      'cal' : '170 Kal'
    },
    {
      'name' : 'Tteokbokki',
      'time' : '25 menit',     
      'cal' : '370 Kal'              
    },
    {
      'name' : 'Salad Sayur',
      'time' : '15 menit',     
      'cal' : '50 Kal'        
    },
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const  Text('Cookmate'),
      ),
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            // Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 27,
                  backgroundColor: Color(0xFFE8D689),
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color:Colors.brown,
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo,',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Amayra Adinata',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(                                  
                  onPressed: () {},                          
                  icon: const Icon(Icons.notifications_none),
                ),
              ],
            ),

            const SizedBox(height: 25),  

            //Kolom pencarian                   
            TextField(                                         
              decoration: InputDecoration(                     
                hintText: 'Cari resep rendang, ayam geprek...',
                prefixIcon: const Icon(Icons.search),          
                suffixIcon: const Icon(Icons.tune),            
                filled: true,                                  
                fillColor: Colors.white,                       
                border: OutlineInputBorder(                    
                  borderRadius: BorderRadius.circular(30),     
                  borderSide: BorderSide.none,                 
                ),
              ),  
            ),

            const SizedBox(height: 20),

          //Kategori
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category), 
                      selected: selectedCategory == category,
                      selectedColor: const Color(0xFFE92F40),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedCategory == category
                          ? Colors.white
                          : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // Judul resep
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Resep Spesial Hari Ini',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE92F40),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Trending #1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            //Resep
            Container(
              height: 250,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF806044),
                    Color(0xFF35291E),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nusantara',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Soto Betawi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Makanan berkuah khas Jakarta dengan kuah santan yang gurih.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const Row(
                    children: [
                      Icon(Icons.access_time,
                      color: Colors.white, size: 15),
                      SizedBox(width:50),
                      Text('60 menit',
                        style: TextStyle(color: Colors.white)),
                      SizedBox(width: 15),
                      Icon(Icons.local_fire_department,
                        color: Colors.white, size: 15),
                      SizedBox(width: 5),
                      Text('450 Kal',
                        style: TextStyle(color: Colors.white)),
                      SizedBox(width: 15),
                      Icon(Icons.people,
                        color: Colors.white, size: 15),
                      SizedBox(width: 5),
                      Text('4 Porsi',
                        style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //Judul Rekomendasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rekomendasi Pilihan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(
                      color: Color(0xFFE92F40),
                    ),
                  ),
                ),
              ],
            ),

            // Kartu Resep
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.55,
              ),
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe['name']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '${recipe['time']} . ${recipe['cal']}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

          ],
        ),
      ),

      //Tombol Navigasi
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFFE92F40),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Jelajah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Sosial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Tersimpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
