import 'package:flutter/material.dart';
import 'fetch_cats.dart';
import 'scroll.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<String>> futureCats;

  @override
  void initState() {
    super.initState();
    futureCats = getCats();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<String>>(
                future: futureCats,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ScrollableImages(imageUrls: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    futureCats = getCats();
                  });
                },
                child: Text('Refresh'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background color
                  onPrimary: Colors.white, // text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
