import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  final _searchData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.deepPurple,
              title: Center(
                  child: Column(
                children: const [
                  SizedBox(height: 10.0),
                  Text('L o c    B a s e d    S e a r c h'),
                ],
              )),
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      controller: _searchData,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Search : Keyword - k1, k2, ...',
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: viewData,
                          icon: const Icon(Icons.check),
                        ),
                      ),
                    ),
                  ),
                ),
                //title:   Text("Loc  Based  Search"),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void viewData() {
    print(_searchData.text);
  }
}
