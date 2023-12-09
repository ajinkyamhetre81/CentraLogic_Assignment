import 'package:flutter/material.dart';

Widget customAppBar(context, String title) {
  return LayoutBuilder(builder: (context, constraints) {
    return constraints.maxWidth > 700
        ? const SizedBox(
            height: 0,
            width: 0,
          )
        : Container(
            child: AppBar(
              title: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
  });
}

Widget customListTile(title, subtitle) {
  return ListTile(
    leading: Image.asset(
      "images/pdflogo.png",
      height: 34,
      width: 34,
      fit: BoxFit.contain,
    ),
    contentPadding: const EdgeInsets.all(0),
    minVerticalPadding: 0,
    title: Text(title + ".pdf"),
    subtitle: Text(subtitle),
    trailing: InkWell(
      onTap: () {},
      child: Image.asset("images/eye.png"),
    ),
  );
}
