import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.height,
    this.maxLines = 1,
    this.onSaved,
    required this.controller,
    required this.keyboardType,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.errorText,
    this.validate,
  });
  final FormFieldValidator<String>? validate;
  final bool obscureText;
  final String height;
  final String? errorText;
  final Function()? onTap;
  final int maxLines;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        obscuringCharacter: "*",
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        onSaved: onSaved,
        validator: validate,
        maxLines: maxLines,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            errorText: errorText,
            isDense: true, //بتصغر الحجم
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.amber,
            suffixIcon: suffixIcon,
            hintText: height,
            label: Text(height),
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            disabledBorder:
                buildBorder(Theme.of(context).colorScheme.onPrimary),
            enabledBorder: buildBorder(Theme.of(context).colorScheme.primary),
            focusedBorder: buildBorder(Colors.grey),
            errorBorder: buildBorder(Theme.of(context).colorScheme.error),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2)),
        // inputFormatters: [
        //   FilteringTextInputFormatter.digitsOnly,
        // ],
        // textCapitalization: TextCapitalization.words ,      الحروف كبتل
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
