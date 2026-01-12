import 'package:flutter/material.dart';
import 'package:ge_process/utils/fonts.dart';

class CustomDropdownCard extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String>? items; // <-- nullable list (fixes your error)
  final Function(String?) onChanged;

  const CustomDropdownCard({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: 35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: DropdownButtonFormField<String>(
            value: value,
            isDense: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: CommonText.textDataBlock12(),

            hint: Text(
              hintText,
              style: CommonText.textDataBlock12(),
            ),

            // SAFE: items ?? [] prevents null crash
            items: (items ?? []).map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: CommonText.textDataBlock12()
                ),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}