import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomScrollViewSScreen extends StatelessWidget {
  final _list = [
    'https://fastly.picsum.photos/id/0/500/600.jpg?hmac=qVYF3Czu2fLkszj8BXs1wUioOt0kbDRC6fwPi0Qhdlk',
    'https://fastly.picsum.photos/id/331/500/400.jpg?hmac=E6btUdkXJsTY4gU6Vorr9uv_DcO6Y07Fgz0QANgf4OE',
    'https://fastly.picsum.photos/id/1029/500/400.jpg?hmac=lAL9lYh35fyikxj8J8Zduw03yTs3BhutId1VspY006w',
    'https://fastly.picsum.photos/id/100/500/400.jpg?hmac=TimhP0z8E3TSAH5-0TCC2yx1lcxIq8LdLaJMo1LW1PY',
    'https://fastly.picsum.photos/id/552/500/400.jpg?hmac=amQuh3sGDg-NO_fJ0fK7ibkqEH2ZSyuw5F_Pm2lvfo8',
    'https://fastly.picsum.photos/id/981/500/400.jpg?hmac=E_dZwI2cg8Jz8Rw5gHXCtzeu26REQoMlbvq_OBHkENE',
    'https://fastly.picsum.photos/id/514/500/400.jpg?hmac=_Agry0tFnU0lI0VSS8eWdmXt35Yl3IALAP8-uYSkoMk',
    'https://fastly.picsum.photos/id/402/500/400.jpg?hmac=FALuGEoGTSiZiECbSf_obqW6M8maWMA24NaRsx2gkhs',
    'https://fastly.picsum.photos/id/552/500/400.jpg?hmac=amQuh3sGDg-NO_fJ0fK7ibkqEH2ZSyuw5F_Pm2lvfo8',
    'https://fastly.picsum.photos/id/233/500/400.jpg?hmac=jvkQAUKUtR8Ks-bP3mI8zN91rM690J3iSEHPgOkpYTo',
  ];

  CustomScrollViewSScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.black,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              centerTitle: false,
              background: Image.network(
                  'https://fastly.picsum.photos/id/201/800/700.jpg?hmac=9MUGT60PQxKev7cdP6ErUE1eg7ogSV1mAtf7b0EUUNY',
                  fit: BoxFit.cover),
              title: const Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  'My Gallery',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Icon(Icons.menu, color: Colors.white),
              )
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ItemGrid(url: _list[index]);
            }, childCount: _list.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          )
        ],
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  final String url;
  const ItemGrid({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}
