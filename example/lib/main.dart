import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_more_plus/read_more_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read More Example',
      debugShowCheckedModeBanner: false,

      /// assigned a custom ThemeData to the project
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()

          /// imported the poppins text them to the application
          ),
      home: const MyHomePage(title: 'Read More Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// sample text to use
  String text =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ";

  @override
  Widget build(BuildContext context) {
    /// get the size of the available screen
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.85,
              child: ReadMore(text: text),

              ///use ReadMore plugin default widget
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.85,
              child: ReadMore(
                text: text,
                maxLines: 3,

                /// set the number of lines to 3
                readMoreTextColor: Colors.redAccent,
                expandedText: 'show less',

                /// change the Read less label to show less
                collapsedText: 'show more',

                /// change the Read more label to show more
                ///customize the appearance of the text
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.deepPurple, fontSize: size.height * 0.014),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
