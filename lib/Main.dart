import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with SplashScreen
    );
  }
}

// SplashScreen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/BUILDAPCSPLASH.png', // Ensure this image exists
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}

// LoginPage Widget
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to HomePage on successful login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// HomePage Widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 40), // Replace with your logo
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.black),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('FOR YOU', 'Recommended'),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),
            const SizedBox(height: 20),
            _buildSectionHeader('Category', 'See All'),
            const SizedBox(height: 10),
            _buildCategoryList(),
            const SizedBox(height: 20),
            _buildSectionHeader('Flash Sale', 'See All', withTimer: true),
            const SizedBox(height: 10),
            _buildFlashSaleTabs(),
            const SizedBox(height: 10),
            _buildHorizontalProductList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title, String actionText, {bool withTimer = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (withTimer)
          Row(
            children: const [
              Text('Closing In: 00:00:00', style: TextStyle(color: Colors.red)),
              SizedBox(width: 8),
            ],
          ),
        TextButton(
          onPressed: () {},
          child: Text(actionText, style: const TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }

  // Horizontal List of Products
  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => _buildProductCard(),
      ),
    );
  }

  // Product Card Widget
  Widget _buildProductCard() {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/images/product.png', // Replace with your product image
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Product Name', maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 5),
                Text('₱2,999', style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Category List
  Widget _buildCategoryList() {
    final categories = [
      {'icon': Icons.desktop_mac, 'label': 'Computer Monitor'},
      {'icon': Icons.computer, 'label': 'Pre Built PC'},
      {'icon': Icons.graphic_eq, 'label': 'Graphics Card'},
      {'icon': Icons.memory, 'label': 'RAM'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(category['icon'] as IconData, color: Colors.orange),
            ),
            const SizedBox(height: 5),
            Text(category['label'] as String, textAlign: TextAlign.center),
          ],
        );
      },
    );
  }

  // Flash Sale Tabs
  Widget _buildFlashSaleTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFlashSaleTab('All', isSelected: true),
        _buildFlashSaleTab('Newest'),
        _buildFlashSaleTab('Popular'),
        _buildFlashSaleTab('Selling Out'),
      ],
    );
  }

  // Flash Sale Tab Widget
  Widget _buildFlashSaleTab(String label, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}