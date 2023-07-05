//3rd_party_lib:phonenumber4cj/build/phonenumber4cj
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

@Test
public class phoneNumber_PhoneNumberUtil {
    @TestCase
    func phoneNumber_PhoneNumberUtil_1(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        println(phoneFormat.hasPatternFunc())
        println(phoneFormat.getPattern())
        var phoneFormat1 = phoneFormat.setPattern("cangjie")
        println(phoneFormat1.hasPatternFunc())
        println(phoneFormat1.getPattern())
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern(),"cangjie")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_2(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        var phoneFormat1 = phoneFormat.setPattern("仓颉")
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern(),"仓颉")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_3(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        var phoneFormat1 = phoneFormat.setPattern("$%^$%")
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern(),"$%^$%")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_4(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        var phoneFormat1 = phoneFormat.setPattern("cangjie仓颉$%^$%")
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern(),"cangjie仓颉$%^$%")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_5(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        var phoneFormat1 = phoneFormat.setPattern(" ")
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern()," ")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_6(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        @Assert(phoneFormat.hasPatternFunc(),false)
        @Assert(phoneFormat.getPattern(),"")
        var phoneFormat1 = phoneFormat.setPattern("")
        @Assert(phoneFormat1.hasPatternFunc(),true)
        @Assert(phoneFormat1.getPattern(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_7(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasFormatFunc())
        println(phoneFormat.getFormat())
        @Assert(phoneFormat.hasFormatFunc(),false)
        @Assert(phoneFormat.getFormat(),"")
        var phoneFormat1 = phoneFormat.setFormat("cangjie")
        println(phoneFormat1.hasFormatFunc())
        println(phoneFormat1.getFormat())
        @Assert(phoneFormat1.hasFormatFunc(),true)
        @Assert(phoneFormat1.getFormat(),"cangjie")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_8(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setFormat("仓颉")
        @Assert(phoneFormat1.hasFormatFunc(),true)
        @Assert(phoneFormat1.getFormat(),"仓颉")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_9(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setFormat("#%*&")
        @Assert(phoneFormat1.hasFormatFunc(),true)
        @Assert(phoneFormat1.getFormat(),"#%*&")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_10(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setFormat(" ")
        @Assert(phoneFormat1.hasFormatFunc(),true)
        @Assert(phoneFormat1.getFormat()," ")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_11(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setFormat("")
        @Assert(phoneFormat1.hasFormatFunc(),true)
        @Assert(phoneFormat1.getFormat(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_12(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some("111111111"))
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some("dasdasd"))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(1).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[111111111, dasdasd]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"2")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"2")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow(),"111111111")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_13(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some("111111111"))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(0).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[111111111]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow(),"111111111")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_14(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some("cangjie仓颉"))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(0).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[cangjie仓颉]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow(),"cangjie仓颉")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_15(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some("cangjie仓颉@#&*"))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(0).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[cangjie仓颉@#&*]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow(),"cangjie仓颉@#&*")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_16(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some(" "))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(0).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[ ]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow()," ")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_17(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        phoneFormat.addLeadingDigitsPattern(Option<String>.Some(""))
        println(phoneFormat.leadingDigitPatterns())
        println(phoneFormat.leadingDigitsPatternSize())
        println(phoneFormat.getLeadingDigitsPatternCount())
        println(phoneFormat.getLeadingDigitsPattern(0).getOrThrow())
        @Assert(phoneFormat.leadingDigitPatterns().toString(),"[]")
        @Assert(phoneFormat.leadingDigitsPatternSize().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPatternCount().toString(),"1")
        @Assert(phoneFormat.getLeadingDigitsPattern(0).getOrThrow(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_18(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setNationalPrefixFormattingRule("hhhhhhhhhhh")
        println(phoneFormat1.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat1.getNationalPrefixFormattingRule())
        @Assert(phoneFormat1.hasNationalPrefixFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixFormattingRule().toString(),"hhhhhhhhhhh")
        var phoneFormat2 = phoneFormat.clearNationalPrefixFormattingRule()
        println(phoneFormat2.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat2.getNationalPrefixFormattingRule())
        @Assert(phoneFormat2.hasNationalPrefixFormattingRuleFunc(),false)
        @Assert(phoneFormat2.getNationalPrefixFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_19(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setNationalPrefixFormattingRule("cangjie仓颉")
        println(phoneFormat1.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat1.getNationalPrefixFormattingRule())
        @Assert(phoneFormat1.hasNationalPrefixFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixFormattingRule().toString(),"cangjie仓颉")
        var phoneFormat2 = phoneFormat.clearNationalPrefixFormattingRule()
        println(phoneFormat2.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat2.getNationalPrefixFormattingRule())
        @Assert(phoneFormat2.hasNationalPrefixFormattingRuleFunc(),false)
        @Assert(phoneFormat2.getNationalPrefixFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_20(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setNationalPrefixFormattingRule("cangjie仓颉^&*")
        println(phoneFormat1.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat1.getNationalPrefixFormattingRule())
        @Assert(phoneFormat1.hasNationalPrefixFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixFormattingRule().toString(),"cangjie仓颉^&*")
        var phoneFormat2 = phoneFormat.clearNationalPrefixFormattingRule()
        println(phoneFormat2.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat2.getNationalPrefixFormattingRule())
        @Assert(phoneFormat2.hasNationalPrefixFormattingRuleFunc(),false)
        @Assert(phoneFormat2.getNationalPrefixFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_21(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setNationalPrefixFormattingRule(" ")
        println(phoneFormat1.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat1.getNationalPrefixFormattingRule())
        @Assert(phoneFormat1.hasNationalPrefixFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixFormattingRule().toString()," ")
        var phoneFormat2 = phoneFormat.clearNationalPrefixFormattingRule()
        println(phoneFormat2.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat2.getNationalPrefixFormattingRule())
        @Assert(phoneFormat2.hasNationalPrefixFormattingRuleFunc(),false)
        @Assert(phoneFormat2.getNationalPrefixFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_22(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat1 = phoneFormat.setNationalPrefixFormattingRule("")
        println(phoneFormat1.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat1.getNationalPrefixFormattingRule())
        @Assert(phoneFormat1.hasNationalPrefixFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixFormattingRule().toString(),"")
        var phoneFormat2 = phoneFormat.clearNationalPrefixFormattingRule()
        println(phoneFormat2.hasNationalPrefixFormattingRuleFunc())
        println(phoneFormat2.getNationalPrefixFormattingRule())
        @Assert(phoneFormat2.hasNationalPrefixFormattingRuleFunc(),false)
        @Assert(phoneFormat2.getNationalPrefixFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_23(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasNationalPrefixOptionalWhenFormattingFunc())
        println(phoneFormat.getNationalPrefixOptionalWhenFormatting())
        @Assert(phoneFormat.hasNationalPrefixOptionalWhenFormattingFunc(),false)
        @Assert(phoneFormat.getNationalPrefixOptionalWhenFormatting(),false)
        var phoneFormat1 = phoneFormat.setNationalPrefixOptionalWhenFormatting(true)
        println(phoneFormat1.hasNationalPrefixOptionalWhenFormattingFunc())
        println(phoneFormat1.getNationalPrefixOptionalWhenFormatting())
        @Assert(phoneFormat1.hasNationalPrefixOptionalWhenFormattingFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixOptionalWhenFormatting(),true)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_24(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasNationalPrefixOptionalWhenFormattingFunc())
        println(phoneFormat.getNationalPrefixOptionalWhenFormatting())
        @Assert(phoneFormat.hasNationalPrefixOptionalWhenFormattingFunc(),false)
        @Assert(phoneFormat.getNationalPrefixOptionalWhenFormatting(),false)
        var phoneFormat1 = phoneFormat.setNationalPrefixOptionalWhenFormatting(false)
        println(phoneFormat1.hasNationalPrefixOptionalWhenFormattingFunc())
        println(phoneFormat1.getNationalPrefixOptionalWhenFormatting())
        @Assert(phoneFormat1.hasNationalPrefixOptionalWhenFormattingFunc(),true)
        @Assert(phoneFormat1.getNationalPrefixOptionalWhenFormatting(),false)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_25(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc(),false)
        @Assert(phoneFormat.getDomesticCarrierCodeFormattingRule().toString(),"")
        var phoneFormat1 = phoneFormat.setDomesticCarrierCodeFormattingRule("cangjie")
        println(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat1.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getDomesticCarrierCodeFormattingRule().toString(),"cangjie")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_26(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc(),false)
        @Assert(phoneFormat.getDomesticCarrierCodeFormattingRule().toString(),"")
        var phoneFormat1 = phoneFormat.setDomesticCarrierCodeFormattingRule("cangjie仓颉")
        println(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat1.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getDomesticCarrierCodeFormattingRule().toString(),"cangjie仓颉")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_27(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc(),false)
        @Assert(phoneFormat.getDomesticCarrierCodeFormattingRule().toString(),"")
        var phoneFormat1 = phoneFormat.setDomesticCarrierCodeFormattingRule("cangjie仓颉$%^&")
        println(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat1.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getDomesticCarrierCodeFormattingRule().toString(),"cangjie仓颉$%^&")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_28(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc(),false)
        @Assert(phoneFormat.getDomesticCarrierCodeFormattingRule().toString(),"")
        var phoneFormat1 = phoneFormat.setDomesticCarrierCodeFormattingRule(" ")
        println(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat1.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getDomesticCarrierCodeFormattingRule().toString()," ")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_29(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat.hasDomesticCarrierCodeFormattingRuleFunc(),false)
        @Assert(phoneFormat.getDomesticCarrierCodeFormattingRule().toString(),"")
        var phoneFormat1 = phoneFormat.setDomesticCarrierCodeFormattingRule("")
        println(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc())
        println(phoneFormat1.getDomesticCarrierCodeFormattingRule())
        @Assert(phoneFormat1.hasDomesticCarrierCodeFormattingRuleFunc(),true)
        @Assert(phoneFormat1.getDomesticCarrierCodeFormattingRule().toString(),"")
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_30(): Unit {
        var phoneFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat2 = phoneFormat
        println(phoneFormat == phoneFormat2)
        println(phoneFormat != phoneFormat2)
        @Assert(phoneFormat == phoneFormat2,true)
        @Assert(phoneFormat != phoneFormat2,false)
    }

    @TestCase
    func phoneNumber_PhoneNumberUtil_31(): Unit {
        var phoneFormat3: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        var phoneFormat4: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
        println(phoneFormat3 == phoneFormat4)
        println(phoneFormat3 != phoneFormat4)
        @Assert(phoneFormat3 == phoneFormat4,false)
        @Assert(phoneFormat3 != phoneFormat4,true)
    }
}
