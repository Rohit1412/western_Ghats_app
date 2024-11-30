import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report_sighting_page.dart';
import 'report_crime.dart';
import 'emergency_call.dart';
import 'about_reserve_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with image and gradient overlay
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/bg2nd.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3), // Top overlay
                  Colors.black.withOpacity(0.7), // Bottom overlay
                ],
                stops: const [0.5, 1.0],
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildForestWeatherWidget(),
                        _buildSectionTitle('Help our Rangers'),
                        _buildRangerGrid(context),
                        _buildSectionTitle('Forest Activities'),
                        _buildActivitiesSection(),
                        _buildSectionTitle('Conservation Projects'),
                        _buildConservationProjects(),
                        const SizedBox(height: 80), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Footer
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildFooter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildForestWeatherWidget() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1B4332), // Dark green
            const Color.fromARGB(255, 1, 219, 121), // Medium green
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.forest,
              size: 120,
              color: Colors.green.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Western Ghats',
                          style: GoogleFonts.archivo(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Forest Reserve',
                          style: GoogleFonts.archivo(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '16°C',
                      style: GoogleFonts.archivo(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeatherInfo(Icons.water_drop, 'Humidity: 10%'),
                        const SizedBox(height: 8),
                        _buildWeatherInfo(Icons.air, 'Wind: 20 km/h'),
                        const SizedBox(height: 8),
                        _buildWeatherInfo(Icons.visibility, 'Visibility: 20 km'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.archivo(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: GoogleFonts.archivo(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }


 Widget _buildRangerGrid(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    children: [
      _buildRangerCard(
        context,
        icon: Icons.visibility,
        label: 'Report Sighting',
        color: const Color(0xFF2D6A4F),
        page: const ReportSightingPage(),
      ),
      _buildRangerCard(
        context,
        icon: Icons.warning,
        label: 'Report Crime',
        color: const Color(0xFFBC4749),
        page: const ReportCrimePage(),
      ),
      _buildRangerCard(
        context,
        icon: Icons.phone,
        label: 'Emergency Call',
        color: const Color(0xFFE9C46A),
        page: const EmergencyPage(),
      ),
      _buildRangerCard(
        context,
        icon: Icons.info,
        label: 'About Western Ghats',
        color: const Color(0xFF457B9D),
        page: const WesternGhatsInfo(),
      ),
    ],
  );
}

Widget _buildRangerCard(
  BuildContext context, {
  required IconData icon,
  required String label,
  required Color color,
  required Widget page,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.archivo(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


Widget _buildButton(BuildContext context, String label, Widget page) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Text(label),
  );
}

          

  Widget _buildActivitiesSection() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildActivityCard('Trekking', Icons.hiking),
          _buildActivityCard('Bird Watching', Icons.remove_red_eye),
          _buildActivityCard('Photography', Icons.camera_alt),
          _buildActivityCard('Camping', Icons.nights_stay),
        ],
      ),
    );
  }

  Widget _buildActivityCard(String title, IconData icon) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, size: 32, color: Colors.green.shade700),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: GoogleFonts.archivo(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Learn More',
                  style: GoogleFonts.archivo(
                    fontSize: 12,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConservationProjects() {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProjectCard(
            'Tiger Conservation',
            'Protecting Bengal Tigers',
            Icons.pets,
          ),
          _buildProjectCard(
            'Forest Restoration',
            'Reforestation Initiative',
            Icons.park,
          ),
          _buildProjectCard(
            'Wildlife Corridor',
            'Connecting Habitats',
            Icons.nature_people,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1B4332),
            const Color(0xFF2D6A4F),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, size: 32, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: GoogleFonts.archivo(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View Details',
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B4332),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: 12,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFooterButton(Icons.home, 'Home'),
          _buildFooterButton(Icons.map, 'Map'),
          _buildFooterButton(Icons.add_circle, 'Report'),
          _buildFooterButton(Icons.chat, 'Chat'),
          _buildFooterButton(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildFooterButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.archivo(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}