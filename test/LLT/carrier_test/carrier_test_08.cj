// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(2023282500)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForValidNumber(phone, Language.English)
    println(res)
    if (!res.isEmpty()) {
        return 0
    }
    return 1
}
