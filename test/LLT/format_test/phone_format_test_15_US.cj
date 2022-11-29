// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from std import regex.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.metadata.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("tel:253-0000;phone-context=www.google.com", "US")
    var format17: String = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phoneNumber, "CN")
    var format18: String = phoneNumberUtil.formatOutOfCountryKeepingAlphaChars(phoneNumber, "US")
    println("format17 ==> ${format17}")
    println("format18 ==> ${format18}")
    if (format17 != "00 1 2530000") {
        return 1
    }
    if (format18 != "1 253-0000") {
        return 1
    }

    var sourceImp: MetadataSourceImpl = MetadataSourceImpl(
    DefaultMetadataDependenciesProvider.getInstance().getPhoneNumberMetadataFileNameProvider(),
    DefaultMetadataDependenciesProvider.getInstance().getMetadataLoader(),
    DefaultMetadataDependenciesProvider.getInstance().getMetadataParser()
    )
    try {
        sourceImp.getMetadataForNonGeographicalRegion(001)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException: 1 calling code belongs to a geo entity") {
            return 1
        }
    }

    return 0
}
