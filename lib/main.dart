import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Page',
      theme: ThemeData.dark(),
      home: const WelcomePage(), // Halaman pertama yang muncul
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman AboutPage ketika tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          },
          child: const Text('Get to Know Me!!'),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Fungsi untuk menampilkan tautan dalam dialog
  void _showLinkDialog(BuildContext context, String title, String url) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(url, style: const TextStyle(color: Colors.blue)),
          actions: <Widget>[
            TextButton(
              child: const Text('Copy Link'),
              onPressed: () {
                // Salin tautan ke clipboard (jika didukung di aplikasi)
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sarah Auliannisa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            // Foto diri
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/sarah.jpg'), // Ganti dengan path foto Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Deskripsi
            const Text(
              'Hi, my name is Sarah Auliannisa Aini, a lot of my friends call me Sarah. I am an Information Student, Nischaverta (5026221071).',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Bagian FUN FACT
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Heres are more about me',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ExpansionTile(
              title: const Text(
                'Click to see fun facts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/kucing.jpeg', // Ganti dengan path gambar kucing
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text(
                    'Afraid of Cats: Sebenernya takut semua binatang, kecuali nyamuk dan semut.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/memasak.jpeg', // Ganti dengan path gambar memasak
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text(
                    'Love Cooking: My kind of therapy, suka banget riweuh didapur.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Dropdown untuk More About Me
            ExpansionTile(
              title: const Text(
                'Lets Connect',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              children: [
                ListTile(
                  leading: const Icon(Icons.link, color: Colors.blue),
                  title: const Text(
                    'Instagram: Follow me for more updates.',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    _showLinkDialog(
                      context,
                      'Instagram',
                      'https://www.instagram.com/sarahalns', // Ganti dengan tautan Instagram Anda
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.link, color: Colors.blue),
                  title: const Text(
                    'LinkedIn: Connect with me for professional updates.',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    _showLinkDialog(
                      context,
                      'LinkedIn',
                      'https://www.linkedin.com/in/sarahauliannisaaini', // Ganti dengan tautan LinkedIn Anda
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
