import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _nameCtrl = TextEditingController();
  final _birthCtrl = TextEditingController();
  final _schoolCtrl = TextEditingController(text: 'Makerere University');
  final _aboutCtrl = TextEditingController();

  int _step = 0;
  String? _gender;
  double _distance = 50;
  final Set<String> _interests = <String>{};
  final Set<String> _lookingFor = <String>{};

  final List<String> _steps = const [
    'Name',
    'Gender',
    'Birthday',
    'Campus',
    'Distance',
    'Interests',
    'Looking For',
    'Profile',
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _birthCtrl.dispose();
    _schoolCtrl.dispose();
    _aboutCtrl.dispose();
    super.dispose();
  }

  bool get _canContinue {
    switch (_step) {
      case 0:
        return _nameCtrl.text.trim().length >= 2;
      case 1:
        return _gender != null;
      case 2:
        return _birthCtrl.text.trim().length >= 8;
      case 3:
        return _schoolCtrl.text.toLowerCase().contains('makerere');
      case 4:
        return true;
      case 5:
        return _interests.isNotEmpty;
      case 6:
        return _lookingFor.isNotEmpty;
      case 7:
        return true;
      default:
        return false;
    }
  }

  void _next() {
    if (!_canContinue) return;
    if (_step == _steps.length - 1) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
      return;
    }
    setState(() => _step += 1);
  }

  void _back() {
    if (_step == 0) {
      Navigator.maybePop(context);
      return;
    }
    setState(() => _step -= 1);
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_step + 1) / _steps.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _back,
        ),
        actions: [
          if (_step >= 5)
            TextButton(onPressed: _next, child: const Text('Skip')),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: const Color(0xFF273043),
                  valueColor: const AlwaysStoppedAnimation(
                    MakerereMockData.brandPink,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: _buildStepContent()),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: _canContinue ? _next : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _canContinue
                        ? const Color(0xFFF3F4F6)
                        : const Color(0xFF3A4354),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _step == _steps.length - 1 ? 'Start matching' : 'Next',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_step) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your first name?',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameCtrl,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: 'e.g. Brian'),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is how it will appear on your profile. Cannot change it later.',
              style: TextStyle(color: MakerereMockData.softText),
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your gender?',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 24),
            _pillChoice(
              'Woman',
              _gender == 'Woman',
              () => setState(() => _gender = 'Woman'),
            ),
            const SizedBox(height: 12),
            _pillChoice(
              'Man',
              _gender == 'Man',
              () => setState(() => _gender = 'Man'),
            ),
            const SizedBox(height: 12),
            _pillChoice(
              'Prefer not to say',
              _gender == 'Prefer not to say',
              () => setState(() => _gender = 'Prefer not to say'),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your b-day?',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _birthCtrl,
              keyboardType: TextInputType.datetime,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: 'DD/MM/YYYY'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your profile shows your age, not your date of birth.',
              style: TextStyle(color: MakerereMockData.softText),
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'If studying is your thing...',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _schoolCtrl,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(hintText: 'School'),
            ),
            const SizedBox(height: 10),
            const Text(
              'For this release, matching is limited to Makerere University students.',
              style: TextStyle(color: MakerereMockData.softText),
            ),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your distance preference?',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            const Text(
              'Set the maximum distance for campus matches around Makerere and nearby hostels.',
              style: TextStyle(color: MakerereMockData.softText, fontSize: 17),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Distance preference',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${_distance.round()} km',
                  style: const TextStyle(
                    fontSize: 24,
                    color: MakerereMockData.softText,
                  ),
                ),
              ],
            ),
            Slider(
              value: _distance,
              min: 1,
              max: 50,
              activeColor: MakerereMockData.brandPink,
              inactiveColor: const Color(0xFF3B4456),
              onChanged: (v) => setState(() => _distance = v),
            ),
          ],
        );
      case 5:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you into?',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            const Text(
              'Pick at least one interest to personalize your recommendations.',
              style: TextStyle(color: MakerereMockData.softText, fontSize: 17),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: MakerereMockData.onboardingInterests.map((
                    interest,
                  ) {
                    final selected = _interests.contains(interest);
                    return FilterChip(
                      label: Text(interest),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          if (selected) {
                            _interests.remove(interest);
                          } else {
                            _interests.add(interest);
                          }
                        });
                      },
                      selectedColor: MakerereMockData.brandPink.withValues(
                        alpha: 0.3,
                      ),
                      side: BorderSide(
                        color: selected
                            ? MakerereMockData.brandPink
                            : const Color(0xFF2D3648),
                      ),
                      backgroundColor: const Color(0xFF111827),
                      showCheckmark: false,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      case 6:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you looking for?',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                itemCount: MakerereMockData.lookingFor.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  final option = MakerereMockData.lookingFor[index];
                  final selected = _lookingFor.contains(option);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selected) {
                          _lookingFor.remove(option);
                        } else {
                          _lookingFor.add(option);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B1220),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selected
                              ? MakerereMockData.brandPink
                              : const Color(0xFF2D3648),
                          width: selected ? 2 : 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      case 7:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share more about yourself',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _aboutCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText:
                    'Short bio: classes, passions, and what kind of connection you want.',
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF2D3648)),
                color: const Color(0xFF0D1424),
              ),
              child: Text(
                'Name: ${_nameCtrl.text.isEmpty ? 'Your name' : _nameCtrl.text}\nGender: ${_gender ?? '-'}\nDistance: ${_distance.round()} km\nCampus: ${_schoolCtrl.text}\nInterests: ${_interests.join(', ')}',
                style: const TextStyle(
                  color: MakerereMockData.softText,
                  height: 1.5,
                ),
              ),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _pillChoice(String text, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected
              ? MakerereMockData.brandPink.withValues(alpha: 0.18)
              : const Color(0xFF0E1525),
          border: Border.all(
            color: selected
                ? MakerereMockData.brandPink
                : const Color(0xFF2D3648),
            width: selected ? 2 : 1,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
