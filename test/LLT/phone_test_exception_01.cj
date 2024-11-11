// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.*

main() {
    var exception: NumberParseException = NumberParseException(ErrorType.TOO_LONG, "this is exception")
    MissingMetadataException("this is missingMetadataException")
    println(exception.toString())
    println(exception.getErrorType().toString())
    exception.getErrorType() != ErrorType.NOT_A_NUMBER
    if (exception.getErrorType() == ErrorType.TOO_LONG) {
        return 0
    }
    return 1
}
