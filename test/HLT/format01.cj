//3rd_party_lib:phonenumber/build/phonenumber
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

@Test
public class phoneNumber_PhoneNumberUtil {
    @TestCase
    func phoneNumber_PhoneNumberUtil_1(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.NATIONAL),"187 1761 9089")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.INTERNATIONAL),"+86 187 1761 9089")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.E164),"+8618717619089")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.RFC3966),"tel:+86-187-1761-9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_2(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        println(phoneNumberUtil.format(Phonenumber, PhoneNumberFormat.NATIONAL))
        println(phoneNumberUtil.format(Phonenumber, PhoneNumberFormat.INTERNATIONAL))
        println(phoneNumberUtil.format(Phonenumber, PhoneNumberFormat.E164))
        println(phoneNumberUtil.format(Phonenumber, PhoneNumberFormat.RFC3966))
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.NATIONAL),"(213) 282-3146")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.INTERNATIONAL),"+1 213-282-3146")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.E164),"+12132823146")
        @Assert(phoneNumberUtil.format(Phonenumber,PhoneNumberFormat.RFC3966),"tel:+1-213-282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_3(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        phoneNumberUtil.format(Phonenumber, PhoneNumberFormat.NATIONAL, buil)
        @Assert(buil.toString(),"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_4(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var pf: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        pf.setPattern("(\\d{3})(\\d{3})(\\d{5})")
        pf.setFormat("*$1* $2-$3")
        var pf1: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        pf1.setPattern("(\\d{4})(\\d{4})(\\d{3})")
        pf1.setFormat("*$1* $2-$3")
        var pf2: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        pf2.setPattern("(\\d{3})(\\d{4})(\\d{4})")
        pf2.setFormat("*$1* $2-$3")
        var numberFormats: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
        numberFormats.append(pf)
        numberFormats.append(pf1)
        numberFormats.append(pf2)
        var srt = phoneNumberUtil.formatByPattern(Phonenumber, PhoneNumberFormat.NATIONAL, numberFormats)
        var srt1 = phoneNumberUtil.formatByPattern(Phonenumber, PhoneNumberFormat.INTERNATIONAL, numberFormats)
        var srt2 = phoneNumberUtil.formatByPattern(Phonenumber, PhoneNumberFormat.E164, numberFormats)
        @Assert(srt,"2132823146")
        @Assert(srt1,"+1 2132823146")
        @Assert(srt2,"+12132823146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_5(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "38438")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_6(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "123456")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_7(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "仓颉")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_8(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "cangjie")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_9(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "cangjie@*&")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_10(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, " ")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_11(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var buil = StringBuilder()
        var str = phoneNumberUtil.formatNationalNumberWithCarrierCode(Phonenumber, "")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_12(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, "38438")
        println(str)
        @Assert(str,"1111 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_13(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("11111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, "38438")
        println(str)
        @Assert(str,"(213) 282-3146")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_14(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, "741852963")
        println(str)
        @Assert(str,"1111 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_15(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, "仓颉")
        println(str)
        @Assert(str,"1111 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_16(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, "")
        println(str)
        @Assert(str,"1111 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_17(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setPreferredDomesticCarrierCodes("1111")
        var str = phoneNumberUtil.formatNationalNumberWithPreferredCarrierCode(phonenumber1, " ")
        println(str)
        @Assert(str,"1111 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_18(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var str = phoneNumberUtil.formatNumberForMobileDialing(phonenumber, "US", true)
        println(str)
        @Assert(str,"+86 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_19(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var str = phoneNumberUtil.formatNumberForMobileDialing(phonenumber, "US", false)
        println(str)
        @Assert(str,"+8618717619089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_20(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var str = phoneNumberUtil.formatNumberForMobileDialing(phonenumber, "CN", true)
        println(str)
        @Assert(str,"187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_21(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var str = phoneNumberUtil.formatNumberForMobileDialing(phonenumber, "CN", false)
        println(str)
        @Assert(str,"18717619089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_22(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setRawInputs("abc")
        var str = phoneNumberUtil.formatOutOfCountryCallingNumber(phonenumber1, "CN")
        println(str)
        @Assert(str,"187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_23(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setRawInputs("abc")
        var str = phoneNumberUtil.formatOutOfCountryCallingNumber(phonenumber1, "US")
        println(str)
        @Assert(str,"011 86 187 1761 9089")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_24(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setRawInputs("abc")
        var str = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1, "CN")
        println(str)
        @Assert(str,"ABC")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_25(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "CN")
        var phonenumber1 = phonenumber.setRawInputs("abc")
        var str = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1, "US")
        println(str)
        @Assert(str,"011 86 ABC")
    }

    //@Skip
    @TestCase
    func phoneNumber_PhoneNumberUtil_26(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber1: PhoneNumber = PhoneNumber()
        phonenumber1.setNationalNumbers(8007493524i64)
        phonenumber1.setCountryCodes(1)
        phonenumber1.setRawInputs("1800 six-flag")
        var str1 = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1, "CN")
        var str2 = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1, "US")
        println(str1)
        println(str2)
        @Assert(str1,"00 1 800 SIX-FLAG")
        @Assert(str2,"1 800 SIX-FLAG")
    }
}
