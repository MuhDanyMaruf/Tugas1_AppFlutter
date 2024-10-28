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
        title: const Text('Tambah Penjualan Baru'),
        backgroundColor: const Color(0xFF8801FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                  fakturController, 'No Faktur Penjualan', Icons.receipt),
              const SizedBox(height: 16),
              _buildTextField(
                  tanggalController, 'Tanggal Penjualan', Icons.calendar_today),
              const SizedBox(height: 16),
              _buildTextField(
                  customerController, 'Nama Customer', Icons.person),
              const SizedBox(height: 16),
              _buildTextField(jumlahController, 'Jumlah Barang',
                  Icons.production_quantity_limits),
              const SizedBox(height: 16),
              _buildTextField(
                  totalController, 'Total Penjualan', Icons.attach_money),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addSale, // Call the addSale function
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: const Color(0xFF8801FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: Icon(icon),
      ),
      keyboardType: label == 'Jumlah Barang' || label == 'Total Penjualan'
          ? TextInputType.number
          : TextInputType.text,
    );
  }
}
