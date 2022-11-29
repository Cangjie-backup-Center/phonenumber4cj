// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.E164)
    println("PhoneNumberFormat.E164 ==> ${format1}")
    if (format1 != "+8619991822826") {
        return 1
    }
    return 0
}