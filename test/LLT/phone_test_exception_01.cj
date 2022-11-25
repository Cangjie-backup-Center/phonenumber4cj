// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

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
