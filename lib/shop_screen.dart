import 'package:Trimz/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Product {
  final String image, title, description, category, subCategory;
  final int price, id;
  final Color color;
  static final String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
  Product({
    this.id,
    this.image,
    this.category,
    this.subCategory,
    this.title,
    this.price,
    this.description,
    this.color,
  });
}

class ShopView extends StatefulWidget {
  final Function menuCallback;

  ShopView({@required this.menuCallback});

  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  int selectedCategoryIndex = 0;
  final List<Product> products = [
    Product(
      id: 6,
      title: "Ultra Doux",
      category: "Shampooing",
      subCategory: "Cheveux blancs",
      price: 234,
      description: Product.dummyText,
      image: "assets/images/Shampoo6.png",
      color: Color.fromRGBO(237, 219, 231, 1),
    ),
    Product(
        id: 5,
        title: "Ultra Doux",
        category: "Shampooing",
        subCategory: "Cheveux fins",
        price: 234,
        description: Product.dummyText,
        image: "assets/images/Shampoo5.png",
        color: Color.fromRGBO(221, 191, 173, 1)),
    Product(
        id: 3,
        title: "Ultra Doux",
        category: "Shampooing",
        subCategory: "Cheveux bouclés",
        price: 234,
        description: Product.dummyText,
        image: "assets/images/Shampoo3.png",
        color: Color.fromRGBO(197, 218, 84, 1)),
    Product(
        id: 1,
        title: "Ultra Doux",
        category: "Shampooing",
        subCategory: "Cheveux secs",
        price: 234,
        description: Product.dummyText,
        image: "assets/images/Shampoo1.png",
        color: Color.fromRGBO(107, 20, 15, 1)),
  ];

  List<String> productTypes = [
    'Shampooings',
    'Gels de douche',
    'Rouges à lèvre',
    'Fixants'
  ];

  Widget buildCategoryWidgets(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 35.0,
              child: Material(
                color: selectedCategoryIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                elevation: 8.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      productTypes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedCategoryIndex == index
                            ? Colors.white
                            : Color(0xFFACACAC),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedCategoryIndex == index
                  ? Theme.of(context).primaryColor.withOpacity(0.5)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: widget.menuCallback,
                    child: Icon(FontAwesomeIcons.bars)),
                Column(
                  children: [
                    Text(
                      'Emplacement',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Casablanca,',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          ' Maroc',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 22.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("assets/images/MyPic.jpg"),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.06)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 22.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.search,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'chercher....',
                                ),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.filter,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 50.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: productTypes.length,
                          itemBuilder: (context, index) {
                            return buildCategoryWidgets(index);
                          }),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductDetailScreen(product: product);
                              }));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 20.0,
                                left: 20.0,
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: <Widget>[
                                  Material(
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                        vertical: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: deviceWidth * 0.4,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  product.title,
                                                  style: TextStyle(
                                                    fontSize: 26.0,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  product.category,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  product.subCategory,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .moneyBillAlt,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 16.0,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      'Prix: ${product.price}Dhs',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color: product.color,
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        height: 190.0,
                                        width: deviceWidth * 0.4,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20.0),
                                        child: Hero(
                                          tag: product.id,
                                          child: Image(
                                            image: AssetImage(product.image),
                                            height: 220.0,
                                            fit: BoxFit.fitHeight,
                                            width: deviceWidth * 0.35,
                                          ),
                                        ),
                                      )
                                    ],
                                    alignment: Alignment.center,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
