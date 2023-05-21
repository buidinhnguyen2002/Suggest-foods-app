import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final void Function(String, bool) updateStatusItem;
  final String? id;
  final String? name;
  final String? category;
  final String? urlImage;
  final double? rate;
  bool isChoose;
  FoodItem(
      {super.key,
      required this.updateStatusItem,
      this.id,
      this.name,
      this.category,
      this.urlImage,
      this.rate,
      required this.isChoose});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    // return CheckboxListTile(
    //   value: widget.isChoose,
    //   onChanged: (value) {
    //     setState(() {
    //       widget.isChoose = !widget.isChoose;
    //     });
    //     widget.updateStatusItem(widget.id!, widget.isChoose);
    //   },
    //   activeColor: Theme.of(context).primaryColor,
    //   checkColor: Theme.of(context).accentColor,
    //   controlAffinity: ListTileControlAffinity.leading,
    //   title: Text(
    //     widget.name ?? "",
    //     style: const TextStyle(
    //       fontWeight: FontWeight.w500,
    //       fontSize: 18,
    //     ),
    //   ),
    //   subtitle: Text(widget.category!),
    //   contentPadding: const EdgeInsets.all(0),
    //   tristate: true,
    //   secondary: Image.network(widget.urlImage!),
    // );
    return Row(children: [
        
        ListTile(leading: IconButton(icon: Icon(Icons.favorite_outline), onPressed: (){

        },),),
    ],);
  }
}
