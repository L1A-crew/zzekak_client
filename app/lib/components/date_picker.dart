import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime? initialSelectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({
    super.key,
    required this.initialSelectedDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _currentDate;
  late DateTime _selectedDate;
  final weekDays = ['일', '월', '화', '수', '목', '금', '토'];

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _selectedDate = widget.initialSelectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHandleBar(),
          const SizedBox(height: 28),
          _buildHeader(context),
          Expanded(
            child: _buildCalendar(context),
          ),
          const SizedBox(height: 16),
          _buildConfirmationButton(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHandleBar() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        width: 100,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(80, 198, 198, 198),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        '언제 만나나요?',
        style: ZzekakTextStyle.h2(context),
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return CalendarCarousel<Event>(
      onDayPressed: (date, events) => setState(() => _selectedDate = date),
      weekendTextStyle:
          const TextStyle(color: Color.fromARGB(255, 41, 166, 255)),
      thisMonthDayBorderColor: Colors.transparent,
      weekFormat: false,
      height: 420.0,
      selectedDateTime: _selectedDate,
      targetDateTime: _currentDate,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: const CircleBorder(),
      markedDateCustomTextStyle:
          ZzekakTextStyle.h5(context, context.color.onSurface),
      daysTextStyle: ZzekakTextStyle.h5(context, context.color.onSurface),
      showHeader: true,
      todayButtonColor: Colors.transparent,
      todayTextStyle:
          ZzekakTextStyle.h5(context, context.color.primary, FontWeight.bold),
      selectedDayButtonColor: context.color.primary,
      selectedDayTextStyle:
          ZzekakTextStyle.h5(context, Colors.black, FontWeight.bold),
      weekdayTextStyle: ZzekakTextStyle.h5(context),
      headerTextStyle: ZzekakTextStyle.h4(context, fontWeight: FontWeight.bold),
      iconColor: context.color.onSurface,
      headerMargin: const EdgeInsets.symmetric(vertical: 16),
      weekDayFormat: WeekdayFormat.short,
      weekDayMargin: const EdgeInsets.only(bottom: 12),
      firstDayOfWeek: 0,
      customWeekDayBuilder: (weekday, weekdayName) {
        return Expanded(
          child: Center(
            child: Text(
              weekDays[weekday],
              style: ZzekakTextStyle.h5(context, context.color.onSurface),
            ),
          ),
        );
      },
      onCalendarChanged: (date) => setState(() => _currentDate = date),
    );
  }

  Widget _buildConfirmationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: zzekakElevatedButton(
          context: context,
          onPressed: () {
            widget.onDateSelected(_selectedDate);

            Navigator.pop(context);
          },
          text: '확인',
        ),
      ),
    );
  }
}
