// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

main() {
    var asYouTypeFormatter = AsYouTypeFormatter("CN")
    asYouTypeFormatter.inputDigit(r'+')
    asYouTypeFormatter.inputDigit(r'8')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit(r'6')
    if (asYouTypeFormatterStr1 != "+86") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'1')
    asYouTypeFormatter.inputDigit(r'8')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit(r'7')
    if (asYouTypeFormatterStr2 != "+86 +86187") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'1')
    asYouTypeFormatter.inputDigit(r'7')
    asYouTypeFormatter.inputDigit(r'6')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit(r'1')
    if (asYouTypeFormatterStr3 != "+86 +861871761") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit(r'9');
    asYouTypeFormatter.inputDigit(r'0');
    asYouTypeFormatter.inputDigitAndRememberPosition(r'8')
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit(r'9')
    if (asYouTypeFormatterStr4 != "+86 +8618717619089") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 17) {
        return 1
    }
    println("${asYouTypeFormatterStr1}")
    println("${asYouTypeFormatterStr2}")
    println("${asYouTypeFormatterStr3}")
    println("${asYouTypeFormatterStr4}")
    return 0
}
