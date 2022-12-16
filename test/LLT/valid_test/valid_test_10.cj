// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*
from std import regex.*
from std import os.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("1389408399211", "CN")
    var num = phoneNumber.getNationalNumbers()
    println("${num}")
    var isValid: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
    println("${isValid}")
    if (isValid != false) {
        return 1
    }
    0
}

