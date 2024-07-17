// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(4156091789)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForValidNumber(phone, Language.US)
    if (res.isEmpty()) {
        return 0
    }
    return 1
}
