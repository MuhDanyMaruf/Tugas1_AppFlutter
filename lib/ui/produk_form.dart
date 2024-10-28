import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
        backgroundColor: const Color(0xFF8801FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textboxKodeProduk(),
              const SizedBox(height: 16),
              _textboxNamaProduk(),
              const SizedBox(height: 16),
              _textboxHargaProduk(),
              const SizedBox(height: 24),
              _tombolSimpan(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      controller: _kodeProdukTextboxController,
      decoration: InputDecoration(
        labelText: "Kode Produk",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.code),
      ),
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      controller: _namaProdukTextboxController,
      decoration: InputDecoration(
        labelText: "Nama Produk",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.label),
      ),
    );
  }

  Widget _textboxHargaProduk() {
    return TextField(
      controller: _hargaProdukTextboxController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Harga",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.attach_money),
      ),
    );
  }

  Widget _tombolSimpan(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12.0), backgroundColor: const Color(0xFF8801FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {
        String kodeProduk = _kodeProdukTextboxController.text;
        String namaProduk = _namaProdukTextboxController.text;
        int harga = int.tryParse(_hargaProdukTextboxController.text) ?? 0;

        // Mengembalikan produk baru ke halaman sebelumnya
        Navigator.pop(context, {
          'kodeProduk': kodeProduk,
          'namaProduk': namaProduk,
          'harga': harga,
        });
      },
      child: const Center(
        child: Text(
          'Simpan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
