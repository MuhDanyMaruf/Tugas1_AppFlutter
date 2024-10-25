import 'package:flutter/material.dart';
import '../main.dart'; // Import to access global salesData
import 'lgc.dart'; // Import UpdatePage to navigate

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Sale'),
        backgroundColor: Color.fromARGB(255, 136, 1, 255),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: salesData.length,
              itemBuilder: (context, index) {
                final sale = salesData[index];
                return ListTile(
                  title: Text('Faktur: ${sale['faktur']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanggal: ${sale['tanggal']}'),
                      Text('Customer: ${sale['customer']}'),
                      Text('Jumlah Barang: ${sale['jumlah']}'),
                      Text('Total: ${sale['total']}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
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
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Kembali ke home
            },
            child: Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
