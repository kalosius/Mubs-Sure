import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _distance = 15;
  RangeValues _age = const RangeValues(18, 29);
  bool _global = false;
  bool _showFurther = true;
  bool _hasBio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.tune)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section(
            child: SwitchListTile(
              value: _global,
              onChanged: (v) => setState(() => _global = v),
              title: const Text('Global discovery'),
              subtitle: const Text(
                'Disabled by default. Focus on Makerere students only.',
              ),
            ),
          ),
          _section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Maximum distance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${_distance.round()} km',
                      style: const TextStyle(color: MakerereMockData.softText),
                    ),
                  ],
                ),
                Slider(
                  value: _distance,
                  min: 1,
                  max: 50,
                  activeColor: MakerereMockData.brandPink,
                  onChanged: (v) => setState(() => _distance = v),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _showFurther,
                  onChanged: (v) => setState(() => _showFurther = v),
                  title: const Text('Show people farther away if I run out'),
                ),
              ],
            ),
          ),
          _section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Age range',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                RangeSlider(
                  values: _age,
                  min: 18,
                  max: 40,
                  activeColor: MakerereMockData.brandPink,
                  labels: RangeLabels(
                    _age.start.round().toString(),
                    _age.end.round().toString(),
                  ),
                  onChanged: (v) => setState(() => _age = v),
                ),
              ],
            ),
          ),
          _section(
            child: SwitchListTile(
              value: _hasBio,
              onChanged: (v) => setState(() => _hasBio = v),
              title: const Text('Has a bio'),
              subtitle: const Text('Only show profiles with a bio'),
            ),
          ),
          _optionRow('Interests'),
          _optionRow('Looking for'),
          _optionRow('Open to'),
          _optionRow('Languages'),
          _optionRow('Education'),
          _optionRow('Communication style'),
          _optionRow('Love style'),
          _optionRow('Pets'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _section({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F2937)),
      ),
      child: child,
    );
  }

  Widget _optionRow(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      title: Text(title),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select', style: TextStyle(color: MakerereMockData.softText)),
          SizedBox(width: 6),
          Icon(Icons.chevron_right, color: MakerereMockData.softText),
        ],
      ),
    );
  }
}
