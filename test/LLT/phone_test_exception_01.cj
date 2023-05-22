// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*
from phonenumber4cj import libphonenumber.*

main() {
    var exception: NumberParseException = NumberParseException(ErrorType.TOO_LONG, "this is exception")
    var illegalStateException: IllegalStateException = IllegalStateException()
    var missingMetadataException: MissingMetadataException = MissingMetadataException("this is missingMetadataException")
    println(exception.toString())
    println(exception.getErrorType().toString())
    exception.getErrorType() != ErrorType.NOT_A_NUMBER
    if (exception.getErrorType() == ErrorType.TOO_LONG) {
        return 0
    }
    return 1
}
