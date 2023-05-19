// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import carrier.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var phonenumber: PhoneNumber = PhoneNumber()
    var phoneNumbertocarriermapper:PhoneNumberToCarrierMapper=PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    println(phoneNumbertocarriermapper.getNameForValidNumber(phonenumber,English))
    println(phoneNumbertocarriermapper.getNameForNumber(phonenumber,English))
    println(phoneNumbertocarriermapper.getSafeDisplayName(phonenumber,English))
    return 0
}
