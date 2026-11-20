import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/news.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage:
                            AssetImage('assets/images/imagekecil1.png'),
                      ),
                      SizedBox(width: 8),
                      Text('Samuel Newton', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('TECHNOLOGY',
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  const SizedBox(height: 6),
                  const Text(
                    'To build responsibly, tech needs to do more than just hire chief ethics officers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  const Text('17 June, 2023 - 4:49 PM',
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  const Divider(height: 32),
                  const Text(
                    'In the last couple of years, we\'ve seen new teams in tech '
                    'companies emerge that focus on responsible innovation, '
                    'digital well-being, AI ethics or humane use. Whatever their '
                    'titles, these individuals are given the task of "leading" '
                    'ethics at their companies.',
                    style: TextStyle(fontSize: 12, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}