// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var zipPreceding: String = "aaaa18717619089文"
    var iterator: Iterator<PhoneNumberMatch> = phoneUtil.findNumbers(zipPreceding, "CN").iterator()
    while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                return 1
            case None => println("None...")
                break
        }
    }
    return 0
}
