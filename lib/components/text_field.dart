import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.name, this.price, this.fun,{Key? key}) : super(key: key);

  var name = TextEditingController();
  var price = TextEditingController();
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: name,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter number',
            ),
          ),
        ),
        ElevatedButton(onPressed: fun, child: Text("Add"))
      ],
    );
  }
}
