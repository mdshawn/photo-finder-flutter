import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:photo_finder/gallery_state.dart';
import 'package:photo_finder/gallery_view.dart';
import 'package:photo_finder/pages/developer.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GalleryState()),
      ],
      child: SearchPage(),
    ),
  );
}

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(   
              primarySwatch: Colors.indigo,
              fontFamily: 'Sedgwick Ave',
 ), 
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Photo Finder",
            style: GoogleFonts.sedgwickAve(textStyle: TextStyle(color: Colors.white)), 
            
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
                constraints:
                    BoxConstraints.tightFor(width: 200.0, height: 200.0),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Image.network(
                  "https://i.ibb.co/qx8ksHq/96859873.jpg",
                  fit: BoxFit.scaleDown,
                ),
                ),),
            ListTile(
              title: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Eg Birds, River & Sky",
                  labelText: "Enter a category",
                  contentPadding:
                      const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (_searchController != null) {
                    Get.to(() => GalleryView(searchdata: _searchController.text));
                  }
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GalleryView(searchdata: _searchController.text)));
                  
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Search",style: GoogleFonts.sedgwickAve(
    textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
  ),),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(icon: Icon(Icons.help), onPressed: () {}),
        Spacer(),
        IconButton(icon: Icon(Icons.people), onPressed: () {
          Get.to(DevContact());
        }),
      ],
    ),
  ),
  floatingActionButton:
      FloatingActionButton(child: Icon(Icons.home), onPressed: () {}),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
