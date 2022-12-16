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
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("+1-213-282-3146", "CN")
    var num = phoneNumber.getNationalNumbers()
    println("${num}")
    var isValid1: Bool = phoneNumberUtil.isValidNumber(phoneNumber)
    println("${isValid1}")
    if (isValid1 != true) {
        return 1
    }
    var isValid2: Bool = phoneNumberUtil.isValidNumberForRegion(phoneNumber, "US")
    println("${isValid2}")
    if (isValid2 != true) {
        return 1
    }
    0
}

