// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.*

main() {
    var pndb: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc.newBuilder()
    var pndb2: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
    pndb2.addPossibleLength(111)
    pndb.clearNationalNumberPattern()
    pndb.addPossibleLength(72)
    
    pndb.addPossibleLengthLocalOnly(24)
    pndb.clearPossibleLengthLocalOnly()
    
    if (pndb == pndb2) {
        pndb.clearExampleNumber()
    }

    if (pndb != pndb2) {
        pndb.clearPossibleLength()
    }

    if (pndb.exactlySameAs(pndb2)) {
        return 1
    }
    return 0
}
