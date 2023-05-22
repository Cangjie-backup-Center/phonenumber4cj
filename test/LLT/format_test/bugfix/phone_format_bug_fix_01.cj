// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber1: PhoneNumber = PhoneNumber()
    phonenumber1.setNationalNumbers(8007493524)
    phonenumber1.setCountryCodes(1)
    phonenumber1.setRawInputs("1800 six-flag")
    var str1 = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1,"CN")
    var str2 = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phonenumber1,"US")
    println(str1)
    println(str2)
    if (str1 != "00 1 800 SIX-FLAG") {
        return 1
    }
    if (str2 != "1 800 SIX-FLAG") {
        return 1
    }
    return 0
}
