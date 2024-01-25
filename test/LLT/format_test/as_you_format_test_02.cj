// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var asYouTypeFormatter = AsYouTypeFormatter("CN")
    asYouTypeFormatter.inputDigit('+')
    asYouTypeFormatter.inputDigit('8')
    var asYouTypeFormatterStr1: String = asYouTypeFormatter.inputDigit('6')
    if (asYouTypeFormatterStr1 != "+86") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('8')
    var asYouTypeFormatterStr2: String = asYouTypeFormatter.inputDigit('7')
    if (asYouTypeFormatterStr2 != "+86 +86187") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('1')
    asYouTypeFormatter.inputDigit('7')
    asYouTypeFormatter.inputDigit('6')
    var asYouTypeFormatterStr3: String = asYouTypeFormatter.inputDigit('1')
    if (asYouTypeFormatterStr3 != "+86 +861871761") {
        return 1
    }
    if (asYouTypeFormatter.getRememberedPosition() != 0) {
        return 1
    }
    asYouTypeFormatter.inputDigit('9');
    asYouTypeFormatter.inputDigit('0');
    asYouTypeFormatter.inputDigitAndRememberPosition('8')
    var asYouTypeFormatterStr4: String = asYouTypeFormatter.inputDigit('9')
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
