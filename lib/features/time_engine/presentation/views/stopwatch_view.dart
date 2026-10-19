import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../app/theme/chronos_colors.dart';
import '../../../../app/theme/chronos_typography.dart';
import '../../../../core/widgets/interactive_hover_card.dart';

class StopwatchView extends StatefulWidget {
  const StopwatchView({super.key});

  @override
  State<StopwatchView> createState() => _StopwatchViewState();
}

class _StopwatchViewState extends State<StopwatchView> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  final List<Duration> _laps = [];

  void _startOrPause() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
        _timer?.cancel();
      } else {
        _stopwatch.start();
        _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
          if (mounted) setState(() {});
        });
      }
    });
  }

  void _recordLap() {
    if (_stopwatch.isRunning) {
      setState(() {
        _laps.insert(0, _stopwatch.elapsed);
      });
    }
  }

  void _reset() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.stop();
      _timer?.cancel();
      _laps.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatStopwatch(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final centis = (duration.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');
    return '$minutes:$seconds.$centis';
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _stopwatch.elapsed;
    final isRunning = _stopwatch.isRunning;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cronômetro de Alta Precisão', style: ChronosTypography.headlineLg),
                      const SizedBox(height: 4),
                      Text('Medição centesimal com divisão de voltas.', style: ChronosTypography.bodyMd),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 48),
              // Dial Central Widget
              Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ChronosColors.surfaceContainerLowest,
                  border: Border.all(
                    color: isRunning ? ChronosColors.primaryContainer : ChronosColors.surfaceContainerHigh,
                    width: 3,
                  ),
                  boxShadow: isRunning
                      ? [
                          BoxShadow(
                            color: ChronosColors.primaryContainer.withValues(alpha: 0.25),
                            blurRadius: 36,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _formatStopwatch(elapsed),
                        style: ChronosTypography.displayLg.copyWith(
                          fontSize: 48,
                          color: isRunning ? ChronosColors.primary : ChronosColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isRunning ? 'EXECUÇÃO ATIVA' : 'PAUSADO',
                        style: ChronosTypography.labelSm.copyWith(
                          color: isRunning ? ChronosColors.secondary : ChronosColors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              // Actions Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRunning ? ChronosColors.errorContainer : ChronosColors.primaryContainer,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    ),
                    onPressed: _startOrPause,
                    child: Text(isRunning ? 'Parar' : 'Iniciar', style: ChronosTypography.labelLg),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ChronosColors.onSurface,
                      side: const BorderSide(color: ChronosColors.outlineVariant),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    ),
                    onPressed: isRunning ? _recordLap : null,
                    child: Text('Registrar Volta', style: ChronosTypography.labelLg),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ChronosColors.outline,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    ),
                    onPressed: elapsed > Duration.zero ? _reset : null,
                    child: Text('Zerar', style: ChronosTypography.labelLg),
                  ),
                ],
              ),
              if (_laps.isNotEmpty) ...[
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Histórico de Voltas', style: ChronosTypography.headlineSm),
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _laps.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final lapNumber = _laps.length - index;
                    final lapTime = _laps[index];
                    return InteractiveHoverCard(
                      borderRadius: BorderRadius.circular(8),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Volta #$lapNumber', style: ChronosTypography.labelLg),
                          Text(
                            _formatStopwatch(lapTime),
                            style: ChronosTypography.monoNumericLg.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
