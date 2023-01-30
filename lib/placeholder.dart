import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/image_border_big.png"),
        Image.asset("assets/images/image_placeholder_big.png"),
      ],
    );
  }
}

class ImagePlaceholderNoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          "https://app-prod.job2go.net/uploaded-pictures/202011/eWzRJH-8Rs6I_oPMl-OVLQ.jpg"),
    );
  }
}

class IconFailedLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.warning_rounded,
        color: Colors.yellow[800],
      ),
    );
  }
}
