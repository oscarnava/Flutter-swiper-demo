import 'package:flutter/material.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_control.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_controller.dart';
import 'package:flutter_torre_swipper_app/swiper/swiper_pagination.dart';
import 'swiper/swiper.dart';

void main() {
  runApp(MyApp());
}

class Quotes {
  String source;
  Color color;
  List<String> quotes;
  Quotes(String title, Color color, List<String> quotes) {
    this.source = title;
    this.color = color;
    this.quotes = quotes;
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
  List<Quotes> quotes = [
    Quotes(
      'The Lord of the rings',
      Colors.brown.shade500,
      [
        'There is only one Lord of the Ring, only one who can bend it to his will. And he does not share power.',
        'That there’s some good in this world, Mr. Frodo… and it’s worth fighting for.',
        'Even the smallest person can change the course of the future.',
        'The time of the Elves… is over. Do we leave Middle-Earth to its fate? Do we let them stand alone?',
        'We swears, to serve the master of the Precious. We will swear on… on the Precious!',
        'I am Gandalf the White. And I come back to you now… at the turn of the tide.',
        'Oh, it’s quite simple. If you are a friend, you speak the password, and the doors will open.',
        'Well, what can I tell you? Life in the wide world goes on much as it has this past Age, full of its own comings and goings, scarcely aware of the existence of Hobbits, for which I am very thankful.',
        'For the time will soon come when Hobbits will shape the fortunes of all.',
        'There is no curse in Elvish, Entish, or the tongues of Men for this treachery.',
      ],
    ),
    Quotes(
      'The shining',
      Colors.blueGrey,
      [
        'Jack Torrance: Heeere\'s Johnny!',
        'Nurse: Who\'s Tony?\nDanny Torrance: He\'s the little boy that lives in his mouth.',
        'Wendy? Darling? Light, of my life. I\'m not gonna hurt ya. You didn\'t let me finish my sentence. I said, I\'m not gonna hurt ya. I\'m just going to bash your brains in.',
      ],
    ),
    Quotes('Flowers for Algernon', Colors.blueAccent, [
      'I don’t know what’s worse: to not know what you are and be happy, or to become what you’ve always wanted to be, and feel alone.',
      'I am afraid. Not of life, or death, or nothingness, but of wasting it as if I had never been.',
      'Thank God for books and music and things I can think about.',
      'Now I understand that one of the important reasons for going to college and getting an education is to learn that the things you\'ve believed in all your life aren\'t true, and that nothing is what it appears to be.',
      'Intelligence is one of the greatest human gifts. But all too often a search for knowledge drives out the search for love. This is something else I\'ve discovered for myself very recently. I present it to you as a hypothesis: Intelligence without the ability to give and receive affection leads to mental and moral breakdown, to neurosis, and possibly even psychosis. And I say that the mind absorbed in and involved in itself as a self-centered end, to the exclusion of human relationships, can only lead to violence and pain.',
      'How strange it is that people of honest feelings and sensibilty, who would not take advantage of a man born without arms or legs or eyes—how such people think nothing of abusing a man with low intelligence.',
    ]),
    Quotes('2001: A Space Odyssey', Colors.amberAccent.shade100, [
      'Bowman: "My God, it\'s full of stars!"',
      'Bowman: Open the pod bay doors, HAL.\nHAL 9000: I\'m sorry, Dave. I\'m afraid I can\'t do that.',
      'HAL 9000: I know I\'ve made some very poor decisions recently, but I can give you my complete assurance that my work will be back to normal. I\'ve still got the greatest enthusiasm and confidence in the mission. And I want to help you.',
      'Bowman: HAL 9000: Good morning, Dave.',
      'Mission Controller: [Last Lines] Eighteen months ago the first evidence of intelligent life off the Earth was discovered. It was buried 40 feet below the lunar surface near the crater Tycho. Except for a single very powerful radio emission aimed at Jupiter the four-million year old black monolith has remained completely inert. Its origin and purpose are still a total mystery...',
      'HAL 9000: Look Dave, I can see you\'re really upset about this. I honestly think you ought to sit down calmly, take a stress pill, and think things over.',
    ],)
  ];

  Widget makePage(int bookIndex, int page) {
    return Container(
      color: quotes[bookIndex].color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 48, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quotes from "${quotes[bookIndex].source}"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                quotes[bookIndex].quotes[page],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = quotes.map((book) => book.quotes.length).fold(0, (sum, i) => sum + i);

    return Scaffold(
      appBar: AppBar(
        title: Text('Swiper demo'),
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          print('Tap!');
        },
        child: Swiper(
          layout: SwiperLayout.TINDER,
          itemWidth: double.infinity,
          itemHeight: double.infinity,
          itemBuilder: (BuildContext context, int bookIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int page) => makePage(bookIndex, page),
                itemCount: quotes[bookIndex].quotes.length,
                autoplay: true,
                autoplayDisableOnInteraction: true,
                duration: 1000,
                autoplayDelay: 10000,
                pagination: SwiperPagination(
                  alignment: Alignment.topCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white38,
                    activeColor: Colors.white,
                    size: 7,
                    activeSize: 8,
                    space: 0,
                  )
                ),
                control: SwiperControl(
                  color: Colors.yellow.shade500
                ),
              ),
            );
            // return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fitWidth);
          },
          itemCount: quotes.length,
          loop: false,
          pagination: SwiperPagination(
              alignment: Alignment.topCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.white38,
                activeColor: Colors.yellow,
                size: 7,
                activeSize: 8,
                space: 1,
              )
          ),
          controller: CustomSwiperController(),
          onIndexChanged: (index) {
            print('Index changed to $index!');
          },
        ),
      ),
    );
  }
}
