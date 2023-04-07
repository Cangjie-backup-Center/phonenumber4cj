// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from phonenumber import libphonenumber.*

main() {
    let p1: PhoneNumberType = PhoneNumberType.UNKNOWN
    let p2: PhoneNumberType = PhoneNumberType.VOICEMAIL
    let p3: PhoneNumberFormat = PhoneNumberFormat.RFC3966
    let p4: PhoneNumberFormat = PhoneNumberFormat.NATIONAL
    if (p3 == PhoneNumberFormat.RFC3966) {
        println(p3.toString())
    }
    if (p3 != p4) {
        println(p4.toString())
    }
    let v1: ValidationResult = ValidationResult.IS_POSSIBLE
    v1.toString()
    p1.hashCode()
    p1.toString()
    if (p1 != p2) {
        return 0
    }
    return 1
}
