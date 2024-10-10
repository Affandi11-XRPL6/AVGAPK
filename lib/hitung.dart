import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Average extends StatefulWidget {
  const Average({super.key});

  @override
  _AverageState createState() => _AverageState();
}

class _AverageState extends State<Average> {
  final TextEditingController valueA = TextEditingController();
  final TextEditingController valueB = TextEditingController();
  final TextEditingController valueC = TextEditingController();
  final TextEditingController valueD = TextEditingController();

  String hasil = '';
  String kategori = '';
  bool isDarkMode = false; // Variabel untuk mode gelap

  void showHasil() {
    setState(() {
      int nilaiA = int.tryParse(valueA.text) ?? 0;
      int nilaiB = int.tryParse(valueB.text) ?? 0;
      int nilaiC = int.tryParse(valueC.text) ?? 0;
      int nilaiD = int.tryParse(valueD.text) ?? 0;

      double averageNilai = (nilaiA + nilaiB + nilaiC + nilaiD) / 4.0;
      hasil = 'Rata-rata nilai adalah: ${averageNilai.toStringAsFixed(2)}';

      if (averageNilai >= 85 && averageNilai <= 100) {
        kategori = 'Kategori: A';
      } else if (averageNilai >= 70 && averageNilai <= 84) {
        kategori = 'Kategori: B';
      } else if (averageNilai >= 55 && averageNilai <= 69) {
        kategori = 'Kategori: C';
      } else if (averageNilai >= 0 && averageNilai <= 54) {
        kategori = 'Kategori: D';
      } else {
        kategori = 'Periksa lagi inputan Anda';
      }
    });
  }

  void _reset() {
    setState(() {
      valueA.clear();
      valueB.clear();
      valueC.clear();
      valueD.clear();
      hasil = '';
      kategori = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Average Calculator'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: valueA,
              decoration: const InputDecoration(labelText: 'Masukkan Nilai A'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: valueB,
              decoration: const InputDecoration(labelText: 'Masukkan Nilai B'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: valueC,
              decoration: const InputDecoration(labelText: 'Masukkan Nilai C'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: valueD,
              decoration: const InputDecoration(labelText: 'Masukkan Nilai D'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showHasil,
              child: const Text('Hitung Rata-rata'),
            ),
            ElevatedButton(
              onPressed: _reset,
              child: const Icon(Icons.wifi_protected_setup_outlined),
            ),
            const SizedBox(height: 20),
            Container(
              child: Text(
                hasil,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              kategori,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      
    );
  }
}
