// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.geocoder.geocoding.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber = phonenumberUtil.parse("18717619089", "US")
    var p: PhoneNumberOfflineGeocoder = PhoneNumberOfflineGeocoder.getInstance().getOrThrow()
    var validNumber1 = p.getDescriptionForValidNumber(phoneNumber, English)
    var validNumber2 = p.getDescriptionForValidNumber(phoneNumber, English, "仓颉")
    var number1 = p.getDescriptionForNumber(phoneNumber, English)
    var number2 = p.getDescriptionForNumber(phoneNumber, English, "仓颉")
    println(validNumber1)
    println(validNumber2)
    println(number1)
    println(number2)
    return 0
}
