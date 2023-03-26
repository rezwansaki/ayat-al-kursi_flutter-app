import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    title: 'Ayat-Al-Kursi',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //methods
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = AudioCache();
    bool isPlaying = false;
    bool isPaused = false;

    void audioControllPlay() async {
      if (isPlaying == false && isPaused == false) {
        audioPlayer = await audioCache.play('ayat_al_kursi_ghamdi.mp3');
        isPlaying = true;
      }

      audioPlayer.onPlayerCompletion.listen((event) {
        isPlaying = false;
      });
    }

    void audioControllPause() {
      //after play you can pause, otherwise not
      if (isPlaying == true) {
        audioPlayer.pause();
        isPlaying = false;
        isPaused = true;
      } else if (isPaused == true) {
        //after pause you can resume, otherwise not
        audioPlayer.resume();
        isPlaying = true;
        isPaused = false;
      }
    }

    void audioControllStop() {
      //after play you can stop, otherwise not
      if (isPlaying == true || isPaused == true) {
        audioPlayer.stop();
        isPlaying = false;
        isPaused = false;
      }
    }

    //methods for the contents of tabs
    Widget tabContentOne() {
      return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/bg1.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                  style: TextStyle(
                      fontFamily: 'KFGQPCUthmanicScriptHAFS',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                flex: 15,
                child: SingleChildScrollView(
                  child: Text(
                    'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَن ذَا الَّذِي يَشْفَعُ عِندَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ ',
                    style: TextStyle(
                        fontFamily: 'KFGQPCUthmanicScriptHAFS',
                        fontSize: 30.0,
                        color: Colors.deepOrange),
                    textAlign: TextAlign.center,
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: IconButton(
                              onPressed: () => audioControllPause(),
                              icon: Icon(Icons.pause_circle_filled),
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.082,
                              color: Colors.blue[600])),
                      Container(
                          child: IconButton(
                              onPressed: () => audioControllPlay(),
                              icon: Icon(Icons.play_circle_filled),
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.082,
                              color: Colors.blue[600])),
                      Container(
                          child: IconButton(
                              onPressed: () => audioControllStop(),
                              icon: Icon(Icons.stop),
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.082,
                              color: Colors.blue[600]))
                    ],
                  ),
                ))
          ],
        ),
      );
    }

    Widget tabContentTwo() {
      return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/bg1.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.32), BlendMode.dstATop),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'উচ্চারণ:',
                          style: TextStyle(
                              fontFamily: 'SolaimanLipi', //PlayfairDisplay
                              fontSize: 25.0,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      flex: 0,
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'আল্লাহু লা ইলাহা ইল্লা হুওয়াল হাইয়্যূল কাইয়্যূম। লা তা’খুযুহু সিনাত্যুঁও ওয়ালা নাউম। লাহু মা ফিছছামা ওয়াতি ওয়ামা ফিল আরদ্ব। মান যাল্লাযী ইয়াস ফায়ু ইন দাহু ইল্লা বিইযনিহ। ইয়া লামু মা বাইনা আইদীহিম ওয়ামা খল ফাহুম। ওয়ালা ইয়ুহীতুনা বিশাইইম মিন ইলমি হী ইল্লা বিমা শাআ। ওয়াসিয়া কুরসিয়্যুহুস সামাওয়াতি ওয়াল আরদ্ব। ওয়ালা ইয়াউদুহূ হিফযুহুমা, ওয়া হুয়াল আলিয়্যূল আযীম।',
                            style: TextStyle(
                              fontFamily: 'SolaimanLipi', //PlayfairDisplay
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )),
                  SizedBox(height: 15.0),
                  Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'অর্থ‬:',
                          style: TextStyle(
                            fontFamily: 'SolaimanLipi', //PlayfairDisplay
                            fontSize: 25.0,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 0,
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'আল্লাহ ছাড়া অন্য কোনো উপাস্য নেই, তিনি জীবিত, সবকিছুর ধারক। তাঁকে তন্দ্রাও স্পর্শ করতে পারে না এবং নিদ্রাও নয়। আসমান ও যমীনে যা কিছু রয়েছে, সবই তাঁর। কে আছ এমন, যে সুপারিশ করবে তাঁর কাছে তাঁর অনুমতি ছাড়া? দৃষ্টির সামনে কিংবা পিছনে যা কিছু রয়েছে সে সবই তিনি জানেন। তাঁর জ্ঞানসীমা থেকে তারা কোনো কিছুকেই পরিবেষ্টিত করতে পারে না, কিন্তু যতটুকু তিনি ইচ্ছা করেন। তাঁর সিংহাসন সমস্ত আসমান ও যমীনকে পরিবেষ্টিত করে আছে। আর সেগুলোকে ধারণ করা তাঁর পক্ষে কঠিন নয়। তিনিই সর্বোচ্চ এবং সর্বাপেক্ষা মহান।',
                            style: TextStyle(
                              fontFamily: 'SolaimanLipi', //PlayfairDisplay
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget tabContentThree() {
      return Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blue[50],
          child: ListView(
            children: <Widget>[
              Container(
                  child: Column(children: <Widget>[
                Expanded(
                    flex: 0,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'এ্যাপটি সম্পর্কে তথ্য:',
                        style: TextStyle(
                            fontFamily: 'SolaimanLipi',
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                    flex: 0,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'আয়াতুল কুরসী (ভার্সন: ১.০.২)' +
                              '\n' +
                              '০৫-জুন-২০২০' +
                              '\n\n' +
                              'ফীচারসমূহ:' +
                              '\n' +
                              '১. আরবীতে সম্পুর্ন আয়াতুল কুরসী দেয়া আছে। \n' +
                              '২. তেলওয়াত করে শোনাবে। \n' +
                              '৩. বাংলাতে উচ্চারন এবং অর্থ দেয়া আছে। \n' +
                              '৪. আরবী এবং বাংলা ফন্ট এম্বেড করা আছে, ডিভাইসে এই ফন্ট দুইটি না থাকলেও দেখা যাবে। \n'
                                  '৫. রেসপনসিভ করার চেষ্টা করা হয়েছে।' +
                              '\n\n' +
                              'এই এ্যাপটি ডেভেলপ করা হয়েছে ফ্লাটার এবং ডার্ট ব্যবহার করে, আর শুধুমাত্র এন্ড্রয়েড এর জন্য।',
                          style: TextStyle(
                            fontFamily: 'SolaimanLipi',
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )),
                SizedBox(height: 15.0),
                Expanded(
                    flex: 0,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'ডেভেলপার তথ্য:',
                        style: TextStyle(
                            fontFamily: 'SolaimanLipi',
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                    flex: 0,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'মোঃ রেজওয়ার সাকী এলিন' + '\n' + 'www.alinsworld.com',
                          style: TextStyle(
                            fontFamily: 'SolaimanLipi',
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )),
              ]))
            ],
          ));
    }
    //end of methods

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: Text(
              'আয়াতুল কুরসী',
              style: TextStyle(
                fontFamily: 'SolaimanLipi', //PlayfairDisplay
                fontSize: MediaQuery.of(context).size.width * 0.058,
                color: Colors.white,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.home,
                size: MediaQuery.of(context).size.width * 0.058,
              )),
              Tab(
                  icon: Icon(
                Icons.import_contacts,
                size: MediaQuery.of(context).size.width * 0.058,
              )),
              Tab(
                  icon: Icon(
                Icons.info,
                size: MediaQuery.of(context).size.width * 0.058,
              )),
            ],
          ),
        ),
        body: TabBarView(
            children: [tabContentOne(), tabContentTwo(), tabContentThree()]),
      ),
    );
  }
}
