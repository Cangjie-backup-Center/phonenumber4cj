// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var reginCode: String = "CN"
    var us = phoneNumberUtil.getExampleNumber(reginCode)
    if (showExamplePhoneNumber(us, "FIXED_LINE") != 1012345678) {
        return 1
    }
    var us_FIXED_LINE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.FIXED_LINE)
    var us_MOBILE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.MOBILE)
    var us_FIXED_LINE_OR_MOBILE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.FIXED_LINE_OR_MOBILE)
    var us_TOLL_FREE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.TOLL_FREE)
    var us_PREMIUM_RATE: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PREMIUM_RATE)
    var us_SHARED_COST: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.SHARED_COST)
    var us_VOIP: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.VOIP)
    var us_PERSONAL_NUMBER: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PERSONAL_NUMBER)
    var us_PAGER: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.PAGER)
    var us_UAN: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.UAN)
    var us_VOICEMAIL: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.VOICEMAIL)
    var us_UNKNOWN: Option<PhoneNumber> = phoneNumberUtil.getExampleNumberForType(reginCode, PhoneNumberType.UNKNOWN)
    if (showExamplePhoneNumber(us_FIXED_LINE, "FIXED_LINE") != 1012345678) {
        return 1
    }
    if (showExamplePhoneNumber(us_MOBILE, "MOBILE") != 13123456789) {
        return 1
    }
    if (showExamplePhoneNumber(us_FIXED_LINE_OR_MOBILE, "FIXED_LINE_OR_MOBILE") != 1012345678) {
        return 1
    }
    if (showExamplePhoneNumber(us_TOLL_FREE, "TOLL_FREE") != 8001234567) {
        return 1
    }
    if (showExamplePhoneNumber(us_PREMIUM_RATE, "PREMIUM_RATE") != 16812345) {
        return 1
    }
    if (showExamplePhoneNumber(us_SHARED_COST, "SHARED_COST") != 4001234567) {
        return 1
    }
    if (showExamplePhoneNumber(us_VOIP, "VOIP") != -1) {
        return 1
    }
    if (showExamplePhoneNumber(us_PERSONAL_NUMBER, "PERSONAL_NUMBER") != -1 ) {
        return 1
    }
    if (showExamplePhoneNumber(us_PAGER, "PAGER") != -1) {
        return 1
    }
    if (showExamplePhoneNumber(us_UAN, "UAN") != -1 ) {
        return 1
    }
    if (showExamplePhoneNumber(us_VOICEMAIL, "VOICEMAIL") != -1 ){
        return 1
    }
    if (showExamplePhoneNumber(us_UNKNOWN, "UNKNOWN") != -1 ) {
        return 1
    }
    return 0
}

func showExamplePhoneNumber(phoneNumber: Option<PhoneNumber>, types: String): Int64 {
    match(phoneNumber) {
        case Some(x) =>
            println("showExamplePhoneNumber ${types} ==> ${x.getNationalNumbers()}")
            return x.getNationalNumbers()
        case None =>
            println("showExamplePhoneNumber ==> None")
            return -1
    }
}
