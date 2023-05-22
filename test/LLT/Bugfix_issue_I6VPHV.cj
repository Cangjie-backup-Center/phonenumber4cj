// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber4cj import carrier.*
from phonenumber4cj import prefixmapper.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.*

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
