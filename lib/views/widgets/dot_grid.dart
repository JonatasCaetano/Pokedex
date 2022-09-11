// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DotGrid extends StatelessWidget {
  const DotGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(2.5),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 36,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(234, 104, 109, 0.1),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
