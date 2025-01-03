import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class HomeScreen extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime? selectedTime;
  final String? selectedStartLocation;
  final String? selectedEndLocation;
  final String? appointmentName;

  const HomeScreen({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedStartLocation,
    this.selectedEndLocation,
    this.appointmentName,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime now = DateTime.now();
  late DateTime firstDayOfWeek;
  late DateTime lastDayOfWeek;

  DateTime? selectedDate; // 선택된 날짜

  @override
  void initState() {
    super.initState();
    firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));
    selectedDate = widget.selectedDate ?? now; // 초기값 설정
  }

  void _toggleCalendarFormat() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.week
          ? CalendarFormat.month
          : CalendarFormat.week;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.outline,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(height: 60, color: context.color.surface),
            Container(
              color: context.color.surface,
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 24.0,
              ),
              child: GestureDetector(
                onTap: _toggleCalendarFormat,
                child: Row(
                  children: [
                    Text(DateFormat('yyyy년 M월').format(now),
                        style: ZzekakTextStyle.h3(context,
                            fontWeight: FontWeight.bold)),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            Container(
              color: context.color.surface,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: now,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                headerVisible: false,
                calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: context.color.primary,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration:
                        const BoxDecoration(color: Colors.transparent),
                    selectedTextStyle: ZzekakTextStyle.h6(context)),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    now = focusedDay;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    bool isFocused = isSameDay(day, now);
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: isSameDay(selectedDate, day)
                            ? context.color.primary
                            : Colors.transparent,
                        border: isFocused
                            ? Border.all(
                                color: context.color.primary,
                                width: 2.0,
                              )
                            : null,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: isFocused
                              ? context.color.primary
                              : context.color.onSurface,
                          fontWeight:
                              isFocused ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Column(
                      children: [
                        const SizedBox(height: 18),
                        Text(
                          '${day.day}',
                          style: TextStyle(
                            color: context.color.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: context.color.tertiary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: context.color.primary,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: ZzekakTextStyle.h6(context,
                            color: context.color.surface),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(height: 20, color: context.color.surface),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('오늘의 약속',
                            style: ZzekakTextStyle.h4(context,
                                fontWeight: FontWeight.bold)),
                      ),
                      if (selectedDate != null && isSameDay(selectedDate, now))
                        SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.color.onTertiary, width: 1),
                              color: context.color.surface,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        widget.appointmentName ??
                                            widget.selectedEndLocation ??
                                            "N/A",
                                        style: ZzekakTextStyle.h2(context)),
                                    Icon(
                                      Icons.chevron_right,
                                      color: context.color.tertiary,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined,
                                        size: 20),
                                    const SizedBox(width: 5),
                                    Text(widget.selectedEndLocation ?? "N/A",
                                        style: ZzekakTextStyle.h5(context)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.people_outline, size: 20),
                                    const SizedBox(width: 5),
                                    Text('친구를 초대해보세요!',
                                        style: ZzekakTextStyle.h5(context)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 20),
                                    const SizedBox(width: 5),
                                    Text(
                                        widget.selectedTime != null
                                            ? DateFormat('a hh:mm', 'ko')
                                                .format(widget.selectedTime!)
                                            : "N/A",
                                        style: ZzekakTextStyle.h5(context)),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      decoration: BoxDecoration(
                                        color: context.color.outline,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        widget.selectedTime != null
                                            ? '안전 출발시간: ${DateFormat('a hh:mm', 'ko').format(widget.selectedTime!.subtract(const Duration(hours: 1)))}'
                                            : "N/A",
                                        style: ZzekakTextStyle.h6(
                                          context,
                                          color:
                                              context.color.tertiaryContainer,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                zzekakElevatedButton(
                                  context: context,
                                  onPressed: () async {},
                                  text: '출발하기',
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.color.onTertiary, width: 1),
                              color: context.color.surface,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('아직 등록된 약속이 없어요\n새로운 약속을 만들어보세요!',
                                    style: ZzekakTextStyle.h5(context)),
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  decoration: BoxDecoration(
                                      color: context.color.tertiary,
                                      borderRadius: BorderRadius.circular(14)),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '미션',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내정보',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: context.color.onSurface,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const AppointmentSetupRoute().go(context),
        backgroundColor: context.color.onSurface,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: context.color.surface),
      ),
    );
  }
}
