import 'package:demo_fx_project/model/candlestick.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockChart extends StatelessWidget {
  static final NumberFormat priceFormat = NumberFormat.compact();
  const StockChart({Key? key, required this.candleStick, this.tintColor = Colors.grey}) : super(key: key);
  static const TextStyle axisTextStyle = TextStyle(fontSize: 12);

  final Color tintColor;
  final List<Candlestick> candleStick;

  LineChartBarData getChartData(BuildContext context) {
    return LineChartBarData(
      spots: candleStick
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value.close.toDouble()))
          .toList(),
      color: tintColor,
      dotData: FlDotData(show: false),
      isCurved: true,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [tintColor.withAlpha(90), tintColor.withAlpha(30)]),
      ),
    );
  }

  Widget _getDateTitleWidget(double value, TitleMeta meta) {
    final date = candleStick[value.toInt()].time;
    final label = '${date.hour}:00';
    return SideTitleWidget(
      child: Text(label, style: axisTextStyle),
      axisSide: meta.axisSide,
    );
  }

  Widget _getLeftTitleWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
      child: Text(priceFormat.format(value), style: axisTextStyle),
      axisSide: meta.axisSide,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        lineBarsData: [getChartData(context)],
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (v) => FlLine(
            strokeWidth: 0.5,
            // color: Colors.grey.shade500,
            dashArray: [1, 5],
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 40,
              showTitles: true,
              getTitlesWidget: _getLeftTitleWidget,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: false,
                getTitlesWidget: _getDateTitleWidget,
                interval: candleStick.length / 4),
          ),
        ),
      ),
    );
  }
}
