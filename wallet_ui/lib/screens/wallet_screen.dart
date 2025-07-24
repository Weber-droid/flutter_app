import 'package:flutter/material.dart';
import '../widgets/action_button.dart';
import '../widgets/merchant_card.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFFF9B44D);
    final Color bgColor = Color(0xFFE9ECF2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top Section (scrolls with content)
            SliverToBoxAdapter(
              child: Container(
                color: bgColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    // Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.filter_list, color: Colors.black),
                          radius: 24,
                        ),
                        Column(
                          children: [
                            Text(
                              '~ Hi, Michelle! ~',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '**** 0808',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down, size: 18),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.black,
                              ),
                              radius: 24,
                            ),
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Balance
                    Text(
                      'Current Balance',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'GHS 53,987.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 8),
                    Icon(Icons.visibility_off, color: Colors.grey[600]),
                    SizedBox(height: 16),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionButton(
                          icon: Icons.currency_exchange,
                          label: 'Send',
                          color: primaryColor,
                          selected: true,
                        ),
                        ActionButton(icon: Icons.download, label: 'Request'),
                        ActionButton(
                          icon: Icons.currency_exchange,
                          label: 'Pay Bills',
                          rotate: true,
                        ),
                        ActionButton(icon: Icons.more_horiz, label: 'More'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Top Merchants Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Merchants',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('View all merchants')),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Merchants Carousel
            SliverToBoxAdapter(
              child: Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20),
                    MerchantCard(
                      brandName: '360Pay',
                      title: 'Discount Up To 60%',
                      subtitle: 'Seamless Pay, No Wahala!',
                      imagePath: 'images/person.jpg',
                      brandColor: Colors.orange,
                    ),
                    SizedBox(width: 12),
                    MerchantCard(
                      brandName: 'InsuGo',
                      title: 'Insurance Made Easy',
                      subtitle: 'Quick & Reliable Coverage!',
                      imagePath: 'images/person.jpg',
                      brandColor: Colors.orange,
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            // Transaction History Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('View all transactions')),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // TODAY Divider
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ),
            // Transactions List
            SliverList(
              delegate: SliverChildListDelegate([
                TransactionItem(
                  avatar: CircleAvatar(
                    child: Text('KW'),
                    backgroundColor: Colors.green,
                  ),
                  name: 'Karen Wayne',
                  time: '11:30 AM',
                  amount: 'GHS500.00',
                  type: 'Received',
                ),
                TransactionItem(
                  avatar: _buildTransactionAvatar(
                    imagePath: 'images/aliexpress.jpg',
                    fallbackColor: Colors.orange,
                    fallbackText: 'AE',
                  ),
                  name: 'AliExpress',
                  time: '10:25 AM',
                  amount: 'GHS27.00',
                  type: 'Transfer',
                ),
                TransactionItem(
                  avatar: _buildTransactionAvatar(
                    imagePath: 'images/mtn.jpg',
                    fallbackColor: Colors.yellow,
                    fallbackText: 'MTN',
                  ),
                  name: 'MTN',
                  time: '08:07 AM',
                  amount: 'GHS10.00',
                  type: 'Airtime',
                ),
              ]),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Top Up',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MyAccount'),
        ],
      ),
    );
  }

  // Helper method to build transaction avatars with image fallback
  Widget _buildTransactionAvatar({
    required String imagePath,
    required Color fallbackColor,
    required String fallbackText,
  }) {
    return CircleAvatar(
      backgroundColor: fallbackColor,
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to text if image doesn't exist
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: fallbackColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  fallbackText,
                  style: TextStyle(
                    color:
                        fallbackColor == Colors.yellow
                            ? Colors.black
                            : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fallbackText.length > 2 ? 10 : 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
