

import 'package:shared_preference_example/export/exports.dart';

class MyPersistanceStorage extends StatefulWidget {

  @override
  _MyPersistanceStorageState createState() => _MyPersistanceStorageState();
}

class _MyPersistanceStorageState extends State<MyPersistanceStorage> {
  int? _counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Shared Preferences",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter != null
                  ? "Counter: $_counter"
                  : "Click The Button To Show Counter",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 30.0,
              ),
            ),
            ElevatedButton(
              onPressed: _incrementCounterWithSharedPreferences,
              child: Text(_counter == null ? "Show Counter !" : "Increment !"),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
            )
          ],
        ),
      ),
    );
  }

  _incrementCounterWithSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = (prefs.getInt('qiymat') ?? 0) + 1;
    debugPrint("Counterning Qiymati: $_counter");
    await prefs.setInt('qiymat', _counter!);
    setState(() {});
  }
}
