

import 'package:shared_preference_example/export/exports.dart';


class MyPersistanceStorage2 extends StatefulWidget {
  @override
  _MyPersistanceStorage2State createState() => _MyPersistanceStorage2State();
}

class _MyPersistanceStorage2State extends State<MyPersistanceStorage2> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _idController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  bool _onlineMi = false;
  var mySharedPreferences;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
        .then((value) => mySharedPreferences = value);
  }

  @override
  void dispose() {
    mySharedPreferences.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Shared Preferences With Example Game",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FOR ID INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ID....",
                  label: Text("ID"),
                ),
                controller: _idController,
              ),
            ),
            // FOR USERNAME INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "USERNAME....",
                  label: Text("USERNAME"),
                ),
                controller: _usernameController,
              ),
            ),
            CheckboxListTile(
              value: _onlineMi,
              onChanged: (value) {
                setState(() {
                  _onlineMi = !_onlineMi;
                });
              },
              title: const Text("Online / Offline ?"),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _qosh,
                  child: const Text("Add User !"),
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                ),
                ElevatedButton(
                  onPressed: _korsat,
                  child: const Text("Show User !"),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: _ochir,
                  child: const Text("Delete User !"),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Center(
              child: OutlinedButton(
                child: const Text("Sign In"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _qosh() async {
    _formKey.currentState!.save();
    await (mySharedPreferences as SharedPreferences)
        .setString("username", _usernameController.text);
    await (mySharedPreferences as SharedPreferences)
        .setInt("id", int.parse(_idController.text));
    await (mySharedPreferences as SharedPreferences)
        .setBool("online", _onlineMi);
  }

  void _korsat() async {
    debugPrint("Username: " +
        (mySharedPreferences as SharedPreferences)
            .getString("username")
            .toString());
    debugPrint("ID: " +
        (mySharedPreferences as SharedPreferences).getInt("id").toString());
    debugPrint("Online: " +
        (mySharedPreferences as SharedPreferences)
            .getBool("online")
            .toString());
  }

  void _ochir() async {
    await (mySharedPreferences as SharedPreferences).remove('username');

    await (mySharedPreferences as SharedPreferences).remove('id');

    await (mySharedPreferences as SharedPreferences).remove('online');
  }
}
