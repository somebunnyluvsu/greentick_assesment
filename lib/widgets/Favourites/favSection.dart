import 'package:flutter/material.dart';
import 'package:greentick_assesment/models/productData.dart';
import 'package:greentick_assesment/widgets/designWidgets/titlebar.dart';
import 'package:greentick_assesment/widgets/Favourites/listData.dart';
import 'package:greentick_assesment/widgets/designWidgets/designcard.dart';
import 'package:greentick_assesment/utils/colors.dart';

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: aDividerColor,
          thickness: 1,
        ),
        const Titlebar(),
        StreamBuilder<List<ProductModel>>(
            stream: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.all(10),
                      child: ProductCard(
                        productData: snapshot.data![index],
                      ),
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Loading..."),
                  ],
                ),
              );
            }),
        const Divider(
          color: aDividerColor,
          thickness: 3,
        ),
      ],
    );
  }

  Stream<List<ProductModel>> getData() async* {
    yield await Future.delayed(
      const Duration(seconds: 1),
      () => sampleData.map((e) => ProductModel.fromData(e)).toList(),
    );
  }
}
