import 'main.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'styles.dart';

class ColoringBookRenderer extends StatelessWidget {
  final double offset;
  final double cardWidth;
  final double cardHeight;
  final Art art;

  const ColoringBookRenderer(this.offset, {Key key, this.cardWidth = 250, @required this.art, this.cardHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(top: 8),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: <Widget>[
          // Card background color & decoration
          Container(
            margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(
              color: art.color,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4 * offset.abs()),
                BoxShadow(color: Colors.black12, blurRadius: 10 + 6 * offset.abs()),
              ],
            ),
          ),
          // City image, out of card by 15px
          Positioned(top: -15, child: _buildCityImage()),
          // City information
          _buildCityData()
        ],
      ),
    );
  }

  Widget _buildCityImage() {
    double maxParallax = 30;
    double globalOffset = offset * maxParallax * 2;
    double cardPadding = 28;
    double containerWidth = cardWidth - cardPadding;
    return Container(
      height: cardHeight,
      width: containerWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
//          _buildPositionedLayer("images/${city.name}/${city.name}-Back.png", containerWidth * .8, maxParallax * .1, globalOffset),
          _buildPositionedLayer("images/${art.title}-Middle.png", containerWidth * .9, maxParallax * .6, globalOffset),
//          _buildPositionedLayer("images/${city.name}/${city.name}-Front.png", containerWidth * .9, maxParallax, globalOffset),
        ],
      ),
    );
  }

  Widget _buildCityData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // The sized box mock the space of the city image
        SizedBox(width: double.infinity, height: cardHeight * .57),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(art.title, style: Styles.cardTitle, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(art.description, style: Styles.cardSubtitle, textAlign: TextAlign.center),
        ),
        Expanded(child: SizedBox(),),
        FlatButton(
          disabledColor: Colors.transparent,
          color: Colors.transparent,
          child: Text(''.toUpperCase(), style: Styles.cardAction),
          onPressed: null,
        ),
        SizedBox(height: 8)
      ],
    );
  }

  Widget _buildPositionedLayer(String path, double width, double maxOffset, double globalOffset) {
    double cardPadding = 24;
    double layerWidth = cardWidth - cardPadding;
    return Positioned(
        left: ((layerWidth * .5) - (width / 2) - offset * maxOffset) + globalOffset,
        bottom: cardHeight * .45,
        child: Image.asset(
          path,
          width: width,
          package: DrawApp.pkg,
        ));
  }
}
