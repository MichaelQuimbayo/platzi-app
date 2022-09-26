import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  bool _state = false;


  void onPressedFav(){

    setState((){
      _state = !_state;
    });

    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              _state?"Agregaste a tus Favoritos":"Eliminaste de favoritos",
            style: TextStyle(
              fontFamily: 'IBMPlexSans',
              fontStyle: FontStyle.italic,
            ),
          ),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
        _state?Icons.favorite_outlined:Icons.favorite_border
      ),
    );
  }

}