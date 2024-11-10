import 'package:assignment4/modal/product_modal.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int _selectedIndex = 0;
  String selectedSize = '41';
  String selectedColor = 'black';

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product.image, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            _buildProductInfo(),
            const SizedBox(height: 16),
            _buildPriceAndCartButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove),
                ),
                Text('$quantity', style: const TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            ...List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Text('(270 Reviews)', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5),
        const Text('Available in stock', style: TextStyle(fontSize: 16, color: Colors.green)),
        const SizedBox(height: 10),
        const Text('Size:', style: TextStyle(fontSize: 16)),
        Row(
          children: ['38', '39.5', '40', '40.5', '41'].map((size) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = size;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: selectedSize == size ? Colors.black : Colors.grey[200],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: selectedSize == size ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        const Text('Color:', style: TextStyle(fontSize: 16)),
        Row(
          children: ['black', 'white', 'blue'].map((color) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = color;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: color == 'black'
                      ? Colors.black
                      : color == 'white'
                          ? Colors.white
                          : Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == color ? Colors.blueAccent : Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Text(widget.product.description, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildPriceAndCartButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${widget.product.price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Add to Cart'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        ),
      ],
    );
  }
}
