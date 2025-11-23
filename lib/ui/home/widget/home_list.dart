import 'package:flutter/material.dart';
import 'package:green_school/ui/home/model/home_item.dart';
import 'package:green_school/ui/home/widget/home_item_card.dart';

class HomeList extends StatelessWidget {
  final void Function(String url) onItemClicked;

  final List<HomeItem> homeItems = [
    HomeItem(
      imgUrl: "https://thpttnt.edu.vn/wp-content/uploads/2025/10/ANH-1-2.jpg",
      link:
          "https://thpttnt.edu.vn/truong-thpt-nhan-trung-long-trong-chuc-dai-hoi-cong-doan-bo-phan-nhiem-ky-2025-2030/",
    ),
    HomeItem(
      imgUrl:
          "https://moet.gov.vn/upload/2007219/fck/H%E1%BA%B1ng%20Moet/Quang%20c%E1%BA%A3nh%20h%E1%BB%99i%20ngh%E1%BB%8B.jpg",
      link:
          "https://thpttnt.edu.vn/toan-nganh-giao-duc-hoc-tap-trien-khai-nghi-quyet-71-nq-tw/",
    ),
    HomeItem(
      imgUrl: "https://thpttnt.edu.vn/wp-content/uploads/2025/11/a0.jpg",
      link:
          "https://thpttnt.edu.vn/thpt-nhan-trung-soi-noi-hoi-khoe-phu-dong-cap-truong-nam-hoc-2025-2026/",
    ),
    HomeItem(
      imgUrl:
          "https://thpttnt.edu.vn/wp-content/uploads/2025/10/z713754041774981d6323f06c6e9a0ccc6bb39a9187ca7.jpg",
      link:
          "https://thpttnt.edu.vn/phien-hop-dau-tien-xay-dung-de-thi-tot-nghiep-thpt-tren-may-tinh/",
    ),
    HomeItem(
      imgUrl: "https://bafu.edu.vn/img/2025/dhkh(2).jpg",
      link:
          "https://thpttnt.edu.vn/dai-hoi-chi-hoi-khuyen-hoc-lan-thu-nhiem-ky-2025-2030-dien-ra-thanh-cong-tot-dep/",
    ),
  ];

  HomeList({super.key, required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeItems.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onItemClicked(homeItems[index].link);
          },
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: HomeItemCard(
              imageUrl: homeItems[index].imgUrl,
              link: homeItems[index].link,
            ),
          ),
        );
      },
    );
  }
}
