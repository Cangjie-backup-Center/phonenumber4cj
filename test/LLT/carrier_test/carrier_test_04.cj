// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(86).setNationalNumbers(13967195351)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForNumber(phone, Language.Chinese)
    let res2: String = p.getNameForNumber(phone, Language.English)
    if (res.isEmpty()) {
        return 1
    }
    println(res)
    println(res2)
    return 0
}
