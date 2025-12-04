import 'package:flutter/material.dart';
import 'package:green_school/ui/home/model/home_item.dart';
import 'package:green_school/ui/home/widget/home_item_card.dart';

class HomeList extends StatelessWidget {
  final void Function(String url) onItemClicked;

  final List<HomeItem> homeItems = [
    HomeItem(
      imgUrl: "https://greenschool.io.vn/wp-content/uploads/2025/12/aboutgreen.jpg",
      link:
          "https://greenschool.io.vn/",
    ),
    HomeItem(
      imgUrl:
          "https://greenschool.io.vn/wp-content/uploads/2025/11/1-e1764211278869.jpg",
      link:
          "https://greenschool.io.vn/soi-noi-cuoc-thi-lop-hoc-xanh-sach-dep-tai-truong-thpt-than-nhan-trung/",
    ),
    HomeItem(
      imgUrl: "https://greenschool.io.vn/wp-content/uploads/2025/11/a66.jpg",
      link:
          "https://greenschool.io.vn/mo-hinh-doi-rac-lay-qua-lan-toa-loi-song-xanh/",
    ),
    HomeItem(
      imgUrl:
          "https://greenschool.io.vn/wp-content/uploads/2025/12/z7283738954511_4f6997908b40c2bc8d2f1f2c60ece2cb.jpg",
      link:
          "https://greenschool.io.vn/phan-loai-va-tai-che-rac-thai-nhua-dung-cach/",
    ),
    HomeItem(
      imgUrl: "https://greenschool.io.vn/wp-content/uploads/2025/12/album-7-scaled.jpg",
      link:
          "https://greenschool.io.vn/phan-loai-rac-thai-dung-cach-bao-ve-ban-than-bao-ve-moi-truong/",
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
