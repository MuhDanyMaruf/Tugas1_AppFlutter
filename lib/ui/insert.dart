import 'package:flutter/material.dart';
import '../main.dart'; // Import to access the global salesData

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  // Function to add data to salesData list
  void addSale() {
    setState(() {
      salesData.add({
        'faktur': fakturController.text,
        'tanggal': tanggalController.text,
        'customer': customerController.text,
        'jumlah': jumlahController.text,
        'total': totalController.text,
      });
    });
    Navigator.pop(context); // Return to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Sale'),
        backgroundColor: Color.fromARGB(255, 136, 1, 255),
      ),
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
              onPressed: addSale, // Call the addSale function
              child: Text('Submit'),
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
