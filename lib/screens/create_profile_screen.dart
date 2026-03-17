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
            TextButton(
              onPressed: _next,
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 2),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 4,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFF273043),
                    valueColor: const AlwaysStoppedAnimation(
                      MakerereMockData.brandPink,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 260),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.03, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey<int>(_step),
                    child: _buildStepContent(),
                  ),
                ),
              ),
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
                    style: const TextStyle(fontSize: 21),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_step) {
      case 0:
        return _stepScaffold(
          title: 'What is your first name?',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _underlineField(
                controller: _nameCtrl,
                hint: 'e.g. Brian',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              const Text(
                'This is how it will appear on your profile. Cannot change it later.',
                style: TextStyle(color: MakerereMockData.softText),
              ),
            ],
          ),
        );
      case 1:
        return _stepScaffold(
          title: 'What is your gender?',
          child: Column(
            children: [
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
          ),
        );
      case 2:
        return _stepScaffold(
          title: 'Your b-day?',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _underlineField(
                controller: _birthCtrl,
                hint: 'DD/MM/YYYY',
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
              const Text(
                'Your profile shows your age, not your date of birth.',
                style: TextStyle(color: MakerereMockData.softText),
              ),
            ],
          ),
        );
      case 3:
        return _stepScaffold(
          title: 'If studying is your thing...',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _underlineField(
                controller: _schoolCtrl,
                hint: 'School',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              const Text(
                'For this release, matching is limited to Makerere University students.',
                style: TextStyle(color: MakerereMockData.softText),
              ),
            ],
          ),
        );
      case 4:
        return _stepScaffold(
          title: 'Your distance preference?',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set the maximum distance for campus matches around Makerere and nearby hostels.',
                style: TextStyle(
                  color: MakerereMockData.softText,
                  fontSize: 17,
                ),
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
          ),
        );
      case 5:
        return _stepScaffold(
          title: 'What are you into?',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pick at least one interest to personalize your recommendations.',
                style: TextStyle(
                  color: MakerereMockData.softText,
                  fontSize: 17,
                ),
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
          ),
        );
      case 6:
        return _stepScaffold(
          title: 'What are you looking for?',
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
        );
      case 7:
        return _stepScaffold(
          title: 'Share more about yourself',
          child: Column(
            children: [
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
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _stepScaffold({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 1.04,
          ),
        ),
        const SizedBox(height: 18),
        Expanded(child: child),
      ],
    );
  }

  Widget _underlineField({
    required TextEditingController controller,
    required String hint,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: hint,
        filled: false,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF465066)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MakerereMockData.brandPink),
        ),
      ),
    );
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
