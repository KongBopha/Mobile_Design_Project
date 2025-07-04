import 'package:flutter/material.dart';
import 'package:landing_page/custombottombar.dart';
import 'package:landing_page/footer.dart';

class NetworkSearchScreen extends StatefulWidget {
  const NetworkSearchScreen({super.key});

  @override
  _NetworkSearchScreenState createState() => _NetworkSearchScreenState();
}

class _NetworkSearchScreenState extends State<NetworkSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = 'Network';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            leadingWidth: 130,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset('assets/logoname.png', fit: BoxFit.contain),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                color: Colors.blue.shade800,
                onPressed: () {
                  // Show search functionality
                  _showSearchDialog(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.blue.shade800,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Search Bar
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 20),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey[600], size: 20),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                
                // Tab Bar
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildTab('All (43)', true),
                  const SizedBox(width: 16),
                  _buildTab('Courses (22)', false),
                  const SizedBox(width: 16),
                  _buildTab('Projects (3)', false),
                  const SizedBox(width: 16),
                  _buildTab('PRO sessions (3)', false, isPro: true),
                  const SizedBox(width: 16),
                  _buildTab('Live sessions (5)', false),
                  const SizedBox(width: 16),
                  _buildTab('Tutorials (12)', false),
                ],
              ),
            ),
                          ),
                
                // Content List
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                       const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16),
                      _buildNetworkItem(),
                       const SizedBox(height: 16),
                      _buildNetworkItem(),
                       const SizedBox(height: 16),
                      _buildNetworkItem(),
                      const SizedBox(height: 16,),
                      const Text('Load More...')
                    ],
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logoname.png'),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
              const Footer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search'),
        content: const Text('Search functionality would be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isActive, {bool isPro = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isActive ? null : Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : (isPro ? Colors.orange : Colors.grey[700]),
          fontSize: 14,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNetworkItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Microsoft Word Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4A90E2),
                  Color(0xFF2E5BBA),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'W',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Computer Network',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                
                const SizedBox(height: 8),
                
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    children: const [
                      TextSpan(
                        text: 'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally ',
                      ),
                      TextSpan(
                        text: 'See more...',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                
               const SizedBox(height: 12),
                
                // Meta information
          const Row(
            children:  [
              Icon(Icons.wifi_2_bar, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text("កំរិតដំបូង", style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.people, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text("99 នាក់បានរៀន", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}