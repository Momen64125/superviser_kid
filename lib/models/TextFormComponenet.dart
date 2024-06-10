import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class TextFormComponenet extends StatefulWidget {
  String labelText;
  TextInputType keyboardType;
  var controller = TextEditingController();
  bool isPassword;
  Validator validator;
  Icon? prefexIcon;

  TextFormComponenet(
      {required this.labelText,
        required this.controller,
        this.isPassword = false,
        this.keyboardType = TextInputType.text,
        required this.validator,
        this.prefexIcon});

  @override
  State<TextFormComponenet> createState() => _TextFormComponenetState();
}

class _TextFormComponenetState extends State<TextFormComponenet> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: passwordVisible,
        decoration: InputDecoration(
            prefixIcon: widget.prefexIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: passwordVisible == true
                  ? Icon(
                  Icons.visibility_off) //Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(width: 4, color: Colors.black12)),
            hintText: widget.labelText,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith()),
      ),
    );
  }
// void onPressed()
// {
//   if(_formKey.currentState!.validate())
//     {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Processing Data')));
//     }
// }
}