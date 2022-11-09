// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from phonenumber import libphonenumber.*
from phonenumber import libphonenumber.data.*

main() {
    var phoneMetadataCollection = PhonemetadataPhoneMetadataCollection()
    phoneMetadataCollection.readExternal(PHONE_NUMBER_METADATA_MAP.get("CN").getOrThrow())
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
            stringBuilder.append("leadingDigits_ ==> ${leadingDigits_}")
        }

        var leadingZeroPossible_: Bool = phoneMetadata.isLeadingZeroPossible()
        stringBuilder.append("leadingZeroPossible_ ==> ${leadingZeroPossible_}")

        var mobileNumberPortableRegion_: Bool = phoneMetadata.getMobileNumberPortableRegion()
        stringBuilder.append("mobileNumberPortableRegion_ ==> ${mobileNumberPortableRegion_}")
    }
    var expData: String = 
        "PhoneMetadatas size ==> 1hasGeneralDesc ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1[127]\\d{8,9}|2\\d{9}(?:\\d{2})?|[12]\\d{6,7}|86\\d{6}|(?:1[03-689]\\d|6)\\d{7,9}|(?:[3-579]\\d|8[0-57-9])\\d{6,9}possibleLength_.size ==> 6possibleLength_ ==> 7possibleLength_ ==> 8possibleLength_ ==> 9possibleLength_ ==> 10possibleLength_ ==> 11possibleLength_ ==> 12possibleLengthLocalOnly_.size ==> 2possibleLengthLocalOnly_ ==> 5possibleLengthLocalOnly_ ==> 6hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasFixedLine ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> (?:10(?:[02-79]\\d\\d|[18](?:0[1-9]|[1-9]\\d))|21(?:[18](?:0[1-9]|[1-9]\\d)|[2-79]\\d\\d))\\d{5}|(?:43[35]|754)\\d{7,8}|8(?:078\\d{7}|51\\d{7,8})|(?:10|(?:2|85)1|43[35]|754)(?:100\\d\\d|95\\d{3,4})|(?:2[02-57-9]|3(?:11|7[179])|4(?:[15]1|3[12])|5(?:1\\d|2[37]|3[12]|51|7[13-79]|9[15])|7(?:[39]1|5[57]|6[09])|8(?:71|98))(?:[02-8]\\d{7}|1(?:0(?:0\\d\\d(?:\\d{3})?|[1-9]\\d{5})|[1-9]\\d{6})|9(?:[0-46-9]\\d{6}|5\\d{3}(?:\\d(?:\\d{2})?)?))|(?:3(?:1[02-9]|35|49|5\\d|7[02-68]|9[1-68])|4(?:1[02-9]|2[179]|3[46-9]|5[2-9]|6[47-9]|7\\d|8[23])|5(?:3[03-9]|4[36]|5[02-9]|6[1-46]|7[028]|80|9[2-46-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[17]\\d|2[248]|3[04-9]|4[3-6]|5[0-3689]|6[2368]|9[02-9])|8(?:1[236-8]|2[5-7]|3\\d|5[2-9]|7[02-9]|8[36-8]|9[1-7])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:[02-8]\\d{6}|1(?:0(?:0\\d\\d(?:\\d{2})?|[1-9]\\d{4})|[1-9]\\d{5})|9(?:[0-46-9]\\d{5}|5\\d{3,5}))possibleLength_.size ==> 5possibleLength_ ==> 7possibleLength_ ==> 8possibleLength_ ==> 9possibleLength_ ==> 10possibleLength_ ==> 11possibleLengthLocalOnly_.size ==> 2possibleLengthLocalOnly_ ==> 5possibleLengthLocalOnly_ ==> 6hasExampleNumber ==> trueexampleNumber_ ==> 1012345678↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasMobile ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 1740[0-5]\\d{6}|1(?:[38]\\d|4[57]|5[0-35-9]|6[25-7]|7[0-35-8]|9[0135-9])\\d{8}possibleLength_.size ==> 1possibleLength_ ==> 11possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 13123456789↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasTollFree ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> (?:(?:10|21)8|8)00\\d{7}possibleLength_.size ==> 2possibleLength_ ==> 10possibleLength_ ==> 12possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 8001234567↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasPremiumRate ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 16[08]\\d{5}possibleLength_.size ==> 1possibleLength_ ==> 8possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> trueexampleNumber_ ==> 16812345↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasSharedCost ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> 400\\d{7}|950\\d{7,8}|(?:10|2[0-57-9]|3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))96\\d{3,4}possibleLength_.size ==> 5possibleLength_ ==> 7possibleLength_ ==> 8possibleLength_ ==> 9possibleLength_ ==> 10possibleLength_ ==> 11possibleLengthLocalOnly_.size ==> 2possibleLengthLocalOnly_ ==> 5possibleLengthLocalOnly_ ==> 6hasExampleNumber ==> trueexampleNumber_ ==> 4001234567↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasPersonalNumber ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasVoip ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasPager ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasUan ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasEmergency ==> falsehasVoicemail ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> falsepossibleLength_.size ==> 1possibleLength_ ==> -1possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑hasShortCode ==> falsehasStandardRate ==> falsehasCarrierSpecific ==> falsehasSmsServices ==> falsehasNoInternationalDialling ==> true↓↓↓↓↓↓↓↓↓↓↓↓↓getPhoneNumberDesc↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓hasNationalNumberPattern ==> truenationalNumberPattern_ ==> (?:(?:10|21)8|[48])00\\d{7}|950\\d{7,8}possibleLength_.size ==> 3possibleLength_ ==> 10possibleLength_ ==> 11possibleLength_ ==> 12possibleLengthLocalOnly_.size ==> 0hasExampleNumber ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑id_ ==> CNcountryCode_ ==> 86internationalPrefix_ ==> 00|1(?:[12]\\d|79)\\d\\d00hasPreferredInternationalPrefix ==> truepreferredInternationalPrefix_ ==> 00hasNationalPrefix ==> truenationalPrefix_ ==> 0hasPreferredExtnPrefix ==> falsehasNationalPrefixForParsing ==> truenationalPrefixForParsing_ ==> 0|(1(?:[12]\\d|79)\\d\\d)hasNationalPrefixTransformRule ==> falsesameMobileAndFixedLinePattern_ ==> falsenumberFormat_.size() ==> 14↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  1  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{5,6})format_ ==> $1leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 96hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  2  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{5,6})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 3leadingDigitsPattern_ ==> (?:10|2[0-57-9])[19]leadingDigitsPattern_ ==> (?:10|2[0-57-9])(?:10|9[56])leadingDigitsPattern_ ==> (?:10|2[0-57-9])(?:100|9[56])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  3  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{4})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 3leadingDigitsPattern_ ==> [1-9]leadingDigitsPattern_ ==> 1[1-9]|26|[3-9]|(?:10|2[0-57-9])(?:[0-8]|9[0-47-9])leadingDigitsPattern_ ==> 1[1-9]|26|[3-9]|(?:10|2[0-57-9])(?:[02-8]|1(?:0[1-9]|[1-9])|9[0-47-9])hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  4  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{4})(\\d{4})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 16[08]hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  5  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{5,6})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 4leadingDigitsPattern_ ==> 3(?:[157]|35|49|9[1-68])|4(?:[17]|2[179]|6[47-9]|8[23])|5(?:[1357]|2[37]|4[36]|6[1-46]|80)|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]|4[13]|5[1-5])|(?:4[35]|59|85)[1-9]leadingDigitsPattern_ ==> (?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[1-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))[19]leadingDigitsPattern_ ==> 85[23](?:10|95)|(?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:10|9[56])leadingDigitsPattern_ ==> 85[23](?:100|95)|(?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:100|9[56])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  6  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{4})(\\d{4})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 4leadingDigitsPattern_ ==> [1-9]leadingDigitsPattern_ ==> 1[1-9]|26|[3-9]|(?:10|2[0-57-9])(?:[0-8]|9[0-47-9])leadingDigitsPattern_ ==> 26|3(?:[0268]|9[079])|4(?:[049]|2[02-68]|[35]0|6[0-356]|8[014-9])|5(?:0|2[0-24-689]|4[0-2457-9]|6[057-9]|90)|6(?:[0-24578]|6[14-79]|9[03-9])|7(?:0[02-9]|2[0135-79]|3[23]|4[0-27-9]|6[1457]|8)|8(?:[046]|1[01459]|2[0-489]|50|8[0-2459]|9[09])|9(?:0[0457]|1[08]|[268]|4[024-9])|(?:34|85[23])[0-8]|(?:1|58)[1-9]|(?:63|95)[06-9]|(?:33|85[23]9)[0-46-9]|(?:10|2[0-57-9]|3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:[0-8]|9[0-47-9])leadingDigitsPattern_ ==> 26|3(?:[0268]|3[0-46-9]|4[0-8]|9[079])|4(?:[049]|2[02-68]|[35]0|6[0-356]|8[014-9])|5(?:0|2[0-24-689]|4[0-2457-9]|6[057-9]|90)|6(?:[0-24578]|3[06-9]|6[14-79]|9[03-9])|7(?:0[02-9]|2[0135-79]|3[23]|4[0-27-9]|6[1457]|8)|8(?:[046]|1[01459]|2[0-489]|5(?:0|[23](?:[02-8]|1[1-9]|9[0-46-9]))|8[0-2459]|9[09])|9(?:0[0457]|1[08]|[268]|4[024-9]|5[06-9])|(?:1|58|85[23]10)[1-9]|(?:10|2[0-57-9])(?:[0-8]|9[0-47-9])|(?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:[02-8]|1(?:0[1-9]|[1-9])|9[0-47-9])hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  7  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> (?:4|80)0hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  8  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 3leadingDigitsPattern_ ==> 10|2(?:[02-57-9]|1[1-9])leadingDigitsPattern_ ==> 10|2(?:[02-57-9]|1[1-9])leadingDigitsPattern_ ==> 10[0-79]|2(?:[02-57-9]|1[1-79])|(?:10|21)8(?:0[1-9]|[1-9])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  9  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 3(?:[3-59]|7[02-68])|4(?:[26-8]|3[3-9]|5[2-9])|5(?:3[03-9]|[468]|7[028]|9[2-46-9])|6|7(?:[0-247]|3[04-9]|5[0-4689]|6[2368])|8(?:[1-358]|9[1-7])|9(?:[013479]|5[1-5])|(?:[34]1|55|79|87)[02-9]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  10  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{7,8})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 9hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  11  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{4})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 80hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  12  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> [3-578]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  13  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 1[3-9]hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  14  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3 $4leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> [12]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑intlNumberFormat_.size() ==> 10↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  1  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{5,6})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 3leadingDigitsPattern_ ==> (?:10|2[0-57-9])[19]leadingDigitsPattern_ ==> (?:10|2[0-57-9])(?:10|9[56])leadingDigitsPattern_ ==> (?:10|2[0-57-9])(?:100|9[56])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  2  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{5,6})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 4leadingDigitsPattern_ ==> 3(?:[157]|35|49|9[1-68])|4(?:[17]|2[179]|6[47-9]|8[23])|5(?:[1357]|2[37]|4[36]|6[1-46]|80)|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]|4[13]|5[1-5])|(?:4[35]|59|85)[1-9]leadingDigitsPattern_ ==> (?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[1-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))[19]leadingDigitsPattern_ ==> 85[23](?:10|95)|(?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:10|9[56])leadingDigitsPattern_ ==> 85[23](?:100|95)|(?:3(?:[157]\\d|35|49|9[1-68])|4(?:[17]\\d|2[179]|[35][1-9]|6[47-9]|8[23])|5(?:[1357]\\d|2[37]|4[36]|6[1-46]|80|9[1-9])|6(?:3[1-5]|6[0238]|9[12])|7(?:01|[1579]\\d|2[248]|3[014-9]|4[3-6]|6[023689])|8(?:1[236-8]|2[5-7]|[37]\\d|5[14-9]|8[36-8]|9[1-8])|9(?:0[1-3689]|1[1-79]|[379]\\d|4[13]|5[1-5]))(?:100|9[56])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  3  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> (?:4|80)0hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  4  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 3leadingDigitsPattern_ ==> 10|2(?:[02-57-9]|1[1-9])leadingDigitsPattern_ ==> 10|2(?:[02-57-9]|1[1-9])leadingDigitsPattern_ ==> 10[0-79]|2(?:[02-57-9]|1[1-79])|(?:10|21)8(?:0[1-9]|[1-9])hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  5  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 3(?:[3-59]|7[02-68])|4(?:[26-8]|3[3-9]|5[2-9])|5(?:3[03-9]|[468]|7[028]|9[2-46-9])|6|7(?:[0-247]|3[04-9]|5[0-4689]|6[2368])|8(?:[1-358]|9[1-7])|9(?:[013479]|5[1-5])|(?:[34]1|55|79|87)[02-9]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  6  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{7,8})format_ ==> $1 $2leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 9hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  7  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{4})(\\d{3})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 80hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  8  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> [3-578]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  9  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{3})(\\d{4})(\\d{4})format_ ==> $1 $2 $3leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> 1[3-9]hasNationalPrefixFormattingRule ==> falsehasDomesticCarrierCodeFormattingRule ==> truedomesticCarrierCodeFormattingRule_ ==> $CC $1nationalPrefixOptionalWhenFormatting_ ==> false↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓↓↓↓↓↓↓↓↓↓↓↓↓getNumberFormat↓↓↓↓↓↓↓↓  10  ↓↓↓↓↓↓↓↓↓↓↓pattern ==> (\\d{2})(\\d{3})(\\d{3})(\\d{4})format_ ==> $1 $2 $3 $4leadingDigitsPattern_.size() ==> 1leadingDigitsPattern_ ==> [12]hasNationalPrefixFormattingRule ==> truenationalPrefixFormattingRule_ ==> 0$1hasDomesticCarrierCodeFormattingRule ==> falsenationalPrefixOptionalWhenFormatting_ ==> true↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑mainCountryForCode_ ==> falsehasLeadingDigits ==> falseleadingZeroPossible_ ==> falsemobileNumberPortableRegion_ ==> false"
    if (stringBuilder.toString() != expData) {
        return 1
    }
    0
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
    stringBuilder.append("nationalPrefixOptionalWhenFormatting_ ==> ${nationalPrefixOptionalWhenFormatting_}")
    stringBuilder.append(
        "↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑")
}
