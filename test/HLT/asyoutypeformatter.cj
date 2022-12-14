//3rd_party_lib:phonenumber/build/phonenumber
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

@Test
public class phoneNumber_GetAsyoutypeFormatter {
    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_01(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var asyoutypeformatter = phoneNumberUtil.getAsYouTypeFormatter("US")
        var asyou = asyoutypeformatter.inputDigit('1')
        var asyou1 = asyoutypeformatter.inputDigit('z')
        @Assert(asyou1,"1z")
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_02(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigit('1')
        println(asyoutupe)
        @Assert(asyoutupe,"1")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_03(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigit('z')
        println(asyoutupe)
        @Assert(asyoutupe,"z")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_04(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit('仓')
        println(asyoutupe)
        @Assert(asyoutupe,"仓")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_05(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit(' ')
        println(asyoutupe)
        @Assert(asyoutupe," ")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_06(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit('#')
        println(asyoutupe)
        @Assert(asyoutupe,"#")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_07(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        asyoutypeformatter.inputDigit('#')
        asyoutypeformatter.inputDigit('中')
        asyoutypeformatter.inputDigit(' ')
        asyoutypeformatter.inputDigit('1')
        var asyoutupe4 = asyoutypeformatter.inputDigit('c')
        @Assert(asyoutupe4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_08(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition('1')
        println(asyoutupe)
        @Assert(asyoutupe,"1")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_09(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition('z')
        println(asyoutupe)
        @Assert(asyoutupe,"z")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_10(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition('仓')
        println(asyoutupe)
        @Assert(asyoutupe,"仓")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_11(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(' ')
        println(asyoutupe)
        println(asyoutypeformatter.getRememberedPosition())
        @Assert(asyoutupe," ")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_12(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition('#')
        println(asyoutupe)
        @Assert(asyoutupe,"#")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_13(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var asyoutypeformatter = phoneNumberUtil.getAsYouTypeFormatter("US")
        asyoutypeformatter.inputDigitAndRememberPosition('#')
        asyoutypeformatter.inputDigitAndRememberPosition('中')
        asyoutypeformatter.inputDigitAndRememberPosition(' ')
        asyoutypeformatter.inputDigitAndRememberPosition('1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition('c')
        asyoutypeformatter.clear()
        @Assert(asyoutupe4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_14(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        asyoutypeformatter.inputDigit('#')
        asyoutypeformatter.inputDigit('中')
        asyoutypeformatter.inputDigit(' ')
        asyoutypeformatter.inputDigit('1')
        var asyoutu4 = asyoutypeformatter.inputDigit('c')
        asyoutypeformatter.inputDigitAndRememberPosition('#')
        asyoutypeformatter.inputDigitAndRememberPosition('在')
        asyoutypeformatter.inputDigitAndRememberPosition(' ')
        asyoutypeformatter.inputDigitAndRememberPosition('1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition('c')
        asyoutypeformatter.clear()
        println(asyoutu4)
        println(asyoutupe4)
        @Assert(asyoutu4,"#中 1c")
        @Assert(asyoutupe4,"#中 1c#在 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_15(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        asyoutypeformatter.inputDigit('#')
        asyoutypeformatter.inputDigit('中')
        asyoutypeformatter.inputDigit(' ')
        asyoutypeformatter.inputDigit('1')
        var asyoutu4 = asyoutypeformatter.inputDigit('c')
        println(asyoutu4)
        asyoutypeformatter.clear()
        println(asyoutu4)
        @Assert(asyoutu4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_16(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        asyoutypeformatter.inputDigitAndRememberPosition('#')
        asyoutypeformatter.inputDigitAndRememberPosition('在')
        asyoutypeformatter.inputDigitAndRememberPosition(' ')
        asyoutypeformatter.inputDigitAndRememberPosition('1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition('c')
        println(asyoutupe4)
        asyoutypeformatter.clear()
        println(asyoutupe4)
        @Assert(asyoutupe4,"#在 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

}
