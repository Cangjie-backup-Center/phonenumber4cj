// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*

main() {
    try {
        PhoneNumberMatch(-1, "123", PhoneNumber())
    } catch (e: Exception) {
        if (e.toString() != "IllegalArgumentException: Start index must be >= 0.") {
            return 1
        }
    }
    try {
        PhoneNumberMatch(1, "", PhoneNumber())
    } catch (e: Exception) {
        if (e.toString() != "Exception: Null Pointer") {
            return 1
        }
    }
    var phMatch = PhoneNumberMatch(1, "123", PhoneNumber())
    var res = phMatch.equals(phMatch)
    if (res != true) {
        return 1
    }
    var res2 = phMatch.equals(PhoneNumber())
    if (res2 != false) {
        return 1
    }
    0
}

