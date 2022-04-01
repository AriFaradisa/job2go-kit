library job2go_kit;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job2go_kit/state.dart';

typedef RefreshCallback = Future<void> Function();

enum PageState {
  /// state ketika list loading
  loading,

  /// state ketika list terjadi error
  error,

  /// state ketika list menampilkan konten
  content,

  /// state ketika list kosong
  empty,
}

class Job2GoScrollView extends StatefulWidget {
  /// Digunakan untuk mendapatkan collback ketika list di Pull Refresh
  final RefreshCallback onRefreshed;

  /// Gunakan [Job2GoScrollController] untuk mengambil beberapa item yang dibutuhkan seperti:
  /// limit, page, items (data dari list)
  final Job2GoScrollController controller;

  /// Digunakan untuk mendapatkan collback ketika Load More gagal di load. Function ini secara default
  /// memanggil function onLoadMore jikaa tidak di override
  final Function? onErrorList;

  /// Digunakan untuk mendapatkan collback ketika initial data gagal di load. Function ini secara default
  /// memanggil function onRefreshed jika tidak di override
  final Function? onError;

  /// Default value = "assets/images/empty_data.png"
  final String imageAsset;

  /// Default value = "Belum ada data"
  final String text;

  /// Digunakan untuk membuat item list. Function ini harus memiliki return [Widget]
  final Function itemBuilder;

  /// Function ini digunakan ketika list telah mencapai ujung list paling bawah
  final Function onLoadMore;

  /// Jika [hasFilter=true], maka akan muncul Floating Button filter. Default value [false]
  final bool hasFilter;

  /// Default value = "Filter"
  final String? leftText;

  /// Default value = "Urutkan"
  final String? rightText;

  /// Default value = Icons.sort, Gunakan [IconData] untuk mengoverride icon ini
  final IconData? leftIcon;

  /// Default value = Icons.filter_alt_outlined, Gunakan [IconData] untuk mengoverride icon ini
  final IconData? rightIcon;

  /// Digunakan untuk mendapatkan collback ketika tombol filter sebelah kiri di tekan
  final Function? onLeftClick;

  /// Digunakan untuk mendapatkan collback ketika tombol filter sebelah kanan di tekan
  final Function? onRightClick;

  const Job2GoScrollView(
      {Key? key,
      required this.controller,
      required this.onRefreshed,
      this.onErrorList,
      this.onError,
      required this.itemBuilder,
      required this.onLoadMore,
      this.hasFilter = false,
      this.imageAsset = "assets/images/empty_data.png",
      this.text = "Belum ada data",
      this.leftText = "Filter",
      this.rightText = "Urutkan",
      this.leftIcon = Icons.sort,
      this.rightIcon = Icons.filter_alt_outlined,
      this.onLeftClick,
      this.onRightClick})
      : super(key: key);

  @override
  State<Job2GoScrollView> createState() => _Job2GoScrollViewState();
}

class _Job2GoScrollViewState extends State<Job2GoScrollView> {
  ScrollController scrollController = ScrollController();
  List<dynamic> items = [];
  PageState state = PageState.loading;
  bool isEndOfList = false;
  bool isErrorList = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state == PageState.content) {
          widget.controller.addPage();
          if (!isEndOfList) {
            debugPrint("Load More");
            widget.onLoadMore();
          }
        }
      }
    });

    widget.controller.addListener(() {
      setState(() {
        items = widget.controller.items;
        state = widget.controller.state;
        isErrorList = widget.controller.isErrorList;
        isEndOfList = widget.controller.isEndOfList;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return RefreshIndicator(
                onRefresh: () {
                  widget.controller.clearItems();
                  return widget.onRefreshed();
                },
                child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: _buildList(constraints))),
              );
            }),
            if (widget.hasFilter)
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (widget.onLeftClick == null) {
                              debugPrint(
                                  "==== Job2GoScrollView : Tombol filter KIRI belum di implement ====");
                            } else {
                              widget.onLeftClick!();
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(widget.leftIcon ??
                                    Icons.filter_alt_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.leftText ?? "Filter",
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey[300],
                          width: 1,
                          height: 24,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (widget.onRightClick == null) {
                              debugPrint(
                                  "==== Job2GoScrollView : Tombol filter KANAN belum di implement ====");
                            } else {
                              widget.onRightClick!();
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(widget.rightIcon ?? Icons.sort),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(widget.rightText ?? "Urutkan",
                                    style: const TextStyle(fontSize: 18))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }

  _buildList(BoxConstraints constraints) {
    switch (state) {
      case PageState.loading:
        return const Center(
          child: LoadingFullState(),
        );
      case PageState.error:
        return ErrorFullState(
          onTap: () {
            if (widget.onError != null) {
              widget.onError!();
            } else {
              widget.onRefreshed();
            }
          },
        );
      case PageState.empty:
        return Center(
            child: EmptyFullState(
          icon: SizedBox(
            width: 120,
            height: 120,
            child: Image.asset(widget.imageAsset),
          ),
          text: widget.text,
        ));
      case PageState.content:
        return Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return widget.itemBuilder(context, index);
              },
            ),
            isEndOfList
                ? const EndOfListState()
                : isErrorList
                    ? ErrorListState(onTap: () {
                        if (widget.onErrorList != null) {
                          widget.onErrorList!();
                        } else {
                          widget.onLoadMore();
                        }
                      })
                    : const LoadingOfListState(),
            const SizedBox(
              height: 130.0,
            ),
          ],
        );
    }
  }
}

class Job2GoScrollController extends ChangeNotifier {
  List<dynamic> items = [];
  bool isEndOfList = false;
  bool isError = false;
  bool isErrorList = false;
  bool isLoading = false;
  int page = 0;
  int limit = 10;
  PageState state = PageState.loading;

  Job2GoScrollController({required this.limit});

  void addPage() {
    page = page + 1;
    notifyListeners();
  }

  void clearItems() {
    items.clear();
    page = 0;
    state = PageState.loading;
    isEndOfList = false;
    isErrorList = false;
    notifyListeners();
  }

  void addList(List<dynamic>? value) {
    if (value != null) {
      items.addAll(value);
      if (value.length < limit) {
        isEndOfList = true;
        isErrorList = false;
      }
    } else {
      isEndOfList = true;
      isErrorList = false;
    }
    if (page == 0) {
      state = PageState.content;
    }
    notifyListeners();
  }

  void handleError() {
    state = PageState.error;
    notifyListeners();
  }
}
