import 'package:flutter/material.dart';
import 'package:flutter_tugas_praktikum/ui/produk_detail.dart';
import 'package:flutter_tugas_praktikum/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  List<Map<String, dynamic>> produkList = [
    {"kodeProduk": "A001", "namaProduk": "Kulkas", "harga": 2500000},
    {"kodeProduk": "A002", "namaProduk": "Televisi", "harga": 5000000},
    {"kodeProduk": "A003", "namaProduk": "Mesin Cuci", "harga": 1500000},
    {"kodeProduk": "A004", "namaProduk": "Mesin Giling", "harga": 1500000},
  ];

  void _navigateToAddProduk(BuildContext context) async {
    final newProduk = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProdukForm()),
    );

    if (newProduk != null) {
      setState(() {
        produkList.add(newProduk);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        backgroundColor: const Color(0xFF8801FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToAddProduk(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: produkList.length,
          itemBuilder: (context, index) {
            return ItemProduk(
              kodeProduk: produkList[index]['kodeProduk'],
              namaProduk: produkList[index]['namaProduk'],
              harga: produkList[index]['harga'],
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFFF3E5F5),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ItemProduk({
    Key? key,
    this.kodeProduk,
    this.namaProduk,
    this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              harga: harga,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            leading: Icon(
              Icons.shopping_bag,
              color: Colors.deepPurple,
              size: 36,
            ),
            title: Text(
              namaProduk ?? 'Produk Tidak Diketahui',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kode Produk: ${kodeProduk ?? 'Tidak tersedia'}",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  "Harga: Rp${harga ?? 0}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
