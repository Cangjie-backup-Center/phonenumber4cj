//3rd_party_lib:phonenumber4cj/build/phonenumber4cj
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

@Test
public class phoneNumber_GetAsyoutypeFormatter {
    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_01(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var asyoutypeformatter = phoneNumberUtil.getAsYouTypeFormatter("US")
        var asyou = asyoutypeformatter.inputDigit(r'1')
        var asyou1 = asyoutypeformatter.inputDigit(r'z')
        @Assert(asyou1,"1z")
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_02(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigit(r'1')
        println(asyoutupe)
        @Assert(asyoutupe,"1")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_03(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigit(r'z')
        println(asyoutupe)
        @Assert(asyoutupe,"z")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_04(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit(r'仓')
        println(asyoutupe)
        @Assert(asyoutupe,"仓")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_05(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit(r' ')
        println(asyoutupe)
        @Assert(asyoutupe," ")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_06(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigit(r'#')
        println(asyoutupe)
        @Assert(asyoutupe,"#")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_07(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        asyoutypeformatter.inputDigit(r'#')
        asyoutypeformatter.inputDigit(r'中')
        asyoutypeformatter.inputDigit(r' ')
        asyoutypeformatter.inputDigit(r'1')
        var asyoutupe4 = asyoutypeformatter.inputDigit(r'c')
        @Assert(asyoutupe4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_08(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(r'1')
        println(asyoutupe)
        @Assert(asyoutupe,"1")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_09(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(r'z')
        println(asyoutupe)
        @Assert(asyoutupe,"z")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_10(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(r'仓')
        println(asyoutupe)
        @Assert(asyoutupe,"仓")
        @Assert(asyoutypeformatter.getRememberedPosition(),3)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_11(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("CN")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(r' ')
        println(asyoutupe)
        println(asyoutypeformatter.getRememberedPosition())
        @Assert(asyoutupe," ")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_12(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        var asyoutupe = asyoutypeformatter.inputDigitAndRememberPosition(r'#')
        println(asyoutupe)
        @Assert(asyoutupe,"#")
        @Assert(asyoutypeformatter.getRememberedPosition(),1)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_13(): Unit {
        var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        var asyoutypeformatter = phoneNumberUtil.getAsYouTypeFormatter("US")
        asyoutypeformatter.inputDigitAndRememberPosition(r'#')
        asyoutypeformatter.inputDigitAndRememberPosition(r'中')
        asyoutypeformatter.inputDigitAndRememberPosition(r' ')
        asyoutypeformatter.inputDigitAndRememberPosition(r'1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition(r'c')
        asyoutypeformatter.clear()
        @Assert(asyoutupe4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_14(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        asyoutypeformatter.inputDigit(r'#')
        asyoutypeformatter.inputDigit(r'中')
        asyoutypeformatter.inputDigit(r' ')
        asyoutypeformatter.inputDigit(r'1')
        var asyoutu4 = asyoutypeformatter.inputDigit(r'c')
        asyoutypeformatter.inputDigitAndRememberPosition(r'#')
        asyoutypeformatter.inputDigitAndRememberPosition(r'在')
        asyoutypeformatter.inputDigitAndRememberPosition(r' ')
        asyoutypeformatter.inputDigitAndRememberPosition(r'1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition(r'c')
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
        asyoutypeformatter.inputDigit(r'#')
        asyoutypeformatter.inputDigit(r'中')
        asyoutypeformatter.inputDigit(r' ')
        asyoutypeformatter.inputDigit(r'1')
        var asyoutu4 = asyoutypeformatter.inputDigit(r'c')
        println(asyoutu4)
        asyoutypeformatter.clear()
        println(asyoutu4)
        @Assert(asyoutu4,"#中 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

    @TestCase
    func phoneNumber_GetAsyoutypeFormatter_16(): Unit {
        var asyoutypeformatter: AsYouTypeFormatter = AsYouTypeFormatter("US")
        asyoutypeformatter.inputDigitAndRememberPosition(r'#')
        asyoutypeformatter.inputDigitAndRememberPosition(r'在')
        asyoutypeformatter.inputDigitAndRememberPosition(r' ')
        asyoutypeformatter.inputDigitAndRememberPosition(r'1')
        var asyoutupe4 = asyoutypeformatter.inputDigitAndRememberPosition(r'c')
        println(asyoutupe4)
        asyoutypeformatter.clear()
        println(asyoutupe4)
        @Assert(asyoutupe4,"#在 1c")
        @Assert(asyoutypeformatter.getRememberedPosition(),0)
    }

}
