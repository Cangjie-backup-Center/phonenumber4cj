// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import geocoder.geocoding.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber = phonenumberUtil.parse("+14255550100", "CN")
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    var validNumber1 = p.getDescriptionForValidNumber(phoneNumber, China)
    var validNumber2 = p.getDescriptionForValidNumber(phoneNumber, China, "仓颉")
    var number1 = p.getDescriptionForNumber(phoneNumber, China)
    var number2 = p.getDescriptionForNumber(phoneNumber, China, "仓颉")
    println(validNumber1)
    println(validNumber2)
    println(number1)
    println(number2)
    return 0
}
