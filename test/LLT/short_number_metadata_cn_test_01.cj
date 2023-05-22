// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*

main() {
    var phoneMetadataCollection = PhonemetadataPhoneMetadataCollection()
    phoneMetadataCollection.readExternal(PHONE_NUMBER_METADATA_MAP.get("881").getOrThrow())
    var metadataList: ArrayList<PhonemetadataPhoneMetadata> = phoneMetadataCollection.getMetadataList()
    var stringBuilder: StringBuilder = StringBuilder()
    for (phoneMetadata in metadataList) {
        var size = metadataList.size
        stringBuilder.append("PhoneMetadatas size ==> ${size}")

        var hasGeneralDesc: Bool = phoneMetadata.hasGeneralDescFunc()
        stringBuilder.append("hasGeneralDesc ==> ${hasGeneralDesc}")
        if (hasGeneralDesc) {
            var generalDesc_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getGeneralDesc();
            getPhoneNumberDesc(generalDesc_.getOrThrow(), stringBuilder)
        }

        var hasFixedLine: Bool = phoneMetadata.hasFixedLineFunc()
        stringBuilder.append("hasFixedLine ==> ${hasFixedLine}")
        if (hasFixedLine) {
            var fixedLine_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getFixedLine();
            getPhoneNumberDesc(fixedLine_.getOrThrow(), stringBuilder)
        }

        var hasMobile: Bool = phoneMetadata.hasMobileFunc()
        stringBuilder.append("hasMobile ==> ${hasMobile}")
        if (hasMobile) {
            var mobile_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getMobile();
            getPhoneNumberDesc(mobile_.getOrThrow(), stringBuilder)
        }

        var hasTollFree: Bool = phoneMetadata.hasTollFreeFunc()
        stringBuilder.append("hasTollFree ==> ${hasTollFree}")
        if (hasTollFree) {
            var tollFree_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getTollFree();
            getPhoneNumberDesc(tollFree_.getOrThrow(), stringBuilder)
        }

        var hasPremiumRate: Bool = phoneMetadata.hasPremiumRateFunc()
        stringBuilder.append("hasPremiumRate ==> ${hasPremiumRate}")
        if (hasPremiumRate) {
            var premiumRate_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getPremiumRate();
            getPhoneNumberDesc(premiumRate_.getOrThrow(), stringBuilder)
        }

        var hasSharedCost: Bool = phoneMetadata.hasSharedCostFunc()
        stringBuilder.append("hasSharedCost ==> ${hasSharedCost}")
        if (hasSharedCost) {
            var sharedCost_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getSharedCost();
            getPhoneNumberDesc(sharedCost_.getOrThrow(), stringBuilder)
        }

        var hasPersonalNumber: Bool = phoneMetadata.hasPersonalNumberFunc()
        stringBuilder.append("hasPersonalNumber ==> ${hasPersonalNumber}")
        if (hasPersonalNumber) {
            var personalNumber_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getPersonalNumber();
            getPhoneNumberDesc(personalNumber_.getOrThrow(), stringBuilder)
        }

        var hasVoip: Bool = phoneMetadata.hasVoipFunc()
        stringBuilder.append("hasVoip ==> ${hasVoip}")
        if (hasVoip) {
            var voip_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getVoip();
            getPhoneNumberDesc(voip_.getOrThrow(), stringBuilder)
        }

        var hasPager: Bool = phoneMetadata.hasPagerFunc()
        stringBuilder.append("hasPager ==> ${hasPager}")
        if (hasPager) {
            var pager_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getPager()
            getPhoneNumberDesc(pager_.getOrThrow(), stringBuilder)
        }

        var hasUan: Bool = phoneMetadata.hasUanFunc()
        stringBuilder.append("hasUan ==> ${hasUan}")
        if (hasUan) {
            var uan_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getUan()
            getPhoneNumberDesc(uan_.getOrThrow(), stringBuilder)
        }

        var hasEmergency: Bool = phoneMetadata.hasEmergencyFunc()
        stringBuilder.append("hasEmergency ==> ${hasEmergency}")
        if (hasEmergency) {
            var emergency_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getEmergency()
            getPhoneNumberDesc(emergency_.getOrThrow(), stringBuilder)
        }

        var hasVoicemail: Bool = phoneMetadata.hasVoicemailFunc()
        stringBuilder.append("hasVoicemail ==> ${hasVoicemail}")
        if (hasVoicemail) {
            var voicemail_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getVoicemail()
            getPhoneNumberDesc(voicemail_.getOrThrow(), stringBuilder)
        }

        var hasShortCode: Bool = phoneMetadata.hasShortCodeFunc()
        stringBuilder.append("hasShortCode ==> ${hasShortCode}")
        if (hasShortCode) {
            var shortCode_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getShortCode()
            getPhoneNumberDesc(shortCode_.getOrThrow(), stringBuilder)
        }

        var hasStandardRate: Bool = phoneMetadata.hasStandardRateFunc()
        stringBuilder.append("hasStandardRate ==> ${hasStandardRate}")
        if (hasStandardRate) {
            var standardRate_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getStandardRate()
            getPhoneNumberDesc(standardRate_.getOrThrow(), stringBuilder)
        }

        var hasCarrierSpecific: Bool = phoneMetadata.hasCarrierSpecificFunc()
        stringBuilder.append("hasCarrierSpecific ==> ${hasCarrierSpecific}")
        if (hasCarrierSpecific) {
            var carrierSpecific_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getCarrierSpecific()
            getPhoneNumberDesc(carrierSpecific_.getOrThrow(), stringBuilder)
        }

        var hasSmsServices: Bool = phoneMetadata.hasSmsServicesFunc()
        stringBuilder.append("hasSmsServices ==> ${hasSmsServices}")
        if (hasSmsServices) {
            var smsServices_: Option<PhonemetadataPhoneNumberDesc> = phoneMetadata.getSmsServices()
            getPhoneNumberDesc(smsServices_.getOrThrow(), stringBuilder)
        }

        var hasNoInternationalDialling: Bool = phoneMetadata.hasNoInternationalDiallingFunc()
        stringBuilder.append("hasNoInternationalDialling ==> ${hasNoInternationalDialling}")
        if (hasNoInternationalDialling) {
            var noInternationalDialling_: Option<PhonemetadataPhoneNumberDesc> = 
                phoneMetadata.getNoInternationalDialling()
            getPhoneNumberDesc(noInternationalDialling_.getOrThrow(), stringBuilder)
        }

        var id_: String = phoneMetadata.getId()
        stringBuilder.append("id_ ==> ${id_}")

        var countryCode_: Int32 = phoneMetadata.getCountryCode()
        stringBuilder.append("countryCode_ ==> ${countryCode_}")

        var internationalPrefix_: String = phoneMetadata.getInternationalPrefix()
        stringBuilder.append("internationalPrefix_ ==> ${internationalPrefix_}")

        var hasPreferredInternationalPrefix: Bool = phoneMetadata.hasPreferredInternationalPrefixFunc()
        stringBuilder.append("hasPreferredInternationalPrefix ==> ${hasPreferredInternationalPrefix}")
        if (hasPreferredInternationalPrefix) {
            var preferredInternationalPrefix_: String = phoneMetadata.getPreferredInternationalPrefix()
            stringBuilder.append("preferredInternationalPrefix_ ==> ${preferredInternationalPrefix_}")
        }

        var hasNationalPrefix: Bool = phoneMetadata.hasNationalPrefixFunc()
        stringBuilder.append("hasNationalPrefix ==> ${hasNationalPrefix}")
        if (hasNationalPrefix) {
            var nationalPrefix_: String = phoneMetadata.getNationalPrefix()
            stringBuilder.append("nationalPrefix_ ==> ${nationalPrefix_}")
        }

        var hasPreferredExtnPrefix: Bool = phoneMetadata.hasPreferredExtnPrefixFunc()
        stringBuilder.append("hasPreferredExtnPrefix ==> ${hasPreferredExtnPrefix}")
        if (hasPreferredExtnPrefix) {
            var preferredExtnPrefix_: String = phoneMetadata.getPreferredExtnPrefix()
            stringBuilder.append("preferredExtnPrefix_ ==> ${preferredExtnPrefix_}")
        }

        var hasNationalPrefixForParsing: Bool = phoneMetadata.hasNationalPrefixForParsingFunc();
        stringBuilder.append("hasNationalPrefixForParsing ==> ${hasNationalPrefixForParsing}")
        if (hasNationalPrefixForParsing) {
            var nationalPrefixForParsing_: String = phoneMetadata.getNationalPrefixForParsing()
            stringBuilder.append("nationalPrefixForParsing_ ==> ${nationalPrefixForParsing_}")
        }

        var hasNationalPrefixTransformRule: Bool = phoneMetadata.hasNationalPrefixTransformRuleFunc();
        stringBuilder.append("hasNationalPrefixTransformRule ==> ${hasNationalPrefixTransformRule}")
        if (hasNationalPrefixTransformRule) {
            var nationalPrefixTransformRule_: String = phoneMetadata.getNationalPrefixTransformRule()
            stringBuilder.append("nationalPrefixTransformRule_ ==> ${nationalPrefixTransformRule_}")
        }

        var sameMobileAndFixedLinePattern_: Bool = phoneMetadata.getSameMobileAndFixedLinePattern()
        stringBuilder.append("sameMobileAndFixedLinePattern_ ==> ${sameMobileAndFixedLinePattern_}")

        var numberFormat_: ArrayList<PhonemetadataNumberFormat> = phoneMetadata.getNumberFormatList()
        stringBuilder.append("numberFormat_.size() ==> ${numberFormat_.size}")
        var times: Int32 = 1
        for (numberFormat in numberFormat_) {
            getNumberFormat(numberFormat, stringBuilder, times)
            times++
        }
        times = 1
        var intlNumberFormat_: ArrayList<PhonemetadataNumberFormat> = phoneMetadata.getIntlNumberFormatList()
        stringBuilder.append("intlNumberFormat_.size() ==> ${intlNumberFormat_.size}")
        for (numberFormat in intlNumberFormat_) {
            getNumberFormat(numberFormat, stringBuilder, times)
            times++
        }

        var mainCountryForCode_: Bool = phoneMetadata.isMainCountryForCode()
        stringBuilder.append("mainCountryForCode_ ==> ${mainCountryForCode_}")

        var hasLeadingDigits: Bool = phoneMetadata.hasLeadingDigitsFunc()
        stringBuilder.append("hasLeadingDigits ==> ${hasLeadingDigits}")
        if (hasLeadingDigits) {
            var leadingDigits_: String = phoneMetadata.getLeadingDigits()
            stringBuilder.append("leadingDigits_ ==> " + leadingDigits_)
        }

        var leadingZeroPossible_: Bool = phoneMetadata.isLeadingZeroPossible()
        stringBuilder.append("leadingZeroPossible_ ==> ${leadingZeroPossible_}")

        var mobileNumberPortableRegion_: Bool = phoneMetadata.getMobileNumberPortableRegion()
        stringBuilder.append("mobileNumberPortableRegion_ ==> ${mobileNumberPortableRegion_}")
    }
    var expData: String = 
        "PhoneMetadatas size ==> 1hasGeneralDesc ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> [19]\\d\\d(?:\\d{2,3})?possibleLength_.size ==> 3possibleLength_ ==> 3possibleLength_ ==> 5possibleLength_ ==> 6possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasFixedLine ==> falsehasMobile ==> falsehasTollFree ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1(?:1[09]|20)possibleLength_.size ==> 1possibleLength_ ==> 3possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 110↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasPremiumRate ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasSharedCost ==> falsehasPersonalNumber ==> falsehasVoip ==> falsehasPager ==> falsehasUan ==> falsehasEmergency ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1(?:1[09]|20)possibleLength_.size ==> 1possibleLength_ ==> 3possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 110↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasVoicemail ==> falsehasShortCode ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1(?:00\\d\\d|1[029]|20)|95\\d{3,4}possibleLength_.size ==> 0possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 110↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasStandardRate ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1(?:00\\d\\d|12)|95\\d{3,4}possibleLength_.size ==> 0possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 112↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasCarrierSpecific ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasSmsServices ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasNoInternationalDialling ==> falseid_ ==> CNcountryCode_ ==> 0internationalPrefix_ ==> hasPreferredInternationalPrefix ==> falsehasNationalPrefix ==> falsehasPreferredExtnPrefix ==> falsehasNationalPrefixForParsing ==> falsehasNationalPrefixTransformRule ==> falsesameMobileAndFixedLinePattern_ ==> falsenumberFormat_.size() ==> 0intlNumberFormat_.size() ==> 0mainCountryForCode_ ==> falsehasLeadingDigits ==> falseleadingZeroPossible_ ==> falsemobileNumberPortableRegion_ ==> false"
    if (stringBuilder.toString() != expData) {
        return 0
    }
    return 1
}

func getPhoneNumberDesc(generalDesc_: PhonemetadataPhoneNumberDesc, stringBuilder: StringBuilder) {
    stringBuilder.append(
        "↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
    var hasNationalNumberPattern: Bool = generalDesc_.hasNationalNumberPatternFunc()
    stringBuilder.append("hasNationalNumberPattern ==> ${hasNationalNumberPattern}")
    if (hasNationalNumberPattern) {
        var nationalNumberPattern_: String = generalDesc_.getNationalNumberPattern()
        stringBuilder.append("nationalNumberPattern_ ==> ${nationalNumberPattern_}")
    }
    var possibleLength_: ArrayList<Int32> = generalDesc_.getPossibleLengthList()
    stringBuilder.append("possibleLength_.size ==> ${possibleLength_.size}")
    for (integer in possibleLength_) {
        stringBuilder.append("possibleLength_ ==> ${integer}")
    }
    var possibleLengthLocalOnly_: ArrayList<Int32> = generalDesc_.getPossibleLengthLocalOnlyList()
    stringBuilder.append("possibleLengthLocalOnly_.size ==> ${possibleLengthLocalOnly_.size}")
    for (integer in possibleLengthLocalOnly_) {
        stringBuilder.append("possibleLengthLocalOnly_ ==> ${integer}")
    }
    var hasExampleNumber: Bool = generalDesc_.hasExampleNumberFunc()
    stringBuilder.append("hasExampleNumber ==> ${hasExampleNumber}")
    if (hasExampleNumber) {
        var exampleNumber_: String = generalDesc_.getExampleNumber()
        stringBuilder.append("exampleNumber_ ==> ${exampleNumber_}")
    }
    stringBuilder.append(
        "↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑");
}

func getNumberFormat(numberFormat: PhonemetadataNumberFormat, stringBuilder: StringBuilder, times: Int32) {
    stringBuilder.append(
        "↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  ${times}  ↓↓↓↓↓↓↓↓↓↓↓")

    var pattern_: String = numberFormat.getPattern()
    stringBuilder.append("pattern ==> ${pattern_}")

    var format_: String = numberFormat.getFormat()
    stringBuilder.append("format_ ==> ${format_}")

    var leadingDigitsPattern_: ArrayList<String> = numberFormat.leadingDigitPatterns()
    stringBuilder.append("leadingDigitsPattern_.size() ==> ${leadingDigitsPattern_.size}")
    for (s in leadingDigitsPattern_) {
        stringBuilder.append("leadingDigitsPattern_ ==> ${s}")
    }

    var hasNationalPrefixFormattingRule: Bool = numberFormat.hasNationalPrefixFormattingRuleFunc()
    stringBuilder.append("hasNationalPrefixFormattingRule ==> ${hasNationalPrefixFormattingRule}")
    if (hasNationalPrefixFormattingRule) {
        var nationalPrefixFormattingRule_: String = numberFormat.getNationalPrefixFormattingRule()
        stringBuilder.append("nationalPrefixFormattingRule_ ==> ${nationalPrefixFormattingRule_}")
    }

    var hasDomesticCarrierCodeFormattingRule: Bool = numberFormat.hasDomesticCarrierCodeFormattingRuleFunc()
    stringBuilder.append("hasDomesticCarrierCodeFormattingRule ==> ${hasDomesticCarrierCodeFormattingRule}");
    if (hasDomesticCarrierCodeFormattingRule) {
        var domesticCarrierCodeFormattingRule_: String = numberFormat.getDomesticCarrierCodeFormattingRule()
        stringBuilder.append("domesticCarrierCodeFormattingRule_ ==> ${domesticCarrierCodeFormattingRule_}")
    }

    var nationalPrefixOptionalWhenFormatting_: Bool = numberFormat.getNationalPrefixOptionalWhenFormatting()
    stringBuilder.append("nationalPrefixOptionalWhenFormatting_ ==> ${nationalPrefixOptionalWhenFormatting_}");
    stringBuilder.append(
        "↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑");
}
