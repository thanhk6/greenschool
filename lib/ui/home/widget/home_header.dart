import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final void Function() onQrClicked;
  const HomeHeader({
    super.key,
    required this.name,
    required this.giftScore,
    required this.onQrClicked,
  });

  final String name;
  final String giftScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green[400]),
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Xin chào",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Điểm thưởng:',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  giftScore,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 30, 5, 30),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Material(
                color: Colors.white,
                shape: const CircleBorder(),
                elevation: 4,
                shadowColor: Colors.black26,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    onQrClicked();
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/images/ic_qr.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
