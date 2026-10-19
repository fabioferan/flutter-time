import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/theme/chronos_colors.dart';
import '../../app/theme/chronos_typography.dart';
import '../../features/time_engine/presentation/views/alarms_view.dart';
import '../../features/time_engine/presentation/views/settings_view.dart';
import '../../features/time_engine/presentation/views/stopwatch_view.dart';
import '../../features/time_engine/presentation/views/timer_view.dart';
import '../../features/time_engine/presentation/views/world_clock_view.dart';
import 'chronos_breakpoints.dart';

class ChronosAppScaffold extends StatefulWidget {
  const ChronosAppScaffold({super.key});

  @override
  State<ChronosAppScaffold> createState() => _ChronosAppScaffoldState();
}

class _ChronosAppScaffoldState extends State<ChronosAppScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _views = const [
    WorldClockView(),
    TimerView(),
    StopwatchView(),
    AlarmsView(),
    SettingsView(),
  ];

  final List<({String label, IconData icon, IconData activeIcon, String shortcut})> _navItems = const [
    (label: 'Hora Mundial', icon: Icons.public_outlined, activeIcon: Icons.public, shortcut: '1'),
    (label: 'Temporizador', icon: Icons.hourglass_empty, activeIcon: Icons.hourglass_full, shortcut: '2'),
    (label: 'Cronômetro', icon: Icons.timer_outlined, activeIcon: Icons.timer, shortcut: '3'),
    (label: 'Alarmes', icon: Icons.alarm_outlined, activeIcon: Icons.alarm, shortcut: '4'),
    (label: 'Configuração', icon: Icons.tune_outlined, activeIcon: Icons.tune, shortcut: '5'),
  ];

  void _onSelectTab(int index) {
    if (index >= 0 && index < _views.length) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ChronosBreakpoints.isMobile(context);

    // Keyboard Shortcuts (Alt+1 to Alt+5 or Cmd/Ctrl+1 to 5)
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.digit1, alt: true): const _NavIntent(0),
        const SingleActivator(LogicalKeyboardKey.digit2, alt: true): const _NavIntent(1),
        const SingleActivator(LogicalKeyboardKey.digit3, alt: true): const _NavIntent(2),
        const SingleActivator(LogicalKeyboardKey.digit4, alt: true): const _NavIntent(3),
        const SingleActivator(LogicalKeyboardKey.digit5, alt: true): const _NavIntent(4),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _NavIntent: CallbackAction<_NavIntent>(
            onInvoke: (intent) => _onSelectTab(intent.targetIndex),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            backgroundColor: ChronosColors.background,
            body: SafeArea(
              child: Row(
                children: [
                  // Persistent Navigation Rail for Web & Desktop (hidden in Mobile)
                  if (!isMobile)
                    _buildNavigationRail(context),
                  if (!isMobile)
                    const VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Color(0x1FFFFFFF),
                    ),
                  // Main Body View
                  Expanded(
                    child: _views[_selectedIndex],
                  ),
                ],
              ),
            ),
            // BottomNavigationBar prepared for future mobile adaptation
            bottomNavigationBar: isMobile
                ? NavigationBar(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onSelectTab,
                    backgroundColor: ChronosColors.surfaceContainerLowest,
                    destinations: _navItems.map((item) {
                      return NavigationDestination(
                        icon: Icon(item.icon),
                        selectedIcon: Icon(item.activeIcon, color: ChronosColors.primary),
                        label: item.label,
                      );
                    }).toList(),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return Container(
      width: 72,
      color: ChronosColors.surfaceContainerLowest,
      child: Column(
        children: [
          const SizedBox(height: 18),
          // App Logo / Symbol
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: ChronosColors.primaryContainer.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ChronosColors.primaryContainer.withValues(alpha: 0.6),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.schedule,
                color: ChronosColors.primary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(thickness: 1, indent: 12, endIndent: 12, color: Color(0x1FFFFFFF)),
          const SizedBox(height: 12),
          // Nav Items
          Expanded(
            child: ListView.separated(
              itemCount: _navItems.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _navItems[index];
                final isSelected = _selectedIndex == index;

                return Tooltip(
                  message: '${item.label} (Alt+${item.shortcut})',
                  preferBelow: false,
                  child: Center(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _onSelectTab(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ChronosColors.primaryContainer.withValues(alpha: 0.25)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? ChronosColors.secondary.withValues(alpha: 0.5)
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            isSelected ? item.activeIcon : item.icon,
                            color: isSelected ? ChronosColors.primary : ChronosColors.outline,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Bottom Help / Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Tooltip(
              message: 'Atalhos: Alt + 1..5',
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ChronosColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('Alt+N', style: ChronosTypography.labelSm),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIntent extends Intent {
  final int targetIndex;
  const _NavIntent(this.targetIndex);
}
