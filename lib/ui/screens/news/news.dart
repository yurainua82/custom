import 'package:custom_project/models/news_details.dart';
import 'package:custom_project/services/navigation.dart';
import 'package:flutter/material.dart';

List<NewsDetails> detailsm = [
  NewsDetails(
      title: 'Title1',
      description: 'Description1',
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  NewsDetails(
      title: 'Title2',
      description: 'Description2',
      url:
          'https://www.allaboutbirds.org/guide/assets/photo/67385731-480px.jpg'),
  NewsDetails(
      title: 'Title3',
      description: 'Description3',
      url:
          'https://lafeber.com/pet-birds/wp-content/uploads/2018/06/Cockatiel-2.jpg')
];

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: detailsm.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              detailsm[index].title,
              style: TextStyle(fontSize: 20),
            ),
            onTap: () { NavigationService().navigate('new');},
            subtitle: Text(detailsm[index].description),
            leading: Container(
              width: 100,
              height: 100,
              child: Image.network(
                detailsm[index].url,
                alignment: Alignment.bottomLeft,
              ),
            ),
          );
        },
      ),
    );
  }
}
