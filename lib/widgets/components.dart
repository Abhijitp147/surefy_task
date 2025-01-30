import 'package:flutter/material.dart';

class Components extends StatelessWidget {
  final String option;
  final String isActive;
  final void Function() onTap;
  const Components(
      {super.key,
      required this.option,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: isActive == option ? const Color(0xff5864F8) : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  option,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );

    // return Container(
    //   // height: double.infinity,
    //   decoration: BoxDecoration(
    //       color: Colors.grey, borderRadius: BorderRadius.circular(25)),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 8),
    //     child: Row(
    //       children: [Text(option), Icon(Icons.arrow_drop_down_outlined)],
    //     ),
    //   ),
    // );
  }
}
