// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import carrier.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(415601789)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForNumber(phone, Language.US)
    println(res)
    if (res.isEmpty()) {
        return 0
    }
    return 1
}
