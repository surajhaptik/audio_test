import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // audioPlayer.onDurationChanged.listen((Duration duration) {
    //   log(duration.toString());
    // });
    // audioPlayer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            Duration? duration = await audioPlayer.setUrl(
              "https://interaktstorage.blob.core.windows.net/mediastoragecontainer/91e5634a-33b0-44b4-a075-884778f02feb%2Finbox_customer_to_agent%2Fc69e2edc35d343f19b087eaf25050a47.ogg?sv=2019-12-12&se=2029-06-06T06%3A29%3A20Z&sr=b&sp=r&rsct=audio%2Fogg%3B+codecs%3Dopus&sig=ZTdekwQWDDmDf9XSmRdRsRzfMl3eUsTncQFgYiCyrNk%3D",
            );

            log(duration.toString());

            audioPlayer.play();
          },
          child: const Text('Play'),
        ),
      ),
    );
  }
}
