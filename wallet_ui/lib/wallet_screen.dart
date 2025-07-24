import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

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
                        _ActionButton(
                          icon: Icons.currency_exchange,
                          label: 'Send',
                          color: primaryColor,
                          selected: true,
                        ),
                        _ActionButton(icon: Icons.download, label: 'Request'),
                        _ActionButton(
                          icon:
                              Icons
                                  .currency_exchange, // Use a rotated icon for Pay Bills
                          label: 'Pay Bills',
                          rotate: true,
                        ),
                        _ActionButton(icon: Icons.more_horiz, label: 'More'),
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
                        // Handle tap
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
                    _MerchantCard(),
                    SizedBox(width: 12),
                    _MerchantCard(),
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
                        // Handle tap
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
                _TransactionItem(
                  avatar: CircleAvatar(
                    child: Text('KW'),
                    backgroundColor: Colors.green,
                  ),
                  name: 'Karen Wayne',
                  time: '11:30 AM',
                  amount: 'GHS500.00',
                  type: 'Received',
                ),
                _TransactionItem(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                  name: 'AliExpress',
                  time: '10:25 AM',
                  amount: 'GHS27.00',
                  type: 'Transfer',
                ),
                _TransactionItem(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.phone_android, color: Colors.black),
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
}

// Action Button Widget
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool rotate;
  final Color color;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.selected = false,
    this.rotate = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: EdgeInsets.all(16),
          child:
              rotate
                  ? Transform.rotate(
                    angle: 3.14, // 180 degrees
                    child: Icon(
                      icon,
                      color: selected ? Colors.white : Colors.black,
                    ),
                  )
                  : Icon(icon, color: selected ? Colors.white : Colors.black),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// Merchant Card Widget (with icon and image)
class _MerchantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Color(0xFFE9ECF2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          // Left: Icon (replace with your asset)
          Icon(Icons.local_shipping, color: Colors.orange, size: 28),
          SizedBox(width: 10),
          // Center: Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '360Pay',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '®',
                      style: TextStyle(color: Colors.orange, fontSize: 9),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'Discount Up To 60%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 1),
                Text(
                  'Seamless Pay, No Wahala!',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          // Right: Image (replace with your asset)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 45,
              height: 45,
              color: Colors.orange.shade200,
              child: Icon(
                Icons.person,
                color: Colors.orange.shade700,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Transaction Item Widget
class _TransactionItem extends StatelessWidget {
  final Widget avatar;
  final String name;
  final String time;
  final String amount;
  final String type;

  const _TransactionItem({
    required this.avatar,
    required this.name,
    required this.time,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(time),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(type, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
