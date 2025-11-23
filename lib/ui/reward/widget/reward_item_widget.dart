import 'package:flutter/material.dart';

class RewardItemWidget extends StatelessWidget {
  const RewardItemWidget({
    super.key,
    required this.rewardItems,
    required this.onRedeem,
  });

  final List<Map<String, dynamic>> rewardItems;
  final void Function(int id) onRedeem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: rewardItems.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = rewardItems[index];
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
                  Text('${item['description']}'),
                  Text('Điểm quy đổi: ${item['pointCost']}'),
                  Text('Số lượng: ${item['stock']}'),
                ],
              ),
              trailing: TextButton(
                onPressed: () {
                  onRedeem(item['id']);
                },
                child: Text(
                  'Đổi quà',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
