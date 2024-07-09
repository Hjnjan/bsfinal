import 'package:flutter/material.dart';

class Fan extends StatefulWidget {
  @override
  State<Fan> createState() => _FanState();
}

class _FanState extends State<Fan> {
  String _sortBy = 'Sort By';
  String _color = 'Color';
  String _brand = 'Brand';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cooling",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 30.0,
            ),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSearchBar(),
            ),
            SizedBox(height: 16),
            _buildFilters(),
            SizedBox(height: 16),
            ProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(Icons.search),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for products',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton<String>(
          value: _sortBy,
          items: <String>['Sort By', 'Price', 'Rating'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _sortBy = newValue!;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            // Implement filter logic
          },
          child: Text('Filter'),
        ),
        DropdownButton<String>(
          value: _color,
          items: <String>['Color', 'Black', 'White','Brown','GREY'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _color = newValue!;
            });
          },
        ),
        DropdownButton<String>(
          value: _brand,
          items: <String>['Brand', 'ATOMBERG', 'BAJAJ'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _brand = newValue!;
            });
          },
        ),
      ],
    );
  }
}

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final List<Product> products = [
    Product('Window Cooler', 'assets/images/fan1.jpg', 4.8, 8, 7199.00,),
    Product('Air Cooler', 'assets/images/fan2.jpg', 4.7, 5, 9299.00),
    Product('Stand Fan', 'assets/images/fan3.jpg', 5.0, 9, 1999.00),
    Product('Table Fan', 'assets/images/fan4.jpg', 4.8, 1, 1399.00),
    Product('BLDC', 'assets/images/fan.jpg', 4.8, 3, 1219.00),
    ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.57,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class Product {
  final String title;
  final String imageUrl;
  final double rating;
  final int ratingCount;
  final double price;

  Product(this.title, this.imageUrl, this.rating, this.ratingCount, this.price);
}

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;
  String currencySymbol = '₹';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen(product: widget.product)),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                  height: 170,
                  width: double.infinity,
                ),
                SizedBox(height: 8),
                Text(
                  widget.product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow.shade600, size: 20),
                    SizedBox(width: 3.0),
                    IconButton(
                      icon: _isFavorite
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${widget.product.rating} (${widget.product.ratingCount})',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '$currencySymbol${widget.product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
              ],
            ),
          ),
        )
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  String currencySymbol = '₹';

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product.title),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                    height: 400,
                    width: double.infinity,
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rating: ${widget.product.rating} (${widget.product.ratingCount})',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: ${widget.currencySymbol}${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180, // Set the width
                        height: 55, // Set the height
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Set the background color
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)), // Set the shape
                          ),
                          onPressed: () {
                            // Add to cart logic
                          },
                          child: Text('ADD TO CART', style: TextStyle(fontSize: 14, color: Colors.white)), // Increase the font size
                        ),
                      ),
                      Container(
                        width: 130, // Set the width
                        height: 55, // Set the height
                        child: ElevatedButton(
                          onPressed: () {
                            // Buy now logic
                          },
                          child: Text('BUY NOW', style: TextStyle(fontSize: 14, color: Colors.black)), // Increase the font size
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isWishlisted ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            _isWishlisted = !_isWishlisted;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
        );
    }
}
