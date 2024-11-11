// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

main() {
    var asYouTypeFormatter = AsYouTypeFormatter("US")
    asYouTypeFormatter.inputDigit(r'+')
    asYouTypeFormatter.inputDigit(r'1')
    asYouTypeFormatter.inputDigit(r'4')
    asYouTypeFormatter.inputDigit(r'2')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit(r'5')
    if (asYouTypeFormatterStr1 != "+1425") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'5')
    asYouTypeFormatter.inputDigit(r'5')
    asYouTypeFormatter.inputDigit(r'5')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit(r'0')
    if (asYouTypeFormatterStr2 != "+14255550") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigitAndRememberPosition(r'1')
    asYouTypeFormatter.inputDigit(r'0')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit(r'0')
    if (asYouTypeFormatterStr3 != "+14255550100") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 10) {
        return 1
    }
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit(r'9')
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
