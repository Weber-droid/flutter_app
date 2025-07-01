import 'package:flutter/material.dart';

class WalletHome extends StatelessWidget {
  const WalletHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EDF5),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildTopMerchants(),
            const SizedBox(height: 20),
            _buildTransactionHistory(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.filter_list),
        ),
        const Text(
          '~ Hi, Michelle! ~',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.notifications_outlined),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.credit_card, size: 16),
              SizedBox(width: 4),
              Text('**** 0808'),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Current Balance', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const Text(
            'GHS 53,987.00',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Icon(Icons.visibility_off_outlined),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconButton(Icons.send, 'Send', true),
              _iconButton(Icons.download, 'Request'),
              _iconButton(Icons.cached, 'Pay Bills'),
              _iconButton(Icons.more_horiz, 'More'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, String label, [bool isPrimary = false]) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isPrimary ? const Color(0xFFFFD39A) : Colors.white,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  Widget _buildTopMerchants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Top Merchants'),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _merchantCard(
                '360Pay®',
                'Discount Up To 60%',
                'Seamless Pay, No Wahala!',
                Icons.payment,
              ),
              const SizedBox(width: 12),
              _merchantCard(
                'InsuGo',
                'Lorem Ipsum',
                'Dolor Sit Amet',
                Icons.security,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _merchantCard(
    String title,
    String headline,
    String subtitle,
    IconData iconData,
  ) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  headline,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(subtitle, style: const TextStyle(fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.orange.shade100,
            child: Icon(iconData, color: Colors.orange.shade700, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Transaction History'),
        const SizedBox(height: 12),
        _transactionItem(
          'KW',
          'Karen Wayne',
          '11:30 AM',
          'GHS500.00',
          'Received',
          Colors.green,
        ),
        _transactionItem(
          'AliExpress',
          'AliExpress',
          '10:25 AM',
          'GHS27.00',
          'Transfer',
          Colors.deepOrange,
        ),
        _transactionItem(
          'MTN',
          'MTN',
          '08:07 AM',
          'GHS10.00',
          'Airtime',
          Colors.amber,
        ),
      ],
    );
  }

  Widget _transactionItem(
    String initials,
    String name,
    String time,
    String amount,
    String type,
    Color bgColor,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: bgColor,
        child: Text(
          initials.length <= 2 ? initials : initials.substring(0, 2),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(time),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(type, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Text('View all', style: TextStyle(color: Colors.orange)),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Top Up',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MyAccount'),
      ],
    );
  }
}
