// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var asYouTypeFormatter = phoneNumberUtil.getAsYouTypeFormatter("CN")
    asYouTypeFormatter.inputDigit(r'1')
    asYouTypeFormatter.inputDigit(r'9')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit(r'9')
    if (asYouTypeFormatterStr1 != "199") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'9')
    asYouTypeFormatter.inputDigit(r'1')
    asYouTypeFormatter.inputDigit(r'8')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit(r'2')
    if (asYouTypeFormatterStr2 != "1999182") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'2')
    asYouTypeFormatter.inputDigit(r'8')
    asYouTypeFormatter.inputDigitAndRememberPosition(r'2')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit(r'6')
    if (asYouTypeFormatterStr3 != "19991822826") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 10) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit(r'7')
    if (asYouTypeFormatterStr4 != "199918228267") {
        return 1
    }
    var asYouTypeFormatterStr5: String = asYouTypeFormatter.inputDigit(r'7')
    if (asYouTypeFormatterStr5 != "1999182282677") {
        return 1
    }
    asYouTypeFormatter.clear()
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    var asYouTypeFormatterStr6: String = asYouTypeFormatter.inputDigit(r'7')
    if (asYouTypeFormatterStr6 != "7") {
        return 1
    }
    return 0
}
