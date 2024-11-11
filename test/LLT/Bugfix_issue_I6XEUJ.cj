// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phonenumber: PhoneNumber = PhoneNumber()
    var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    println(phoneNumbertocarriermapper.getNameForValidNumber(phonenumber,English))
    println(phoneNumbertocarriermapper.getNameForNumber(phonenumber,English))
    println(phoneNumbertocarriermapper.getSafeDisplayName(phonenumber,English))
    return 0
}
