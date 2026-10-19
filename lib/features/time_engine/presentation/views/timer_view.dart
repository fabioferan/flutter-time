import 'package:flutter/material.dart';
import '../../../../app/theme/chronos_colors.dart';
import '../../../../app/theme/chronos_typography.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int _selectedMinutes = 25;

  @override
  Widget build(BuildContext context) {
    final presets = [5, 10, 15, 25, 45, 60];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Temporizador', style: ChronosTypography.headlineLg),
              const SizedBox(height: 4),
              Text('Contagem regressiva configurável com avisos táteis e visuais.', style: ChronosTypography.bodyMd),
              const SizedBox(height: 36),
              // Main Dial Container
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ChronosColors.surfaceContainerLowest,
                    border: Border.all(color: ChronosColors.primaryContainer, width: 3),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_selectedMinutes.toString().padLeft(2, '0')}:00',
                          style: ChronosTypography.displayLg.copyWith(fontSize: 54, color: ChronosColors.primary),
                        ),
                        const SizedBox(height: 6),
                        Text('PRONTO PARA INICIAR', style: ChronosTypography.labelSm),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: presets.map((mins) {
                    final isSelected = _selectedMinutes == mins;
                    return ChoiceChip(
                      label: Text('${mins}m', style: ChronosTypography.labelMd),
                      selected: isSelected,
                      selectedColor: ChronosColors.primaryContainer,
                      backgroundColor: ChronosColors.surfaceContainer,
                      side: BorderSide(
                        color: isSelected ? ChronosColors.secondary : ChronosColors.outlineVariant,
                      ),
                      onSelected: (val) {
                        if (val) setState(() => _selectedMinutes = mins);
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ChronosColors.primaryContainer,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  ),
                  onPressed: () {},
                  child: Text('Iniciar Contagem', style: ChronosTypography.labelLg),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
