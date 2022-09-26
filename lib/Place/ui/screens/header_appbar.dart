import 'package:flutter/material.dart';
import 'package:platzi_app/widgets/gradient_back.dart';
import 'package:platzi_app/Place/ui/widgets/card_image_list.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Bienvenido", 250.0),
        CardImageList()
      ],
    );
  }

}