// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("199   9182   2826", "CN")
    var format1: String = phoneNumberUtil.format(phoneNumber, PhoneNumberFormat.INTERNATIONAL)
    println("PhoneNumberFormat.INTERNATIONAL ==> ${format1}")
    if ("+86 199 9182 2826" != format1) {
        return 1
    }
    return 0
}
