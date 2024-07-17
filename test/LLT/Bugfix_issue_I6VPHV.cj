// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

import phonenumber4cj.carrier.*
import phonenumber4cj.prefixmapper.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.*

main() {
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var number: PhoneNumber = phonenumberUtil.parse("12315", "CN")
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForValidNumber(number, Language.China)
    if(res.isEmpty()) {
        return 0
    }
    return 1
}
