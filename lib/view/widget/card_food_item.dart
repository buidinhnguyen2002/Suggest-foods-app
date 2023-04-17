import 'package:flutter/material.dart';

class CardFoodItem extends StatelessWidget {
  final String? name;
  final String? id;
  final String? category;
  final String? description;
  final double? rate;
  final String urlImage;
  const CardFoodItem(
      {super.key,
      this.name,
      this.id,
      this.category,
      this.description,
      this.rate,
      required this.urlImage});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cardWidth = deviceSize.width * 0.65;
    final cardHeight = deviceSize.height * 0.3;
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.4),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromRGBO(252, 252, 252, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        child: Column(
          children: [
            Container(
              width: cardWidth,
              height: cardHeight * 0.7,
              child: Image.network('${urlImage}', fit: BoxFit.cover),
            ),
            Container(
              height: cardHeight * 0.3,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 32),
                title: Text(
                  name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  category!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 12,
                  ),
                ),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      Text(
                        '${rate}',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
