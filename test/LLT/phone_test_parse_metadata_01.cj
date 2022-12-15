// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.*

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
