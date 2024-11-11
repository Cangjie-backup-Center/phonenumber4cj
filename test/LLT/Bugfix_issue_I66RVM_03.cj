// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var zipPreceding: String = "cangjie1hh中文hhhhh,800-375-5283..."
    var iterator: Iterator<PhoneNumberMatch> = phoneUtil.findNumbers(zipPreceding, "US").iterator()
    while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                if (number1.getNationalNumbers() != 8003755283) { return 1 }
                break
            case None => println("None...")
                return 1
        }
    }
    return 0
}
