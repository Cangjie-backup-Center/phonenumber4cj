// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var asYouTypeFormatter = AsYouTypeFormatter("US")
    asYouTypeFormatter.inputDigit('+')
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('4')
    asYouTypeFormatter.inputDigit('2')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit('5')
    if (asYouTypeFormatterStr1 != "+1 425") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('5')
    asYouTypeFormatter.inputDigit('5')
    asYouTypeFormatter.inputDigit('5')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit('0')
    if (asYouTypeFormatterStr2 != "+1 425-555-0") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigitAndRememberPosition('1')
    asYouTypeFormatter.inputDigit('0')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit('0')
    if (asYouTypeFormatterStr3 != "+1 425-555-0100") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 13) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit('9')
    if (asYouTypeFormatterStr4 != "+142555501009") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 10) {
        return 1
    }
    asYouTypeFormatter.clear()
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    return 0
}
