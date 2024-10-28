import 'package:flutter/material.dart';
import '../main.dart'; // Import to access global salesData
import 'lgc.dart'; // Import UpdatePage to navigate

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perbarui Penjualan'),
        backgroundColor: const Color(0xFF8801FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final sale = salesData[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(
                        'Faktur: ${sale['faktur']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4.0),
                          Text('Tanggal: ${sale['tanggal']}',
                              style: const TextStyle(color: Colors.black87)),
                          Text('Customer: ${sale['customer']}',
                              style: const TextStyle(color: Colors.black87)),
                          Text('Jumlah Barang: ${sale['jumlah']}',
                              style: const TextStyle(color: Colors.black87)),
                          Text('Total: Rp${sale['total']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.deepPurple),
                            onPressed: () {
                              // Navigate to the update page with data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdPage(
                                    index: index,
                                    initialData: sale,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi Hapus'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin menghapus penjualan ini?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close dialog
                                        },
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          salesData
                                              .removeAt(index); // Remove item
                                          Navigator.of(context)
                                              .pop(); // Close dialog
                                          (context as Element)
                                              .markNeedsBuild(); // Refresh the UI
                                        },
                                        child: const Text('Hapus',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Kembali ke home
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF3E5F5),
    );
  }
}
