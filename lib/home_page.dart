import 'package:flutter/material.dart';
import 'news_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const berita = [
    {
      'gambar': 'assets/images/imagekecil1.png',
      'kategori': 'TECHNOLOGY',
      'judul': 'Insurtech startup PasarPolis gets \$54 million — Series B'
    },
    {
      'gambar': 'assets/images/imagekecil2.png',
      'kategori': 'TECHNOLOGY',
      'judul': 'The IPO parade continues as Wish files, Bumble targets'
    },
    {
      'gambar': 'assets/images/imagekecil1.png',
      'kategori': 'TECHNOLOGY',
      'judul': 'Hypatos gets \$11.8M for a deep learning...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.menu, color: Colors.white, size: 18),
                  ),
                ),
                const Text('NewsApp',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 36),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _KartuUtama(),
                  _KartuUtama(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Latest News',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 12),
            ...berita.map(
              (b) => _ItemBerita(
                gambar: b['gambar']!,
                kategori: b['kategori']!,
                judul: b['judul']!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KartuUtama extends StatelessWidget {
  const _KartuUtama();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/robot.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('TECHNOLOGY',
              style: TextStyle(color: Colors.white70, fontSize: 10)),
          SizedBox(height: 6),
          Text(
            'Microsoft launches a deepfake detector tool ahead of US election',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.chat_bubble_outline, color: Colors.white, size: 18),
              SizedBox(width: 12),
              Icon(Icons.bookmark_border, color: Colors.white, size: 18),
              Spacer(),
              Icon(Icons.share, color: Colors.white, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemBerita extends StatelessWidget {
  final String gambar;
  final String kategori;
  final String judul;

  const _ItemBerita({
    required this.gambar,
    required this.kategori,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const NewsPage()),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(gambar,
                  width: 72, height: 72, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kategori,
                      style: const TextStyle(color: Colors.grey, fontSize: 10)),
                  const SizedBox(height: 4),
                  Text(judul,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}