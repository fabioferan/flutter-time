import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/chronos_colors.dart';
import '../../../../app/theme/chronos_typography.dart';
import '../../../../core/widgets/interactive_hover_card.dart';

class WorldClockView extends StatefulWidget {
  const WorldClockView({super.key});

  @override
  State<WorldClockView> createState() => _WorldClockViewState();
}

class _WorldClockViewState extends State<WorldClockView> {
  late Timer _ticker;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utc = _now.toUtc();
    final timeZones = [
      {'city': 'São Paulo (Local)', 'offset': -3, 'tag': 'Principal'},
      {'city': 'New York', 'offset': -4, 'tag': 'UTC-4'},
      {'city': 'London', 'offset': 1, 'tag': 'UTC+1'},
      {'city': 'Tokyo', 'offset': 9, 'tag': 'UTC+9'},
      {'city': 'San Francisco', 'offset': -7, 'tag': 'UTC-7'},
      {'city': 'Sydney', 'offset': 11, 'tag': 'UTC+11'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hora Mundial', style: ChronosTypography.headlineLg),
                      const SizedBox(height: 4),
                      Text(
                        'Monitoramento de fusos horários e sincronização global.',
                        style: ChronosTypography.bodyMd,
                      ),
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
                    icon: const Icon(Icons.add, size: 18),
                    label: Text('Adicionar Fuso', style: ChronosTypography.labelLg),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Hero Focal Time Card
              InteractiveHoverCard(
                borderRadius: BorderRadius.circular(16),
                normalColor: ChronosColors.surfaceContainerLow,
                hoverColor: ChronosColors.surfaceContainer,
                borderColor: ChronosColors.primaryContainer.withValues(alpha: 0.3),
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: ChronosColors.secondary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('HORÁRIO PADRÃO LOCAL', style: ChronosTypography.labelSm),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            DateFormat('HH:mm:ss').format(_now),
                            style: ChronosTypography.displayXl.copyWith(
                              color: ChronosColors.primary,
                              letterSpacing: -2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            DateFormat('EEEE, d MMMM yyyy').format(_now),
                            style: ChronosTypography.bodyLg.copyWith(
                              color: ChronosColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.public,
                      size: 96,
                      color: ChronosColors.surfaceContainerHighest,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text('Cidades Monitoradas', style: ChronosTypography.headlineSm),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 900
                      ? 3
                      : constraints.maxWidth > 600
                          ? 2
                          : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeZones.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 130,
                    ),
                    itemBuilder: (context, index) {
                      final item = timeZones[index];
                      final offset = item['offset'] as int;
                      final cityTime = utc.add(Duration(hours: offset));
                      final timeStr = DateFormat('HH:mm').format(cityTime);
                      final isDay = cityTime.hour >= 6 && cityTime.hour < 18;

                      return InteractiveHoverCard(
                        borderRadius: BorderRadius.circular(12),
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      isDay ? Icons.wb_sunny_outlined : Icons.nightlight_round_outlined,
                                      size: 16,
                                      color: isDay ? ChronosColors.tertiary : ChronosColors.secondary,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      item['city'] as String,
                                      style: ChronosTypography.labelLg.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['tag'] as String,
                                  style: ChronosTypography.labelSm,
                                ),
                              ],
                            ),
                            Text(
                              timeStr,
                              style: ChronosTypography.displayLg.copyWith(
                                fontSize: 36,
                                color: ChronosColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
