import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:job2go_kit/palette.dart';

class LoadingFullState extends StatefulWidget {
  const LoadingFullState({Key? key}) : super(key: key);

  @override
  _LoadingFullStateState createState() => _LoadingFullStateState();
}

class _LoadingFullStateState extends State<LoadingFullState> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SpinKitChasingDots(
            color: Job2goPalette.red,
            size: 50.0,
          ),
          const Text("Memuat data")
        ],
      ),
    );
  }
}

class LoadingOfListState extends StatelessWidget {
  const LoadingOfListState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class LoadingOfListStateMin extends StatelessWidget {
  const LoadingOfListStateMin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class ErrorListState extends StatelessWidget {
  final Function? onTap;
  const ErrorListState({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: GestureDetector(
          onTap: () {
            onTap!();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[
              Icon(Icons.cloud_off),
              Text("Terjadi kesalahan"),
              Text("Sentuh untuk mencoba lagi")
            ],
          ),
        ),
      ),
    );
  }
}

class EndOfListState extends StatelessWidget {
  const EndOfListState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ic_end_of_list.png",
            width: 200,
            height: 60,
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            "- Akhir dari halaman -",
            style: TextStyle(color: Job2goPalette.blackSecondary100),
          ),
        ],
      ),
    );
  }
}

class EmptyFullState extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final Widget? widget;

  const EmptyFullState({Key? key, this.text, this.icon, this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            icon ?? const Icon(Icons.list),
            const SizedBox(
              height: 10,
            ),
            Text(
              text ?? "Tidak ada data",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            widget ?? Container()
          ],
        ),
      ),
    );
  }
}

class ErrorFullState extends StatelessWidget {
  final Function? onTap;
  const ErrorFullState({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Image.asset("assets/images/error_server.png"),
            ),
            const Text("Terjadi kesalahan",
                style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: () {
                onTap!();
              },
              child: const Text("Coba lagi"),
            )
          ],
        ),
      ),
    );
  }
}
