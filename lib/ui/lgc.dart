import 'package:flutter/material.dart';
import '../main.dart'; // Import to access the global salesData

class UpdPage extends StatefulWidget {
  final int index; // Index of the sale to update
  final Map<String, String> initialData; // Initial data to update

  UpdPage({required this.index, required this.initialData});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdPage> {
  late TextEditingController fakturController;
  late TextEditingController tanggalController;
  late TextEditingController customerController;
  late TextEditingController jumlahController;
  late TextEditingController totalController;

  @override
  void initState() {
    super.initState();
    fakturController = TextEditingController(text: widget.initialData['faktur']);
    tanggalController = TextEditingController(text: widget.initialData['tanggal']);
    customerController = TextEditingController(text: widget.initialData['customer']);
    jumlahController = TextEditingController(text: widget.initialData['jumlah']);
    totalController = TextEditingController(text: widget.initialData['total']);
  }

  // Function to update the sale
  void updateSale() {
    setState(() {
      salesData[widget.index] = {
        'faktur': fakturController.text,
        'tanggal': tanggalController.text,
        'customer': customerController.text,
        'jumlah': jumlahController.text,
        'total': totalController.text,
      };
    });
    Navigator.pop(context); // Kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Sale')),
      backgroundColor: Color(0xFFf0f0f0),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fakturController,
              decoration: InputDecoration(labelText: 'No Faktur Penjualan'),
            ),
            TextField(
              controller: tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal Penjualan'),
            ),
            TextField(
              controller: customerController,
              decoration: InputDecoration(labelText: 'Nama Customer'),
            ),
            TextField(
              controller: jumlahController,
              decoration: InputDecoration(labelText: 'Jumlah Barang'),
            ),
            TextField(
              controller: totalController,
              decoration: InputDecoration(labelText: 'Total Penjualan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateSale, // Update the sale
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
