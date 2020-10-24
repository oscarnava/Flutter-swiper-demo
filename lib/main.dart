import 'package:flutter/material.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_control.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_controller.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_pagination.dart';
import 'swiper/swiper.dart';

void main() {
  runApp(MyApp());
}

class Book {
  String title;
  int pages;
  Book(String title, int pages) {
    this.title = title;
    this.pages = pages;
  }
}

class CustomSwiperController extends SwiperController {
  @override
  Future next({bool animation: true}) {
    print('controller.next');
    return super.next(animation: animation);
  }

  @override
  Future previous({bool animation: true}) {
    print('controller.previous');
    return super.previous(animation: animation);
  }

  void complete() {
    print('controller.complete');
    super.complete();
  }
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Book> books = [Book('The Lord of the rings', 3), Book('The shining', 2), Book('Flores para Algernon', 1)];
  
  Widget makePage(int page) {
    return Container(
      color: Colors.grey,
      child: Center(
        child:
          Text('This is page $page',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = books.map((book) => book.pages).fold(0, (sum, i) => sum + i);

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          print('Tap!');
        },
        child: Swiper(
          layout: SwiperLayout.TINDER,
          itemWidth: double.infinity,
          itemHeight: double.infinity,
          itemBuilder: (BuildContext context, int index){
            return makePage(index);
            // return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fitWidth);
          },
          index: 3,
          itemCount: totalPages,
          loop: false,
          pagination: SwiperPagination(),
          controller: CustomSwiperController(),
          onIndexChanged: (index){
            print('Index changed to $index!');
          },
        ),
      ),
    );
  }
}
