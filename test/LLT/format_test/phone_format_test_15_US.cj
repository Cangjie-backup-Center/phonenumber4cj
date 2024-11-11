// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import std.regex.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.libphonenumber.data.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.*

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
        sourceImp.getMetadataForNonGeographicalRegion(1)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException: 1 calling code belongs to a geo entity") {
            return 1
        }
    }

    return 0
}
