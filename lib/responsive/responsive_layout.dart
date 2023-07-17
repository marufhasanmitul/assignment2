import 'package:flutter/cupertino.dart';



class ResponsiveLayout extends StatelessWidget {


  final Widget PortraitBody;
  final Widget LandscapeBody;


  const ResponsiveLayout({required this.PortraitBody,required this.LandscapeBody});

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder:(BuildContext context, Orientation orientation){
          if(orientation==Orientation.portrait){
            return PortraitBody;
          }else{
            return LandscapeBody;
          }
        }

    );
  }
}
