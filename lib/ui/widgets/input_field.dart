import 'package:flutter/material.dart';
import 'package:gst_app/utility/color_util.dart';
import 'package:gst_app/utility/resources/size_constant.dart';

class InputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;

  InputField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.labelText})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),
        Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextField(
            controller: widget.textEditingController,
            style: const TextStyle(
              fontSize: AppSizeUtil.hint,
              color: AppColors.titleText,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.smokeWhiteInputField,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
