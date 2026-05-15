import 'package:flutter/material.dart';

void main() {
  runApp(const F1App());
}

// ✅ MaterialApp
class F1App extends StatelessWidget {
  const F1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Hub – Red Bull Racing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ✅ Scaffold + AppBar + Drawer
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1F3A),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE8001D),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'F1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'RED BULL RACING',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),

      // ✅ Drawer
      drawer: Drawer(
        backgroundColor: const Color(0xFF0D1229),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1B1F3A), Color(0xFF0A0F1E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1B1F3A),
                      border:
                          Border.all(color: const Color(0xFFE8001D), width: 3),
                    ),
                    child: const Center(
                      child: Text(
                        'RB',
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Oracle Red Bull Racing',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    '🏆 4x Constructors Champions',
                    style: TextStyle(color: Color(0xFFFFD700), fontSize: 12),
                  ),
                ],
              ),
            ),
            _drawerItem(Icons.home_rounded, 'Home', context),
            _drawerItem(Icons.emoji_events, 'Championships', context),
            _drawerItem(Icons.speed, 'Race Results', context),
            _drawerItem(Icons.people, 'Drivers', context),
            _drawerItem(Icons.calendar_month, 'Race Calendar', context),
            _drawerItem(Icons.settings, 'Settings', context),
            const Divider(color: Colors.white12),
            _drawerItem(Icons.logout, 'Logout', context),
          ],
        ),
      ),

      body: const HomeBody(),
    );
  }

  Widget _drawerItem(IconData icon, String label, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFE8001D)),
      title: Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
      onTap: () => Navigator.pop(context),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heroBanner(),
          const SizedBox(height: 24),
          _sectionTitle('🏎️  DRIVER SPOTLIGHT'),
          const SizedBox(height: 12),
          _driverCard(),
          const SizedBox(height: 24),
          _sectionTitle('📊  2024 SEASON STATS'),
          const SizedBox(height: 12),
          _statsRow(),
          const SizedBox(height: 24),
          _sectionTitle('🏁  LATEST RACE RESULTS'),
          const SizedBox(height: 12),
          _raceResult('1st 🥇', 'Max Verstappen', 'Abu Dhabi GP', '1:27.456'),
          _raceResult('1st 🥇', 'Max Verstappen', 'Las Vegas GP', '1:31.123'),
          _raceResult('2nd 🥈', 'Sergio Perez', 'Brazil GP', '1:32.889'),
          _raceResult('1st 🥇', 'Max Verstappen', 'Mexico GP', '1:20.188'),
          const SizedBox(height: 24),
          _sectionTitle('🔧  THE CAR – RB20'),
          const SizedBox(height: 12),
          _carShowcase(),
          const SizedBox(height: 24),
          _championshipBanner(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 16,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B1F3A), Color(0xFF2D1B69)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8001D), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8001D).withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8001D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'WORLD CHAMPION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'MAX\nVERSTAPPEN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  '#1  •  Red Bull Racing',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '4x Formula 1 World Champion',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          // ✅ Image
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Max_Verstappen_2023_photo.jpg/320px-Max_Verstappen_2023_photo.jpg',
              width: 110,
              height: 130,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                width: 110,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1F3A),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE8001D)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1',
                        style: TextStyle(
                            color: Color(0xFFFFD700),
                            fontSize: 40,
                            fontWeight: FontWeight.w900)),
                    Text('MV',
                        style: TextStyle(color: Colors.white54, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _driverCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B1F3A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          // ✅ Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Red_Bull_Racing_RB19_front_Honda_Power_Unit.jpg/640px-Red_Bull_Racing_RB19_front_Honda_Power_Unit.jpg',
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                height: 160,
                color: const Color(0xFF0D1229),
                child: const Center(
                  child: Icon(Icons.directions_car,
                      color: Color(0xFFE8001D), size: 60),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Max Verstappen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8001D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Car #1',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '🇳🇱 Dutch  •  Born: Sep 30, 1997',
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _quickStat('Wins', '62'),
                    _quickStat('Poles', '40'),
                    _quickStat('Podiums', '108'),
                    _quickStat('Titles', '4'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickStat(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 18,
                  fontWeight: FontWeight.w900)),
          Text(label,
              style: const TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        _statCard(
            '19', 'Race Wins', Icons.emoji_events, const Color(0xFFE8001D)),
        const SizedBox(width: 10),
        _statCard('575', 'Points', Icons.star, const Color(0xFFFFD700)),
        const SizedBox(width: 10),
        _statCard(
            '1st', 'Position', Icons.leaderboard, const Color(0xFF3B82F6)),
      ],
    );
  }

  Widget _statCard(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1F3A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(value,
                style: TextStyle(
                    color: color, fontSize: 20, fontWeight: FontWeight.w900)),
            Text(label,
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _raceResult(String position, String driver, String race, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1F3A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Text(position,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driver,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Text(race,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0F1E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(time,
                style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _carShowcase() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B1F3A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8001D).withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Red_Bull_Racing_RB16B_2021.jpg/640px-Red_Bull_Racing_RB16B_2021.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                height: 180,
                color: const Color(0xFF0D1229),
                child: const Center(
                    child: Icon(Icons.directions_car,
                        color: Color(0xFFE8001D), size: 80)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Oracle Red Bull Racing RB20',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Powered by Honda RBPT • V6 1.6L Turbo Hybrid',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _specBadge('~1000 HP', 'Power'),
                    _specBadge('798 kg', 'Weight'),
                    _specBadge('350+ km/h', 'Top Speed'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _specBadge(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Color(0xFFE8001D),
                fontWeight: FontWeight.w900,
                fontSize: 14)),
        Text(label,
            style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    );
  }

  Widget _championshipBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8001D), Color(0xFFB71C1C)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8001D).withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: const [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🏆 2024 WORLD CHAMPIONS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: 1),
                ),
                SizedBox(height: 4),
                Text(
                  'Max Verstappen – 4x World\nDrivers\' Champion',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          Text('🏁', style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }
}
