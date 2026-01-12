// import 'package:flutter/material.dart';
// import 'package:gate_entry/utils/fonts.dart';
// class CustomTextFieldCard extends StatelessWidget {
//   final String hintText;
//   final TextEditingController? controller;
//   final Function(String)? onChanged;
//   final Icon? iconText;
//
//   // New optional parameters
//   final TextInputType inputType;   // keyboard type
//   final bool obscureText;          // hide text for password
//
//   const CustomTextFieldCard({
//     super.key,
//     required this.hintText,
//     this.controller,
//     this.onChanged,
//     this.iconText,
//     this.inputType = TextInputType.text, // default: normal text
//     this.obscureText = false,            // default: not obscured
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: TextFormField(
//           controller: controller,
//           onChanged: onChanged,
//           keyboardType: inputType,
//           obscureText: obscureText,
//           style: CommonText.textDataBlock12B(),
//           decoration: InputDecoration(
//             hintText: hintText,
//             icon: iconText,
//             isDense: true,
//             hintStyle: CommonText.textDataBlock12(),
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:ge_process/utils/fonts.dart';

class CustomTextFieldCard extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Icon? iconText;
  final int? textLength;

  // Optional parameters
  final TextInputType inputType;   // keyboard type
  final bool obscureText;          // hide text for password

  const CustomTextFieldCard({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.iconText,
    this.textLength,
    this.inputType = TextInputType.text, // default: normal text
    this.obscureText = false,            // default: not obscured
  });

  @override
  State<CustomTextFieldCard> createState() => _CustomTextFieldCardState();
}

class _CustomTextFieldCardState extends State<CustomTextFieldCard> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.inputType,
          obscureText: _obscureText,
          textAlignVertical: TextAlignVertical.center,
          maxLength: widget.textLength,

          style: CommonText.textDataBlock12B(),
          decoration: InputDecoration(
counterText: "",
            hintText: widget.hintText,
            icon: widget.iconText,
            isDense: true,
            hintStyle: CommonText.textDataBlock12(),
            border: InputBorder.none,

            suffixIcon: widget.obscureText
                ? InkWell(
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ),
    );
  }
}
