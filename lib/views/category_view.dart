import 'package:flutter/material.dart';
import 'package:ukiyo/helper/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ukiyo/models/category_model.dart';
import 'package:ukiyo/views/category_news.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<CategoryModel> categories = List<CategoryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
          child: GridView.builder(
            primary: true,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              return Categorytile(
                imageURL: categories[index].imageUrl,
                categoryName: categories[index].categoryName,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Categorytile extends StatelessWidget {
  final String imageURL, categoryName;
  Categorytile({this.imageURL, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[300],
      enableFeedback: true,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Container(
        // margin: EdgeInsets.only(right),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Center(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
    );
  }
}
