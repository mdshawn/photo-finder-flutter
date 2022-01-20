import 'package:flutter/material.dart';
import 'package:photo_finder/gallery_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class FullView extends StatelessWidget {
  const FullView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: Consumer<GalleryState>(builder: (context,state, child)=>Container(
         
        child: PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children:[
        Center(
          child: PhotoView(
      imageProvider: NetworkImage(state.links[state.selectorIndex]),
    )
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
    ),
      ),),
    );
  }
}