// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*

main() {
    var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
    desc.addPossibleLengthLocalOnly(0)
    desc.addPossibleLengthLocalOnly(1)
    if (desc.getPossibleLengthLocalOnly(0) != 0) {
        return 1
    }

    desc.setNationalNumberPattern("$1 $2")
    desc.addPossibleLength(10)
    desc.addPossibleLengthLocalOnly(20)
    desc.setExampleNumber("30")

    var descBuild: PhoneNumberDescBuilder = PhoneNumberDescBuilder()
    descBuild.mergeFrom(desc)
    if (descBuild.getNationalNumberPattern() != "$1 $2") {
        return 1
    }
    if (descBuild.getPossibleLength(0) != 10) {
        return 1
    }
    if (descBuild.getPossibleLengthLocalOnly(0) != 0) {
        return 1
    }
    if (descBuild.getExampleNumber() != "30") {
        return 1
    }
    0
}