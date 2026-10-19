import 'package:flutter/material.dart';
import '../../../../app/theme/chronos_colors.dart';
import '../../../../app/theme/chronos_typography.dart';
import '../../../../core/widgets/interactive_hover_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _soundEnabled = true;
  bool _secondsEnabled = true;
  bool _militaryTime = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Configurações do Sistema', style: ChronosTypography.headlineLg),
              const SizedBox(height: 4),
              Text('Preferências de renderização, áudio e formato temporal.', style: ChronosTypography.bodyMd),
              const SizedBox(height: 32),
              InteractiveHoverCard(
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text('Formato 24 Horas', style: ChronosTypography.labelLg),
                      subtitle: Text('Alterna entre 24h e formato AM/PM.', style: ChronosTypography.bodySm),
                      value: _militaryTime,
                      activeThumbColor: ChronosColors.primary,
                      activeTrackColor: ChronosColors.primaryContainer,
                      onChanged: (v) => setState(() => _militaryTime = v),
                    ),
                    const Divider(color: ChronosColors.outlineVariant, height: 24),
                    SwitchListTile(
                      title: Text('Exibir Segundos nos Dials', style: ChronosTypography.labelLg),
                      subtitle: Text('Mostra a oscilação suave de segundos em relógios mundiais.', style: ChronosTypography.bodySm),
                      value: _secondsEnabled,
                      activeThumbColor: ChronosColors.primary,
                      activeTrackColor: ChronosColors.primaryContainer,
                      onChanged: (v) => setState(() => _secondsEnabled = v),
                    ),
                    const Divider(color: ChronosColors.outlineVariant, height: 24),
                    SwitchListTile(
                      title: Text('Alertas Sonoros Táteis', style: ChronosTypography.labelLg),
                      subtitle: Text('Reproduzir sinal sonoro ao finalizar contagens e timers.', style: ChronosTypography.bodySm),
                      value: _soundEnabled,
                      activeThumbColor: ChronosColors.primary,
                      activeTrackColor: ChronosColors.primaryContainer,
                      onChanged: (v) => setState(() => _soundEnabled = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              InteractiveHoverCard(
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: ChronosColors.secondary, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Flutter Time Engine v1.0.0', style: ChronosTypography.labelLg),
                          Text('Base única Flutter compilada para Desktop & Web (Wasm ready).', style: ChronosTypography.bodySm),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
