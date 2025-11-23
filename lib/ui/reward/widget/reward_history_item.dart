import 'package:flutter/material.dart';

class RewardHistoryItem extends StatelessWidget {

  const RewardHistoryItem({super.key, required this.historyItems});

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
                  title: Text(item['rewardName']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ngày: ${item['date']}'),
                      Text('Điểm quy đổi: ${item['totalPointsSpent']}'),
                      Text('Số lượng: ${item['quantity']}'),
                    ],
                  ),
                ),
              );
            },
          ),
        );
  }
}
