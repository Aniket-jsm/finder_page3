import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, String>> imageList = <Map<String, String>>[
    {
      'image': 'pics/photo.png',
      'text': 'Image 1',
    },
    {
      'image': 'pics/photo1.png',
      'text': 'Image 2',
    },
    {
      'image': 'pics/photo2.png',
      'text': 'Image 1',
    },
    {
      'image': 'pics/photo3.png',
      'text': 'Image 2',
    },
    // Add more image-text pairs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Who Liked Me',
                style: TextStyle(fontSize: 26.0)), // Larger title
            SizedBox(width: 8.0),
          ],
          crossAxisAlignment: CrossAxisAlignment.start, //
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Image.asset('pics/sort.png', width: 40.0, height: 40.0),
          ),
        ],
      ),
      // automaticallyImplyLeading:
      //     true, // Set to true to align the title to the left
      // ),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Profile'),
              Tab(text: 'Event'),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Profile Tab Content')),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              imageList[index]['image'] ??
                                  '', // Use null-aware operator
                              fit: BoxFit.cover,
                              width: 157,
                              height: 224.0,
                            ),
                          ),
                          Container(
                            //color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Text(
                              imageList[index]['text'] ??
                                  '', // Use null-aware operator
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('pics/foot1.png', height: 20, width: 20),
            Image.asset('pics/foot2.png', height: 20, width: 20),
            Image.asset('pics/foot3.png', height: 20, width: 20),
            Image.asset('pics/foot4.png', height: 20, width: 20),
            Image.asset('pics/foot5.png', height: 20, width: 20),
          ],
        ),
      ),
    );
  }
}
