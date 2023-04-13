// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(20835591356)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getSafeDisplayName(phone, Language.US)
    if (res.isEmpty()) {
        return 0
    }
    return 1
}
