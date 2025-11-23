import 'package:flutter/material.dart';

class CollectionWidget extends StatelessWidget {

  const CollectionWidget({super.key, required this.historyItems});

  final List<Map<String, dynamic>> historyItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: historyItems.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final item = historyItems[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ngày: ${item['date']}'),
                      Text('Loại rác: ${item['type']}'),
                      Text('Khối lượng: ${item['quantity']} ${item['unit']}'),
                    ],
                  ),
                  trailing: Text(
                    '${item['point']} Điểm',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}
