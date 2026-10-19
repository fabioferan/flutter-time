import 'package:flutter/material.dart';
import '../../../../app/theme/chronos_colors.dart';
import '../../../../app/theme/chronos_typography.dart';
import '../../../../core/widgets/interactive_hover_card.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  final List<Map<String, dynamic>> _alarms = [
    {'time': '06:30', 'label': 'Despertar Matinal', 'days': 'Seg - Sex', 'enabled': true},
    {'time': '09:00', 'label': 'Daily Standup Call', 'days': 'Seg - Sex', 'enabled': true},
    {'time': '14:00', 'label': 'Sessão Foco Profundo', 'days': 'Todos os dias', 'enabled': false},
    {'time': '22:30', 'label': 'Hora de Desconectar', 'days': 'Todos os dias', 'enabled': true},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alarmes & Alertas', style: ChronosTypography.headlineLg),
                      const SizedBox(height: 4),
                      Text('Programação de horários e rotinas inteligentes.', style: ChronosTypography.bodyMd),
                    ],
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ChronosColors.primaryContainer,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.add_alarm, size: 18),
                    label: Text('Novo Alarme', style: ChronosTypography.labelLg),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _alarms.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final alarm = _alarms[index];
                  final isEnabled = alarm['enabled'] as bool;

                  return InteractiveHoverCard(
                    borderRadius: BorderRadius.circular(12),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isEnabled ? ChronosColors.secondary : ChronosColors.outlineVariant,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alarm['time'] as String,
                              style: ChronosTypography.monoNumericLg.copyWith(
                                fontSize: 32,
                                color: isEnabled ? ChronosColors.onSurface : ChronosColors.outline,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${alarm['label']} • ${alarm['days']}',
                              style: ChronosTypography.bodySm,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Switch(
                          value: isEnabled,
                          activeThumbColor: ChronosColors.primary,
                          activeTrackColor: ChronosColors.primaryContainer,
                          onChanged: (val) {
                            setState(() => alarm['enabled'] = val);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
