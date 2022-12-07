// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var asYouTypeFormatter = phoneNumberUtil.getAsYouTypeFormatter("CN")
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('9')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit('9')
    if (asYouTypeFormatterStr1 != "199") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('9')
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('8')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit('2')
    if (asYouTypeFormatterStr2 != "199 9182") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('2')
    asYouTypeFormatter.inputDigit('8')
    asYouTypeFormatter.inputDigitAndRememberPosition('2')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit('6')
    if (asYouTypeFormatterStr3 != "199 9182 2826") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 12) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr4 != "19 991 822 8267") {
        return 1
    }
    var asYouTypeFormatterStr5: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr5 != "1999182282677") {
        return 1
    }
    asYouTypeFormatter.clear()
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    var asYouTypeFormatterStr6: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr6 != "7") {
        return 1
    }
    return 0
}
