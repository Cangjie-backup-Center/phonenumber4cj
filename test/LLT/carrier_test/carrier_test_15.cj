// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(13967195351)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getSafeDisplayName(phone, Language.China)
    println(res)
    if (!res.isEmpty()) {
        return 0
    }
    return 1
}
