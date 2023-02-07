import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/Testing_concepts/providers/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProvider extends StatelessWidget {
  const TestProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyData(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: CustomColors.PRIMARY,
              title: Consumer<MyData>(
                builder: (context, value, child) {
                  return Text(value.name);
                },
              )),
          body: const Screen2(),
        );
      },
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen3();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen4();
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen5();
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Scrren 05'),
          // ignore: deprecated_member_use
          RaisedButton(
              child: const Text('Change Title'),
              onPressed: () {
                context.read<MyData>().changeName(DateTime.now().toString());
              })
        ],
      ),
    );
  }
}
