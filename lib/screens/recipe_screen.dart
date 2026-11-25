import 'package:flutter/material.dart';

class DetailResepScreen extends StatefulWidget {
  const DetailResepScreen({super.key});

  @override
  State<DetailResepScreen> createState() => _DetailResepScreenState();
}

class _DetailResepScreenState extends State<DetailResepScreen> {
  final List<String> bahan = [
    'Ayam Negeri',
    'Bawang Merah',
    'Bawang Putih',
    'Cabai Rawit Merah',
    'Daun Jeruk',
    'Serai',
    'Daun Bawang',
    'Daun Kemangi',
  ];

  final List<String> jumlah = [
    '700 g',
    '2 siung',
    '1 siung',
    '10 buah',
    '5 lembar',
    '2 batang',
    '2 lembar',
    '3 tangkai',
  ];

  final List<bool> sudahDicek = List.filled(8, false);

  Widget infoResep(String judul, String isi) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              judul,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 5),
            Text(
              isi,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F0E6),
        elevation: 0,
        title: const Text(
          'Detail Resep',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Resep
            const Text(
              'Ayam Rica-Rica Kemangi',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF29231F),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Hidangan ayam khas Manado yang dimasak dengan bumbu rempah dan cabai pilihan. Memiliki cita rasa pedas, gurih, dan aroma harum daun kemangi.',
              style: TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
            ),

            const SizedBox(height: 20),

            // Informasi Resep
            Row(
              children: [
                infoResep('Waktu', '60 menit'),
                infoResep('Kalori', '405 kal'),
                infoResep('Tingkat', 'Sedang'),
                infoResep('Rating', '-'),
              ],
            ),

            const SizedBox(height: 20),

            // Judul Bahan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFED85),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Bahan-Bahan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB83D42),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Daftar Bahan
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bahan.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: const Color(0xFFE82D39),
                  title: Text(
                    bahan[index],
                    style: const TextStyle(fontSize: 14),
                  ),
                  secondary: Text(
                    jumlah[index],
                    style: const TextStyle(
                      color: Color(0xFFB83D42),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: sudahDicek[index],
                  onChanged: (value) {
                    setState(() {
                      sudahDicek[index] = value!;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // Judul Langkah Memasak
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFED85),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Langkah Memasak',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB83D42),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              '1. Bersihkan ayam dan potong sesuai selera.\n\n'
              '2. Haluskan bawang merah, bawang putih, dan cabai.\n\n'
              '3. Tumis bumbu hingga harum.\n\n'
              '4. Masukkan ayam, daun jeruk, dan serai.\n\n'
              '5. Masak hingga ayam matang.\n\n'
              '6. Masukkan daun kemangi, lalu aduk hingga rata.',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),

            const SizedBox(height: 30),

            // Tombol mulai memasak
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE82D39),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                ),
                child: const Text(
                  'Mulai Memasak',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
