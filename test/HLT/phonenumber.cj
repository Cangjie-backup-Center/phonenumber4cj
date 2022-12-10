//3rd_party_lib:phonenumber/build/phonenumber
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

@Test
public class phoneNumber_PhoneNumberUtil {
    @TestCase
    func phoneNumber_PhoneNumberUtil_01(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),19991822826)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @Skip
    @TestCase
    func phoneNumber_PhoneNumberUtil_02(): Unit { //有问题0086_18717619089
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("0086_18717619089", "CN")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),19991822826)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_03(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+86-18717619089", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),18717619089)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_04(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("9524198", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),9524198)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_05(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("02595566", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),2595566)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_06(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("0086-25-95566", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),2595566)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_07(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+86-25-95566 ", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),2595566)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_08(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("011-86-25-95566", "CN")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),11862595566)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_09(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+14255550100", "US")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),1)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),4255550100)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_10(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("00-1-213-282-3146", "US")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),1)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),12132823146)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),true)
        @Assert(Phonenumber.isItalianLeadingZeros(),true)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),true)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),2)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_11(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "US")
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),1)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),2132823146)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @Skip
    @TestCase
    func phoneNumber_PhoneNumberUtil_12(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow() //此数据java报错仓颉可以读出来  
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("仓颉+86_25_95566 *%12qwe", "US")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),19991822826)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_13(): Unit {
        try {
            var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
            var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+86_25_9556618717619089", "US")
            @Assert(Phonenumber.hasCountryCodes(),true)
            @Assert(Phonenumber.getCountryCodes(),86)
            @Assert(Phonenumber.hasNationalNumbers(),true)
            @Assert(Phonenumber.getNationalNumbers(),19991822826)
            @Assert(Phonenumber.hasExtensions(),false)
            @Assert(Phonenumber.getExtensions(),"")
            @Assert(Phonenumber.hasItalianLeadingZeros(),false)
            @Assert(Phonenumber.isItalianLeadingZeros(),false)
            @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
            @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
            @Assert(Phonenumber.hasRawInputs(),false)
            @Assert(Phonenumber.getRawInputs(),"")
            @Assert(Phonenumber.hasCountryCodeSources(),false)
            @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
            @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
            @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
        } catch (e: Exception) {
            @Assert(e.toString(),"Error type: TOO_LONG. The string supplied is too long to be a phone number.")
        }
    }

    @Skip
    @TestCase
    func phoneNumber_PhoneNumberUtil_14(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow() //仓颉报错说是转化失败，java说不是电话号码
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("+86_25_95566cangjie18717619089", "US")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),19991822826)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_15(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("11111111111", "CN")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),11111111111)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_16(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("[18717619089]", "CN")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),18717619089)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_17(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("1871761908", "CN")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber.hasCountryCodes(),true)
        @Assert(Phonenumber.getCountryCodes(),86)
        @Assert(Phonenumber.hasNationalNumbers(),true)
        @Assert(Phonenumber.getNationalNumbers(),1871761908)
        @Assert(Phonenumber.hasExtensions(),false)
        @Assert(Phonenumber.getExtensions(),"")
        @Assert(Phonenumber.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber.isItalianLeadingZeros(),false)
        @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber.hasRawInputs(),false)
        @Assert(Phonenumber.getRawInputs(),"")
        @Assert(Phonenumber.hasCountryCodeSources(),false)
        @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_71(): Unit {
        try {
            var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
            var Phonenumber: PhoneNumber = phoneNumberUtil.parse("", "CN")
            @Assert(Phonenumber.hasCountryCodes(),true)
            @Assert(Phonenumber.getCountryCodes(),86)
            @Assert(Phonenumber.hasNationalNumbers(),true)
            @Assert(Phonenumber.getNationalNumbers(),19991822826)
            @Assert(Phonenumber.hasExtensions(),false)
            @Assert(Phonenumber.getExtensions(),"")
            @Assert(Phonenumber.hasItalianLeadingZeros(),false)
            @Assert(Phonenumber.isItalianLeadingZeros(),false)
            @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
            @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
            @Assert(Phonenumber.hasRawInputs(),false)
            @Assert(Phonenumber.getRawInputs(),"")
            @Assert(Phonenumber.hasCountryCodeSources(),false)
            @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
            @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
            @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
        } catch (e: Exception) {
            @Assert(e.toString(),"Error type: NOT_A_NUMBER. The phone number supplied was null.")
        }
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_72(): Unit {
        try {
            var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
            var Phonenumber: PhoneNumber = phoneNumberUtil.parse("18717619089", "")
            @Assert(Phonenumber.hasCountryCodes(),true)
            @Assert(Phonenumber.getCountryCodes(),86)
            @Assert(Phonenumber.hasNationalNumbers(),true)
            @Assert(Phonenumber.getNationalNumbers(),19991822826)
            @Assert(Phonenumber.hasExtensions(),false)
            @Assert(Phonenumber.getExtensions(),"")
            @Assert(Phonenumber.hasItalianLeadingZeros(),false)
            @Assert(Phonenumber.isItalianLeadingZeros(),false)
            @Assert(Phonenumber.hasNumbersOfLeadingZeros(),false)
            @Assert(Phonenumber.getNumbersOfLeadingZeros(),1)
            @Assert(Phonenumber.hasRawInputs(),false)
            @Assert(Phonenumber.getRawInputs(),"")
            @Assert(Phonenumber.hasCountryCodeSources(),false)
            @Assert(Phonenumber.getCountryCodeSources().toString(),"UNSPECIFIED")
            @Assert(Phonenumber.hasPreferredDomesticCarrierCodes(),false)
            @Assert(Phonenumber.getPreferredDomesticCarrierCodes(),"")
        } catch (e: Exception) {
            @Assert(e.toString(),"Error type: INVALID_COUNTRY_CODE. Missing or invalid default region.")
        }
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_18(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setCountryCodes(10)
        println(Phonenumber1.hasCountryCodes())
        println(Phonenumber1.getCountryCodes())
        @Assert(Phonenumber1.hasCountryCodes(),true)
        @Assert(Phonenumber1.getCountryCodes(),10)
        var Phonenumber2 = Phonenumber1.clearCountryCodes()
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),false)
        @Assert(Phonenumber2.getCountryCodes(),0)
    }

    @Skip
    @TestCase
    func phoneNumber_PhoneNumberUtil_19(): Unit { //hasCountryCodes      java这边是int对应仓颉int32
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setCountryCodes(-9223372036854775808)
        println(Phonenumber1.hasCountryCodes())
        println(Phonenumber1.getCountryCodes())
        @Assert(Phonenumber1.hasCountryCodes(),true)
        @Assert(Phonenumber1.getCountryCodes(),10)
        var Phonenumber2 = Phonenumber1.clearCountryCodes()
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),false)
        @Assert(Phonenumber2.getCountryCodes(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_20(): Unit { //hasCountryCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setCountryCodes(2147483647)
        println(Phonenumber1.hasCountryCodes())
        println(Phonenumber1.getCountryCodes())
        @Assert(Phonenumber1.hasCountryCodes(),true)
        @Assert(Phonenumber1.getCountryCodes(),2147483647)
        var Phonenumber2 = Phonenumber1.clearCountryCodes()
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),false)
        @Assert(Phonenumber2.getCountryCodes(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_21(): Unit { //hasCountryCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setCountryCodes(0)
        println(Phonenumber1.hasCountryCodes())
        println(Phonenumber1.getCountryCodes())
        @Assert(Phonenumber1.hasCountryCodes(),true)
        @Assert(Phonenumber1.getCountryCodes(),0)
        var Phonenumber2 = Phonenumber1.clearCountryCodes()
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),false)
        @Assert(Phonenumber2.getCountryCodes(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_22(): Unit { //hasNationalNumbers
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setNationalNumbers(10)
        println(Phonenumber1.hasNationalNumbers())
        println(Phonenumber1.getNationalNumbers())
        @Assert(Phonenumber1.hasNationalNumbers(),true)
        @Assert(Phonenumber1.getNationalNumbers(),10)
        var Phonenumber2 = Phonenumber1.clearNationalNumbers()
        println(Phonenumber2.hasNationalNumbers())
        println(Phonenumber2.getNationalNumbers())
        @Assert(Phonenumber2.hasNationalNumbers(),false)
        @Assert(Phonenumber2.getNationalNumbers(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_23(): Unit { //hasNationalNumbers      
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        var Phonenumber1 = Phonenumber.setNationalNumbers(92233)
        println(Phonenumber1.hasNationalNumbers())
        println(Phonenumber1.getNationalNumbers())
        @Assert(Phonenumber1.hasNationalNumbers(),true)
        @Assert(Phonenumber1.getNationalNumbers(),92233)
        var Phonenumber2 = Phonenumber1.clearNationalNumbers()
        println(Phonenumber2.hasNationalNumbers())
        println(Phonenumber2.getNationalNumbers())
        @Assert(Phonenumber2.hasNationalNumbers(),false)
        @Assert(Phonenumber2.getNationalNumbers(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_24(): Unit { //hasNationalNumbers
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        var Phonenumber1 = Phonenumber.setNationalNumbers(0)
        println(Phonenumber1.hasNationalNumbers())
        println(Phonenumber1.getNationalNumbers())
        @Assert(Phonenumber1.hasNationalNumbers(),true)
        @Assert(Phonenumber1.getNationalNumbers(),0)
        var Phonenumber2 = Phonenumber1.clearNationalNumbers()
        println(Phonenumber2.hasNationalNumbers())
        println(Phonenumber2.getNationalNumbers())
        @Assert(Phonenumber2.hasNationalNumbers(),false)
        @Assert(Phonenumber2.getNationalNumbers(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_25(): Unit { //hasNationalNumbers
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNationalNumbers())
        println(Phonenumber.getNationalNumbers())
        var Phonenumber1 = Phonenumber.setNationalNumbers(-2147483647)
        println(Phonenumber1.hasNationalNumbers())
        println(Phonenumber1.getNationalNumbers())
        @Assert(Phonenumber1.hasNationalNumbers(),true)
        @Assert(Phonenumber1.getNationalNumbers(),-2147483647)
        var Phonenumber2 = Phonenumber1.clearNationalNumbers()
        println(Phonenumber2.hasNationalNumbers())
        println(Phonenumber2.getNationalNumbers())
        @Assert(Phonenumber2.hasNationalNumbers(),false)
        @Assert(Phonenumber2.getNationalNumbers(),0)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_26(): Unit { //hasExtensions
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        var Phonenumber1 = Phonenumber.setExtensions("qaz")
        println(Phonenumber1.hasExtensions())
        println(Phonenumber1.getExtensions())
        @Assert(Phonenumber1.hasExtensions(),true)
        @Assert(Phonenumber1.getExtensions(),"qaz")
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasExtensions())
        println(Phonenumber2.getExtensions())
        @Assert(Phonenumber2.hasExtensions(),false)
        @Assert(Phonenumber2.getExtensions(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_27(): Unit { //hasExtensions   
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(phonenumber.hasExtensions())
        println(phonenumber.getExtensions())
        var Phonenumber1 = phonenumber.setExtensions("")
        println(Phonenumber1.hasExtensions())
        println(Phonenumber1.getExtensions())
        @Assert(Phonenumber1.hasExtensions(),true)
        @Assert(Phonenumber1.getExtensions(),"")
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasExtensions())
        println(Phonenumber2.getExtensions())
        @Assert(Phonenumber2.hasExtensions(),false)
        @Assert(Phonenumber2.getExtensions(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_28(): Unit { //hasExtensions
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        var Phonenumber1 = Phonenumber.setExtensions("仓颉")
        println(Phonenumber1.hasExtensions())
        println(Phonenumber1.getExtensions())
        @Assert(Phonenumber1.hasExtensions(),true)
        @Assert(Phonenumber1.getExtensions(),"仓颉")
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasExtensions())
        println(Phonenumber2.getExtensions())
        @Assert(Phonenumber2.hasExtensions(),false)
        @Assert(Phonenumber2.getExtensions(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_29(): Unit { //hasExtensions
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        var Phonenumber1 = Phonenumber.setExtensions("仓颉#%^")
        println(Phonenumber1.hasExtensions())
        println(Phonenumber1.getExtensions())
        @Assert(Phonenumber1.hasExtensions(),true)
        @Assert(Phonenumber1.getExtensions(),"仓颉#%^")
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasExtensions())
        println(Phonenumber2.getExtensions())
        @Assert(Phonenumber2.hasExtensions(),false)
        @Assert(Phonenumber2.getExtensions(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_30(): Unit { //hasExtensions
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasExtensions())
        println(Phonenumber.getExtensions())
        var Phonenumber1 = Phonenumber.setExtensions("[1871761]")
        println(Phonenumber1.hasExtensions())
        println(Phonenumber1.getExtensions())
        @Assert(Phonenumber1.hasExtensions(),true)
        @Assert(Phonenumber1.getExtensions(),"[1871761]")
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasExtensions())
        println(Phonenumber2.getExtensions())
        @Assert(Phonenumber2.hasExtensions(),false)
        @Assert(Phonenumber2.getExtensions(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_31(): Unit { //hasItalianLeadingZeros
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        var Phonenumber1 = Phonenumber.setItalianLeadingZeros(true)
        println(Phonenumber1.hasItalianLeadingZeros())
        println(Phonenumber1.isItalianLeadingZeros())
        @Assert(Phonenumber1.hasItalianLeadingZeros(),true)
        @Assert(Phonenumber1.isItalianLeadingZeros(),true)
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasItalianLeadingZeros())
        println(Phonenumber2.isItalianLeadingZeros())
        @Assert(Phonenumber2.hasItalianLeadingZeros(),true)
        @Assert(Phonenumber2.isItalianLeadingZeros(),true)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_32(): Unit { //hasItalianLeadingZeros
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasItalianLeadingZeros())
        println(Phonenumber.isItalianLeadingZeros())
        var Phonenumber1 = Phonenumber.setItalianLeadingZeros(false)
        println(Phonenumber1.hasItalianLeadingZeros())
        println(Phonenumber1.isItalianLeadingZeros())
        @Assert(Phonenumber1.hasItalianLeadingZeros(),true)
        @Assert(Phonenumber1.isItalianLeadingZeros(),false)
        var Phonenumber2 = Phonenumber1.clearExtensions()
        println(Phonenumber2.hasItalianLeadingZeros())
        println(Phonenumber2.isItalianLeadingZeros())
        @Assert(Phonenumber2.hasItalianLeadingZeros(),true)
        @Assert(Phonenumber2.isItalianLeadingZeros(),false)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_34(): Unit { //hasNumbersOfLeadingZeros
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        var Phonenumber1 = Phonenumber.setNumberOfLeadingZeros(20)
        println(Phonenumber1.hasNumbersOfLeadingZeros())
        println(Phonenumber1.getNumbersOfLeadingZeros())
        @Assert(Phonenumber1.hasNumbersOfLeadingZeros(),true)
        @Assert(Phonenumber1.getNumbersOfLeadingZeros(),20)
        var Phonenumber2 = Phonenumber1.clearNumberOfLeadingZeros()
        println(Phonenumber2.hasNumbersOfLeadingZeros())
        println(Phonenumber2.getNumbersOfLeadingZeros())
        @Assert(Phonenumber2.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber2.getNumbersOfLeadingZeros(),1)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_35(): Unit { //hasNumbersOfLeadingZeros       
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        var Phonenumber1 = Phonenumber.setNumberOfLeadingZeros(922)
        println(Phonenumber1.hasNumbersOfLeadingZeros())
        println(Phonenumber1.getNumbersOfLeadingZeros())
        @Assert(Phonenumber1.hasNumbersOfLeadingZeros(),true)
        @Assert(Phonenumber1.getNumbersOfLeadingZeros(),922)
        var Phonenumber2 = Phonenumber1.clearNumberOfLeadingZeros()
        println(Phonenumber2.hasNumbersOfLeadingZeros())
        println(Phonenumber2.getNumbersOfLeadingZeros())
        @Assert(Phonenumber2.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber2.getNumbersOfLeadingZeros(),1)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_36(): Unit { //hasNumbersOfLeadingZeros
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        var Phonenumber1 = Phonenumber.setNumberOfLeadingZeros(2147483647)
        println(Phonenumber1.hasNumbersOfLeadingZeros())
        println(Phonenumber1.getNumbersOfLeadingZeros())
        @Assert(Phonenumber1.hasNumbersOfLeadingZeros(),true)
        @Assert(Phonenumber1.getNumbersOfLeadingZeros(),2147483647)
        var Phonenumber2 = Phonenumber1.clearNumberOfLeadingZeros()
        println(Phonenumber2.hasNumbersOfLeadingZeros())
        println(Phonenumber2.getNumbersOfLeadingZeros())
        @Assert(Phonenumber2.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber2.getNumbersOfLeadingZeros(),1)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_37(): Unit { //hasNumbersOfLeadingZeros
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasNumbersOfLeadingZeros())
        println(Phonenumber.getNumbersOfLeadingZeros())
        var Phonenumber1 = Phonenumber.setNumberOfLeadingZeros(0)
        println(Phonenumber1.hasNumbersOfLeadingZeros())
        println(Phonenumber1.getNumbersOfLeadingZeros())
        @Assert(Phonenumber1.hasNumbersOfLeadingZeros(),true)
        @Assert(Phonenumber1.getNumbersOfLeadingZeros(),0)
        var Phonenumber2 = Phonenumber1.clearNumberOfLeadingZeros()
        println(Phonenumber2.hasNumbersOfLeadingZeros())
        println(Phonenumber2.getNumbersOfLeadingZeros())
        @Assert(Phonenumber2.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber2.getNumbersOfLeadingZeros(),1)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_38(): Unit { //hasRawInputs
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        var Phonenumber1 = Phonenumber.setRawInputs("qwe")
        println(Phonenumber1.hasRawInputs())
        println(Phonenumber1.getRawInputs())
        @Assert(Phonenumber1.hasRawInputs(),true)
        @Assert(Phonenumber1.getRawInputs(),"qwe")
        var Phonenumber2 = Phonenumber1.clearRawInputs()
        println(Phonenumber2.hasRawInputs())
        println(Phonenumber2.getRawInputs())
        @Assert(Phonenumber2.hasRawInputs(),false)
        @Assert(Phonenumber2.getRawInputs(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_39(): Unit { //hasRawInputs    
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        var Phonenumber1 = Phonenumber.setRawInputs("")
        println(Phonenumber1.hasRawInputs())
        println(Phonenumber1.getRawInputs())
        @Assert(Phonenumber1.hasRawInputs(),true)
        @Assert(Phonenumber1.getRawInputs(),"")
        var Phonenumber2 = Phonenumber1.clearRawInputs()
        println(Phonenumber2.hasRawInputs())
        println(Phonenumber2.getRawInputs())
        @Assert(Phonenumber2.hasRawInputs(),false)
        @Assert(Phonenumber2.getRawInputs(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_40(): Unit { //hasRawInputs
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        var Phonenumber1 = Phonenumber.setRawInputs("仓颉")
        println(Phonenumber1.hasRawInputs())
        println(Phonenumber1.getRawInputs())
        @Assert(Phonenumber1.hasRawInputs(),true)
        @Assert(Phonenumber1.getRawInputs(),"仓颉")
        var Phonenumber2 = Phonenumber1.clearRawInputs()
        println(Phonenumber2.hasRawInputs())
        println(Phonenumber2.getRawInputs())
        @Assert(Phonenumber2.hasRawInputs(),false)
        @Assert(Phonenumber2.getRawInputs(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_41(): Unit { //hasRawInputs
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        var Phonenumber1 = Phonenumber.setRawInputs("仓颉#&#")
        println(Phonenumber1.hasRawInputs())
        println(Phonenumber1.getRawInputs())
        @Assert(Phonenumber1.hasRawInputs(),true)
        @Assert(Phonenumber1.getRawInputs(),"仓颉#&#")
        var Phonenumber2 = Phonenumber1.clearRawInputs()
        println(Phonenumber2.hasRawInputs())
        println(Phonenumber2.getRawInputs())
        @Assert(Phonenumber2.hasRawInputs(),false)
        @Assert(Phonenumber2.getRawInputs(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_42(): Unit { //hasRawInputs
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasRawInputs())
        println(Phonenumber.getRawInputs())
        var Phonenumber1 = Phonenumber.setRawInputs("[1874243etr]")
        println(Phonenumber1.hasRawInputs())
        println(Phonenumber1.getRawInputs())
        @Assert(Phonenumber1.hasRawInputs(),true)
        @Assert(Phonenumber1.getRawInputs(),"[1874243etr]")
        var Phonenumber2 = Phonenumber1.clearRawInputs()
        println(Phonenumber2.hasRawInputs())
        println(Phonenumber2.getRawInputs())
        @Assert(Phonenumber2.hasRawInputs(),false)
        @Assert(Phonenumber2.getRawInputs(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_43(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.FROM_DEFAULT_COUNTRY)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"FROM_DEFAULT_COUNTRY")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_44(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.FROM_DEFAULT_COUNTRY)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"FROM_DEFAULT_COUNTRY")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_45(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"FROM_NUMBER_WITH_PLUS_SIGN")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_46(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITH_IDD)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"FROM_NUMBER_WITH_IDD")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_47(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"FROM_NUMBER_WITHOUT_PLUS_SIGN")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_48(): Unit { //hasCountryCodeSources  枚举
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasCountryCodeSources())
        println(Phonenumber.getCountryCodeSources().toString())
        var Phonenumber1 = Phonenumber.setCountryCodeSources(CountryCodeSource.UNSPECIFIED)
        println(Phonenumber1.hasCountryCodeSources())
        println(Phonenumber1.getCountryCodeSources().toString())
        @Assert(Phonenumber1.hasCountryCodeSources(),true)
        @Assert(Phonenumber1.getCountryCodeSources().toString(),"UNSPECIFIED")
        var Phonenumber2 = Phonenumber1.clearCountryCodeSources()
        println(Phonenumber2.hasCountryCodeSources())
        println(Phonenumber2.getCountryCodeSources().toString())
        @Assert(Phonenumber2.hasCountryCodeSources(),false)
        @Assert(Phonenumber2.getCountryCodeSources().toString(),"UNSPECIFIED")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_49(): Unit { //hasPreferredDomesticCarrierCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        var Phonenumber1 = Phonenumber.setPreferredDomesticCarrierCodes("qwe")
        println(Phonenumber1.hasPreferredDomesticCarrierCodes())
        println(Phonenumber1.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber1.hasPreferredDomesticCarrierCodes(),true)
        @Assert(Phonenumber1.getPreferredDomesticCarrierCodes(),"qwe")
        var Phonenumber2 = Phonenumber1.clearPreferredDomesticCarrierCodes()
        println(Phonenumber2.hasPreferredDomesticCarrierCodes())
        println(Phonenumber2.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber2.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber2.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_50(): Unit { //hasPreferredDomesticCarrierCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        var Phonenumber1 = Phonenumber.setPreferredDomesticCarrierCodes("")
        println(Phonenumber1.hasPreferredDomesticCarrierCodes())
        println(Phonenumber1.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber1.hasPreferredDomesticCarrierCodes(),true)
        @Assert(Phonenumber1.getPreferredDomesticCarrierCodes(),"")
        var Phonenumber2 = Phonenumber1.clearPreferredDomesticCarrierCodes()
        println(Phonenumber2.hasPreferredDomesticCarrierCodes())
        println(Phonenumber2.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber2.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber2.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_51(): Unit { //hasPreferredDomesticCarrierCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        var Phonenumber1 = Phonenumber.setPreferredDomesticCarrierCodes("仓颉")
        println(Phonenumber1.hasPreferredDomesticCarrierCodes())
        println(Phonenumber1.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber1.hasPreferredDomesticCarrierCodes(),true)
        @Assert(Phonenumber1.getPreferredDomesticCarrierCodes(),"仓颉")
        var Phonenumber2 = Phonenumber1.clearPreferredDomesticCarrierCodes()
        println(Phonenumber2.hasPreferredDomesticCarrierCodes())
        println(Phonenumber2.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber2.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber2.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_52(): Unit { //hasPreferredDomesticCarrierCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        var Phonenumber1 = Phonenumber.setPreferredDomesticCarrierCodes("1312#$%仓颉")
        println(Phonenumber1.hasPreferredDomesticCarrierCodes())
        println(Phonenumber1.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber1.hasPreferredDomesticCarrierCodes(),true)
        @Assert(Phonenumber1.getPreferredDomesticCarrierCodes(),"1312#$%仓颉")
        var Phonenumber2 = Phonenumber1.clearPreferredDomesticCarrierCodes()
        println(Phonenumber2.hasPreferredDomesticCarrierCodes())
        println(Phonenumber2.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber2.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber2.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_53(): Unit { //hasPreferredDomesticCarrierCodes
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        println(Phonenumber.hasPreferredDomesticCarrierCodes())
        println(Phonenumber.getPreferredDomesticCarrierCodes())
        var Phonenumber1 = Phonenumber.setPreferredDomesticCarrierCodes("[18714556]")
        println(Phonenumber1.hasPreferredDomesticCarrierCodes())
        println(Phonenumber1.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber1.hasPreferredDomesticCarrierCodes(),true)
        @Assert(Phonenumber1.getPreferredDomesticCarrierCodes(),"[18714556]")
        var Phonenumber2 = Phonenumber1.clearPreferredDomesticCarrierCodes()
        println(Phonenumber2.hasPreferredDomesticCarrierCodes())
        println(Phonenumber2.getPreferredDomesticCarrierCodes())
        @Assert(Phonenumber2.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber2.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_54(): Unit { //clear
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1 = Phonenumber.setCountryCodes(10)
        var Phonenumber2 = Phonenumber1.setNationalNumbers(10)
        var Phonenumber3 = Phonenumber2.setExtensions("qaz")
        var Phonenumber4 = Phonenumber3.setItalianLeadingZeros(true)
        var Phonenumber5 = Phonenumber4.setNumberOfLeadingZeros(20)
        var Phonenumber6 = Phonenumber5.setRawInputs("qwe")
        var Phonenumber7 = Phonenumber6.setPreferredDomesticCarrierCodes("qwe")
        var Phonenumber8 = Phonenumber7.clear()
        @Assert(Phonenumber8.hasCountryCodes(),false)
        @Assert(Phonenumber8.getCountryCodes(),0)
        @Assert(Phonenumber8.hasNationalNumbers(),false)
        @Assert(Phonenumber8.getNationalNumbers(),0)
        @Assert(Phonenumber8.hasExtensions(),false)
        @Assert(Phonenumber8.getExtensions(),"")
        @Assert(Phonenumber8.hasItalianLeadingZeros(),false)
        @Assert(Phonenumber8.isItalianLeadingZeros(),false)
        @Assert(Phonenumber8.hasNumbersOfLeadingZeros(),false)
        @Assert(Phonenumber8.getNumbersOfLeadingZeros(),1)
        @Assert(Phonenumber8.hasRawInputs(),false)
        @Assert(Phonenumber8.getRawInputs(),"")
        @Assert(Phonenumber8.hasCountryCodeSources(),false)
        @Assert(Phonenumber8.getCountryCodeSources().toString(),"UNSPECIFIED")
        @Assert(Phonenumber8.hasPreferredDomesticCarrierCodes(),false)
        @Assert(Phonenumber8.getPreferredDomesticCarrierCodes(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_55(): Unit { //mergeFrom
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1: PhoneNumber = phoneNumberUtil.parse("4255550100", "US")
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        var Phonenumber2 = Phonenumber.mergeFrom(Phonenumber1)
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),true)
        @Assert(Phonenumber2.getCountryCodes(),1)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_56(): Unit { //mergeFrom
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var Phonenumber: PhoneNumber = phoneNumberUtil.parse("19991822826", "CN")
        var Phonenumber1: PhoneNumber = PhoneNumber()
        println(Phonenumber.hasCountryCodes())
        println(Phonenumber.getCountryCodes())
        var Phonenumber2 = Phonenumber.mergeFrom(Phonenumber1)
        println(Phonenumber2.hasCountryCodes())
        println(Phonenumber2.getCountryCodes())
        @Assert(Phonenumber2.hasCountryCodes(),true)
        @Assert(Phonenumbe