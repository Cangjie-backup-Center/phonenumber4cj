// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main

from phonenumber import carrier.*
from phonenumber import prefixmapper.*
from phonenumber import libphonenumber.inter.*

main() {
    var phone: PhoneNumber = PhoneNumber()
    phone.setCountryCodes(1).setNationalNumbers(3128030095)
    var p: PhoneNumberToCarrierMapper = PhoneNumberToCarrierMapper.getInstance().getOrThrow()
    let res: String = p.getNameForNumber(phone, Language.US)
    if (Language.English == Language.US) {
        println(Language.English.toString())
    }
    if (Language.English != Language.US) {
        println(Language.Chinese.toString())
    }
    if (res.isEmpty()) {
        return 0
    }
    return 1
}
