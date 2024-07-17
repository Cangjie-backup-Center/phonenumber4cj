// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var zipPreceding: String = "仓颉测试一下hhhhh一下hh,中文18717619089中文"
    var iterator: Iterator<PhoneNumberMatch> = phoneUtil.findNumbers(zipPreceding, "CN").iterator()
    while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                if (number1.getNationalNumbers() != 18717619089) { return 1 }
                break
            case None => println("None...")
                return 1
        }
    }
    return 0
}
