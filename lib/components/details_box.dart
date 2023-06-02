import 'package:flutter/material.dart';

class DetailsBox extends StatelessWidget {
  final List<Widget> children;

  const DetailsBox({super.key, required this.children});

  @override
  build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(
            color: Colors.black,
            width: 4.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: children,
          ),
        ),
      ),
    );
  }
}
