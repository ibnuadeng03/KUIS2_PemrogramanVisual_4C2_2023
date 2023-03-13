import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String> data = []; //data untuk listview
  int idx = 0; //index yang aktif

  //isi body akan sesuai index
  static const List<Center> halaman = [
    Center(child: Text("satu")),
    Center(child: Text("dua"))
  ];

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // isi data listview
    for (int i = 0; i < 5; i++) {
      data.add("Video $i ");
      data.add("Delete");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(14),
                child: Text(data[index]),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: idx,
            selectedItemColor: Colors.red,
            onTap: onItemTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: " Programme"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: " School"),
            ]),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 13 KOM-4C2 2023'),
            content: const Text(
                '1. Muhammad Firdaus - 2101995 - muhamadfirdaus04@upi.edu;' +
                    "\n" +
                    '2. Ibnu Adeng Kurnia - 2101769 - ibnuadeng0303@upi.edu'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              '"Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang"'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
