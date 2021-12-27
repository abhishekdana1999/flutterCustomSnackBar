import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  _showSnackBar(
      {@required title,
      @required text,
      iconColor = null,
      textColor = null,
      backgroundColor = null}) {
    debugPrint(text.toString().length.toString());
    return ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      backgroundColor: backgroundColor != null
          ? backgroundColor.withOpacity(0.8)
          : Colors.white,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: Duration(seconds: 5),
      content: Container(
        height: text.toString().length >= 100 ? 100 : 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: iconColor != null ? iconColor : Colors.grey[850],
                size: 24,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor != null
                                ? textColor
                                : Colors.grey[850]),
                      ),
                      SizedBox(height: 5),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          text,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: textColor != null
                                  ? textColor
                                  : Colors.grey[600]),
                        ),
                      )
                    ]),
              )
            ]),
      ),
      action: SnackBarAction(
        textColor: textColor != null ? textColor : Colors.grey[850],
        label: "Close",
        onPressed: () => {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showSnackBar(
                  title: "Important Update",
                  text: "Here comes some message.",
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: Colors.blue),
              child: Text('Info Snackbar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(
                  title: "Important Update",
                  text: "Here comes some message.",
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: Colors.green[600]),
              child: Text('Success Snackbar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(
                  title: "Important Update",
                  text: "Here comes some message.",
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: Colors.yellow[700]),
              child: Text('Warning Snackbar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(
                  title: "Important Update",
                  text: "Here comes some message.",
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  backgroundColor: Colors.red[700]),
              child: Text('Danger Snackbar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
