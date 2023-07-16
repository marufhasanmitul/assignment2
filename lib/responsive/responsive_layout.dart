import 'package:flutter/cupertino.dart';

import 'dimention.dart';

class ResponsiveLayout extends StatelessWidget {


  final Widget PortraitBody;
  final Widget LandscapeBody;

  const ResponsiveLayout({required this.PortraitBody,required this.LandscapeBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraints){
          if(constraints.maxWidth<mobileWidth){
            return PortraitBody;
          }else{
            return LandscapeBody;
          }
        }

    );
  }
}
