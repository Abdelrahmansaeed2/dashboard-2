import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Custom app bar
          const AppNavigationBar(),
          
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pricing',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  
                  // Pricing plans
                  Expanded(
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Responsive layout for pricing cards
                          final isWide = constraints.maxWidth > 800;
                          
                          if (isWide) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildPricingCard(
                                  title: 'Basic',
                                  price: '\$9.99',
                                  features: [
                                    'Up to 10 items',
                                    'Basic analytics',
                                    'Email support',
                                  ],
                                  isPrimary: false,
                                ),
                                const SizedBox(width: 24),
                                _buildPricingCard(
                                  title: 'Pro',
                                  price: '\$19.99',
                                  features: [
                                    'Unlimited items',
                                    'Advanced analytics',
                                    'Priority support',
                                    'Custom branding',
                                  ],
                                  isPrimary: true,
                                ),
                                const SizedBox(width: 24),
                                _buildPricingCard(
                                  title: 'Enterprise',
                                  price: '\$49.99',
                                  features: [
                                    'Unlimited items',
                                    'Advanced analytics',
                                    '24/7 support',
                                    'Custom branding',
                                    'API access',
                                    'Dedicated account manager',
                                  ],
                                  isPrimary: false,
                                ),
                              ],
                            );
                          } else {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  _buildPricingCard(
                                    title: 'Basic',
                                    price: '\$9.99',
                                    features: [
                                      'Up to 10 items',
                                      'Basic analytics',
                                      'Email support',
                                    ],
                                    isPrimary: false,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildPricingCard(
                                    title: 'Pro',
                                    price: '\$19.99',
                                    features: [
                                      'Unlimited items',
                                      'Advanced analytics',
                                      'Priority support',
                                      'Custom branding',
                                    ],
                                    isPrimary: true,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildPricingCard(
                                    title: 'Enterprise',
                                    price: '\$49.99',
                                    features: [
                                      'Unlimited items',
                                      'Advanced analytics',
                                      '24/7 support',
                                      'Custom branding',
                                      'API access',
                                      'Dedicated account manager',
                                    ],
                                    isPrimary: false,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
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

  Widget _buildPricingCard({
    required String title,
    required String price,
    required List<String> features,
    required bool isPrimary,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFFFFC268).withOpacity(0.1) : const Color(0xFF171717),
        borderRadius: BorderRadius

```dart file="lib/presentation/screens/pricing_screen.dart"
import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Custom app bar
          const AppNavigationBar(),
          
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pricing',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  
                  // Pricing plans
                  Expanded(
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Responsive layout for pricing cards
                          final isWide = constraints.maxWidth > 800;
                          
                          if (isWide) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildPricingCard(
                                  title: 'Basic',
                                  price: '\$9.99',
                                  features: [
                                    'Up to 10 items',
                                    'Basic analytics',
                                    'Email support',
                                  ],
                                  isPrimary: false,
                                ),
                                const SizedBox(width: 24),
                                _buildPricingCard(
                                  title: 'Pro',
                                  price: '\$19.99',
                                  features: [
                                    'Unlimited items',
                                    'Advanced analytics',
                                    'Priority support',
                                    'Custom branding',
                                  ],
                                  isPrimary: true,
                                ),
                                const SizedBox(width: 24),
                                _buildPricingCard(
                                  title: 'Enterprise',
                                  price: '\$49.99',
                                  features: [
                                    'Unlimited items',
                                    'Advanced analytics',
                                    '24/7 support',
                                    'Custom branding',
                                    'API access',
                                    'Dedicated account manager',
                                  ],
                                  isPrimary: false,
                                ),
                              ],
                            );
                          } else {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  _buildPricingCard(
                                    title: 'Basic',
                                    price: '\$9.99',
                                    features: [
                                      'Up to 10 items',
                                      'Basic analytics',
                                      'Email support',
                                    ],
                                    isPrimary: false,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildPricingCard(
                                    title: 'Pro',
                                    price: '\$19.99',
                                    features: [
                                      'Unlimited items',
                                      'Advanced analytics',
                                      'Priority support',
                                      'Custom branding',
                                    ],
                                    isPrimary: true,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildPricingCard(
                                    title: 'Enterprise',
                                    price: '\$49.99',
                                    features: [
                                      'Unlimited items',
                                      'Advanced analytics',
                                      '24/7 support',
                                      'Custom branding',
                                      'API access',
                                      'Dedicated account manager',
                                    ],
                                    isPrimary: false,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
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

  Widget _buildPricingCard({
    required String title,
    required String price,
    required List<String> features,
    required bool isPrimary,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFFFFC268).withOpacity(0.1) : const Color(0xFF171717),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPrimary ? const Color(0xFFFFC268) : const Color(0xFF262626),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: TextStyle(
              color: isPrimary ? const Color(0xFFFFC268) : Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'per month',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF262626)),
          const SizedBox(height: 24),
          ...features.map((feature) => _buildFeatureItem(feature)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPrimary ? const Color(0xFFFFC268) : const Color(0xFF262626),
                foregroundColor: isPrimary ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Choose Plan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFFFFC268),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
