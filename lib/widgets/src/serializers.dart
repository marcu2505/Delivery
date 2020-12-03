import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import '../models.dart';

part 'serializers.g.dart';

// ignore: unnecessary_const
@SerializersFor(const [
  ErrorCode,
  Brand,
  CardType,
  CardPrepaidType,
  ApplePayPaymentType,
  CardDetails,
  Card,
  RGBAColor,
  Font,
  KeyboardAppearance,
  IOSTheme,
  ErrorInfo,
  Money,
  Contact,
  BuyerVerificationDetails,
])
final Serializers serializers = _$serializers;