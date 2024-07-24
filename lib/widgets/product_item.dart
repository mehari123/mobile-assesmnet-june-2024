import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/widgets/rating.dart';
import '../models/product/product.dart';
import '../screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(product: product),
          ),
        );
      },

      child: Column(
        
        children: [
          Expanded(child: RatingDisplay(rating:product.rating!)),
          Expanded(
            child: GridTile(
            
              footer: GridTileBar(
            
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0), // Adjust padding
                  decoration: BoxDecoration(
                    color: Colors.brown[900]!.withOpacity(0.7), // Background color
                    border: Border.all(color: Colors.white, width: 1.0), // Border color and width
                    borderRadius: BorderRadius.circular(4.0), // Border radius
                  ),
                  child: Text(
                    product.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Text color
                      // You can add more TextStyle properties as needed
                    ),
                  ),
                ),
              ),
              child: CachedNetworkImage(
            
                imageUrl: product.image!,
                imageBuilder: (context, imageProvider) => Container(
            
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
            
                    image: DecorationImage(
            
                        image: imageProvider, fit: BoxFit.contain),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.orange[900],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Getting item image",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
