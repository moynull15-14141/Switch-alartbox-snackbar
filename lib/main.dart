import 'package:flutter/material.dart';

void main() {
  runApp(const Tst1());
}

class Tst1 extends StatefulWidget {
  const Tst1({super.key});

  @override
  State<Tst1> createState() => _Tst1State();
}

class _Tst1State extends State<Tst1> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Switch | Alart | Snackbar'),
            centerTitle: true,
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                  value: _value,
                  onChanged: (bool val) {
                    setState(() {
                      _value = val;
                      print(val);
                    });
                  }),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AD(),
                ],
              ),
              const SizedBox(
                width: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Sk()],
              )
              //     child: Text("click"))
            ],
          ),
        ),
      ),
    );
  }
}

class AD extends StatelessWidget {
  const AD({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlartDialog Title'),
                content: const Text('AlartDailog Discription'),
                actions: <Widget>[
                  ElevatedButton(
                      onPressed: () => Navigator.pop(
                            context,
                          ),
                      child: const Text('Yes')),
                  ElevatedButton(
                      onPressed: () => Navigator.pop(
                            context,
                          ),
                      child: const Text('No'))
                ],
              ),
            ),
        child: const Text("click"));
  }
}

class Sk extends StatelessWidget {
  const Sk({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
