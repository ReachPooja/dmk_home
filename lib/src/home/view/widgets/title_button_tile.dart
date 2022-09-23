import 'package:dmk_home/src/home/view/home_view.dart';
import 'package:dmk_home/src/home/view/widgets/title_text.dart';
import 'package:flutter/material.dart';

class TitleButtonTile extends StatelessWidget {
  const TitleButtonTile({
    super.key,
    required this.label,
    required this.buttonLabel,
  });

  final String label;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ).copyWith(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TitleText(title: label),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: primaryColor,
              ),
            ),
            child: Text(
              buttonLabel,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
