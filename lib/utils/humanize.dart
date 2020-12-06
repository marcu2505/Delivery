import 'package:cloud_firestore/cloud_firestore.dart';

String humanizeDate(Timestamp date) {
  var difference = date.toDate().difference(DateTime.now());
  var minutes = difference.inMinutes;
  var hours = difference.inHours;
  var days = difference.inDays;
  var weeks = (difference.inDays / 7).round();
  var months = (difference.inDays / 30).floor();
  var years = (difference.inDays / 365).floor();

  print("$days - $weeks - $months");

  if(minutes < 1) { return "menos de um minuto"; }
  if(minutes == 1) { return "um minuto"; }
  if(minutes > 1 && hours < 1) { return "$minutes minutos"; }
  if(hours == 1) { return "uma hora"; }
  if(hours > 1 && days < 1) { return "$hours horas"; }
  if(days == 1) { return "um dia"; }
  if(days > 1 && weeks < 1) { return "$days dias"; }
  if(weeks == 1) { return "uma semana"; }
  if(weeks > 1 && months < 1) { return "$weeks semanas"; }
  if(months == 1) { return "um mês"; }
  if(months > 1 && years < 1) { return "$months meses"; }
  if(years == 1) { return "um ano"; }
  if(years > 1) { return "$years anos"; }
}