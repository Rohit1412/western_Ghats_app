import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WesternGhatsInfo extends StatefulWidget {
  const WesternGhatsInfo({Key? key}) : super(key: key);

  @override
  _WesternGhatsInfoState createState() => _WesternGhatsInfoState();
}

class _WesternGhatsInfoState extends State<WesternGhatsInfo> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  final List<Map<String, String>> highlights = [
    {
      'title': 'Biodiversity Hotspot',
      'description': 'Home to over 7,400 species of flowering plants, 1,800 species of vertebrates, and 179 amphibian species.',
      'icon': '🌿'
    },
    {
      'title': 'UNESCO Heritage',
      'description': 'Recognized as one of the world\'s eight biodiversity hotspots and a UNESCO World Heritage Site.',
      'icon': '🏆'
    },
    {
      'title': 'Ancient Mountain Range',
      'description': 'Older than the Himalayas, formed during the break-up of Gondwana over 150 million years ago.',
      'icon': '⛰️'
    },
    {
      'title': 'Water Source',
      'description': 'Major source of water for peninsular India, with numerous rivers originating from these ranges.',
      'icon': '💧'
    },
  ];

  final List<Map<String, dynamic>> sections = [
    {
      'title': 'Endemic Species',
      'content': [
        'Lion-tailed Macaque',
        'Nilgiri Tahr',
        'Malabar Grey Hornbill',
        'Purple Frog',
        'Nilgiri Laughingthrush'
      ],
      'color': Colors.green.shade100,
    },
    {
      'title': 'Major Peaks',
      'content': [
        'Anamudi (2,695m)',
        'Doddabetta (2,636m)',
        'Mullayanagiri (1,930m)',
        'Kudremukh (1,892m)',
        'Kalsubai (1,646m)'
      ],
      'color': Colors.blue.shade100,
    },
    {
      'title': 'Protected Areas',
      'content': [
        'Silent Valley National Park',
        'Periyar Tiger Reserve',
        'Bandipur National Park',
        'Kudremukh National Park',
        'Nagarhole National Park'
      ],
      'color': Colors.orange.shade100,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Animated App Bar
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'The Western Ghats',
                style: TextStyle(
                  color: _scrollOffset > 200 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    'assets/svg/mountains.svg', // Path to the SVG file
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introduction Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'A Natural Marvel',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'The Western Ghats, locally known as Sahyadri, is a mountain range that runs parallel to India\'s western coast. Stretching over 1,600 kilometers from Gujarat to Kerala, it\'s one of the world\'s most important biodiversity hotspots.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Highlights Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: highlights.map((highlight) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    highlight['icon']!,
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    highlight['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    highlight['description']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Information Sections
                  ...sections.map((section) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Card(
                        color: section['color'],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                section['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...section['content'].map<Widget>((item) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.arrow_right,
                                          color: Colors.green),
                                      const SizedBox(width: 8),
                                      Text(
                                        item,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  // Conservation Status
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Conservation Status',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: 0.39,
                            backgroundColor: Colors.red.shade100,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green.shade400),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '39% of the Western Ghats is currently under protection',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Threats:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildThreatItem(
                              'Deforestation', Icons.nature_people_outlined),
                          _buildThreatItem('Mining', Icons.landscape_outlined),
                          _buildThreatItem(
                              'Urban Expansion', Icons.location_city_outlined),
                          _buildThreatItem(
                              'Climate Change', Icons.thermostat_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreatItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red[400], size: 20),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}