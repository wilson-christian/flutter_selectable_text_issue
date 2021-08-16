import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Selectable Scroll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> separatedText = [
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: 170,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(text: separatedText[0]),
                  TextSpan(
                    text: separatedText[1],
                    style: TextStyle(color: Colors.pink),
                  ),
                  TextSpan(text: separatedText[2]),
                ],
              ),
              onSelectionChanged: (selection, cause) {

                // TRIED BELOW SOLUTION BUT IT FLICKERS IN SOME DEVICES

                // Future.delayed(const Duration(milliseconds: 10), () {
                //   _scrollController.jumpTo(_scrollController.offset);
                // });
              },
              key: ValueKey("selectableText"),
              // scrollPhysics: NeverScrollableScrollPhysics(),
              toolbarOptions: ToolbarOptions(
                  copy: false, cut: false, selectAll: false, paste: false),
            ),
          ),
        ),
      ),
    );
  }
}
