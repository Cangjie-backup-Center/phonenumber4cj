// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*

main() {
    var metedata: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata()
    try {
        metedata.setGeneralDesc(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setFixedLine(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setMobile(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setTollFree(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setPremiumRate(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setSharedCost(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setPersonalNumber(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setVoip(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setPager(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setUan(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setEmergency(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setVoicemail(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setShortCode(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setStandardRate(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setCarrierSpecific(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setSmsServices(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setNoInternationalDialling(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    try {
        metedata.setNoInternationalDialling(Option<PhonemetadataPhoneNumberDesc>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    if (metedata.getNumberFormat(0) != Option<PhonemetadataNumberFormat>.None) { return 1 }
    try {
        metedata.addNumberFormat(Option<PhonemetadataNumberFormat>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    metedata.addNumberFormat(Option<PhonemetadataNumberFormat>.Some(PhonemetadataNumberFormat()))
    if (metedata.intlNumberFormats().size != 0) {
        return 1
    }
    if (metedata.intlNumberFormatSize() != 0) {
        return 1
    }
    if (metedata.getIntlNumberFormatCount() != 0) {
        return 1
    }
    if (metedata.getIntlNumberFormat(0) != Option<PhonemetadataNumberFormat>.None) {
        return 1
    }
    try {
        metedata.addIntlNumberFormat(Option<PhonemetadataNumberFormat>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    metedata.addIntlNumberFormat(Option<PhonemetadataNumberFormat>.Some(PhonemetadataNumberFormat()))
    metedata.clearIntlNumberFormat()
    if (metedata.getIntlNumberFormatCount() != 0) {
        return 1
    }
    if (metedata.hasMainCountryForCodeFunc() != false) {
        return 1
    }
    if (metedata.getMainCountryForCode() != false) {
        return 1
    }
    metedata.setMainCountryForCode(true)
    if (metedata.getMainCountryForCode() != true) {
        return 1
    }
    metedata.clearMainCountryForCode()
    if (metedata.getMainCountryForCode() != false) {
        return 1
    }
    metedata.setLeadingDigits("123")
    if (metedata.getLeadingDigits() != "123") {
        return 1
    }
    if (metedata.hasLeadingZeroPossibleFunc() != false) {
        return 1
    }
    metedata.setLeadingZeroPossible(true)
    if (metedata.hasLeadingZeroPossibleFunc() != true) {
        return 1
    }
    metedata.clearLeadingZeroPossible()
    if (metedata.hasLeadingZeroPossibleFunc() != false) {
        return 1
    }
    if (metedata.hasMobileNumberPortableRegionFunc() != false) {
        return 1
    }
    if (metedata.isMobileNumberPortableRegion() != false) {
        return 1
    }
    metedata.setMobileNumberPortableRegion(true)
    if (metedata.hasMobileNumberPortableRegionFunc() != true) {
        return 1
    }
    if (metedata.isMobileNumberPortableRegion() != true) {
        return 1
    }
    metedata.clearMobileNumberPortableRegion()
    if (metedata.isMobileNumberPortableRegion() != false) {
        return 1
    }
    if (!(metedata != PhonemetadataPhoneMetadata())) {
        return 1
    }
    0
}
