import 'package:flutter/material.dart';
import 'package:gst_app/utility/resources/size_constant.dart';

class CardItem extends StatelessWidget {
  final String? value;
  final String? label;
  final int maxLine;

  const CardItem(
      {Key? key, @required this.label, @required this.value, this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizeUtil.paddingHorizontal10Vertical8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
          ),
          const SizedBox(height: 5),
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
          )
        ],
      ),
    );
  }
}
