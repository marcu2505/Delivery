part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
  ..add(ApplePayPaymentType.serializer)
  ..add(Brand.serializer)
  ..add(BuyerVerificationDetails.serializer)
  ..add(Card.serializer)
  ..add(CardDetails.serializer)
  ..add(CardPrepaidType.serializer)
  ..add(CardType.serializer)
  ..add(Contact.serializer)
  ..add(ErrorCode.serializer)
  ..add(ErrorInfo.serializer)
  ..add(Font.serializer)
  ..add(IOSTheme.serializer)
  ..add(KeyboardAppearance.serializer)
  ..add(Money.serializer)
  ..add(RGBAColor.serializer)
  ..addBuilderFactory(
      const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();
