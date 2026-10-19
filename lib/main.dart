import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. Gelişmiş Ürün Modeli
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final Map<String, String> specifications;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.specifications,
  });
}

// 2. 10 Ürünlük Zengin Veri Seti
final List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'AirPods Max',
    description: 'Yüksek kaliteli, kafa üstü aktif gürültü engelleyici kulaklık.',
    price: 549.0,
    imagePath: 'assets/images/airpods.png',
    specifications: {'Renk': 'Gümüş', 'Pil Ömrü': '20 Saat', 'Bağlantı': 'Bluetooth 5.0'},
  ),
  Product(
    id: '2',
    name: 'AirPods Pro',
    description: 'Şarj kutulu, adaptif ses özellikli kulak içi kulaklık.',
    price: 249.0,
    imagePath: 'assets/images/airpods_pro.png',
    specifications: {'Tip': 'Kulak İçi', 'Pil Ömrü': '6 Saat', 'Suya Dayanıklılık': 'IPX4'},
  ),
  Product(
    id: '3',
    name: 'HomePod',
    description: 'Kompakt boyutlu, 360 derece ses veren akıllı ev hoparlörü.',
    price: 99.0,
    imagePath: 'assets/images/homepod.png',
    specifications: {'Bağlantı': 'Wi-Fi / Thread', 'Ses Asistanı': 'Siri', 'Ağırlık': '345g'},
  ),
  Product(
    id: '4',
    name: 'HomePod Pro',
    description: 'Hi-Fi ses kalitesi sunan ve odanın akustiğini analiz eden hoparlör.',
    price: 299.0,
    imagePath: 'assets/images/homepod_pro.png',
    specifications: {'Hoparlör': 'Yüksek gezinimli woofer', 'Mikrofon': '4 adet', 'Renk': 'Gece Yarısı'},
  ),
  Product(
    id: '5',
    name: 'iPad',
    description: 'Günlük kullanım ve çizim için ideal, kalem destekli standart tablet.',
    price: 449.0,
    imagePath: 'assets/images/ipad.png',
    specifications: {'Ekran': '10.9 inç', 'Çip': 'A14 Bionic', 'Kapasite': '64GB'},
  ),
  Product(
    id: '6',
    name: 'iPad Mini',
    description: 'Tek elle rahatça tutulabilen, kompakt ve güçlü tablet.',
    price: 499.0,
    imagePath: 'assets/images/ipad_mini.png',
    specifications: {'Ekran': '8.3 inç', 'Çip': 'A15 Bionic', 'Bağlantı': 'USB-C'},
  ),
  Product(
    id: '7',
    name: 'MacBook Air',
    description: 'İnce, hafif ve mükemmel batarya ömrü sunan dizüstü bilgisayar.',
    price: 999.0,
    imagePath: 'assets/images/macbook.png',
    specifications: {'Ekran': '13.6 inç', 'İşlemci': 'M2 Çip', 'RAM': '8GB'},
  ),
  Product(
    id: '8',
    name: 'MacBook Pro 16"',
    description: 'Profesyoneller için yüksek performanslı iş istasyonu.',
    price: 2499.0,
    imagePath: 'assets/images/macbook_pro.png',
    specifications: {'Ekran': '16.2 inç XDR', 'İşlemci': 'M3 Max', 'RAM': '36GB'},
  ),
  Product(
    id: '9',
    name: 'iPhone 15',
    description: 'Gelişmiş kamera sistemi ve dinamik ada özellikli premium telefon.',
    price: 799.0,
    imagePath: 'assets/images/iphone.png',
    specifications: {'Ekran': '6.1 inç OLED', 'Kasa': 'Alüminyum', 'Ana Kamera': '48MP'},
  ),
  Product(
    id: '10',
    name: 'iPhone 15 Pro',
    description: 'Titanyum kasa ve güçlü üçlü kamera sistemine sahip en üst düzey telefon.',
    price: 999.0,
    imagePath: 'assets/images/iphone_pro.png',
    specifications: {'Ekran': '6.1 inç ProMotion', 'Kasa': 'Titanyum', 'Çip': 'A17 Pro'},
  ),
];

// Sepetteki ürünleri tutacağımız global liste
final List<Product> cartItems = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gelişmiş Katalog',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const DiscoverScreen(),
    );
  }
}

// 3. Ana Ekran (Keşfet)
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(
            icon: Badge(
              label: Text(cartItems.length.toString()),
              isLabelVisible: cartItems.isNotEmpty,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              ).then((_) => setState(() {}));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Kampanya Banner Simülasyonu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50, // withOpacity yerine hata vermeyen shade kullanıldı
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.card_giftcard, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text('GIFT STORE - %20 İndirim Fırsatı!', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Resimli GridView
            Expanded(
              child: GridView.builder(
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      ).then((_) => setState(() {}));
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  product.imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 50),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text('\$${product.price}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Detay Ekranı
class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool isAdded = cartItems.contains(widget.product);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => setState(() {}));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                child: Image.asset(
                  widget.product.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(widget.product.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${widget.product.price}', style: const TextStyle(fontSize: 24, color: Colors.blueAccent, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(widget.product.description, style: TextStyle(fontSize: 16, color: Colors.grey.shade700, height: 1.5)),
            const SizedBox(height: 20),
            const Text('Specifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...widget.product.specifications.entries.map((entry) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text('${entry.key}: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(entry.value, style: const TextStyle(fontSize: 15)),
                ],
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: isAdded ? Colors.green : Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            setState(() {
              if (isAdded) {
                cartItems.remove(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.product.name} removed from cart!'), duration: const Duration(seconds: 1)));
              } else {
                cartItems.add(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.product.name} added to cart!'), duration: const Duration(seconds: 1)));
              }
            });
          },
          child: Text(isAdded ? 'Added to Cart' : 'Add to Cart', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

// 5. Sepet Ekranı
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty.', style: TextStyle(fontSize: 18, color: Colors.grey)),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: Image.asset(product.imagePath, width: 60, height: 60, fit: BoxFit.contain),
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('\$${product.price}', style: const TextStyle(color: Colors.blueAccent)),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: cartItems.isEmpty ? null : Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Checkout successful!')));
                setState(() {
                  cartItems.clear();
                });
              },
              child: const Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}