// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var phoneNumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phoneNumber: PhoneNumber = phoneNumberUtil.parse("00-1-213-282-3146", "US")
    var phoneNumber2: PhoneNumber = phoneNumberUtil.parse("11111111111", "CN")
    showPhoneNumber(phoneNumber)
    showPhoneNumber(phoneNumber2)
    if (phoneNumber.hasCountryCodes()) {
        return 0
    }
    return 1
}

func showPhoneNumber(phoneNumber: PhoneNumber) {
    var hasCountryCode: Bool = phoneNumber.hasCountryCodes()
    var countryCode: Int64 = phoneNumber.getCountryCodes()
    println("hasCountryCode ==> ${hasCountryCode}")
    println("countryCode ==> ${countryCode}")

    var hasNationalNumber: Bool = phoneNumber.hasNationalNumbers()
    var nationalNumber: Int64 = phoneNumber.getNationalNumbers()
    println("hasNationalNumber ==> ${hasNationalNumber}")
    println("nationalNumber ==> ${nationalNumber}")

    var hasExtension: Bool = phoneNumber.hasExtensions()
    var extension: String = phoneNumber.getExtensions()
    println("hasExtension ==> ${hasExtension}")
    println("extension ==> ${extension}")


    var hasItalianLeadingZero: Bool = phoneNumber.hasItalianLeadingZeros()
    var italianLeadingZero: Bool = phoneNumber.isItalianLeadingZeros()
    println("hasItalianLeadingZero ==> ${hasItalianLeadingZero}")
    println("italianLeadingZero ==> ${italianLeadingZero}")


    var hasNumberOfLeadingZeros: Bool = phoneNumber.hasNumbersOfLeadingZeros()
    var numberOfLeadingZeros: Int64 = phoneNumber.getNumbersOfLeadingZeros()
    println("hasNumberOfLeadingZeros ==> ${hasNumberOfLeadingZeros}")
    println("numberOfLeadingZeros ==> ${numberOfLeadingZeros}")

    var hasRawInput: Bool = phoneNumber.hasRawInputs()
    var rawInput: String = phoneNumber.getRawInputs()
    println("hasRawInput ==> ${hasRawInput}")
    println("rawInput ==> ${rawInput}")

    var hasCountryCodeSource: Bool = phoneNumber.hasCountryCodeSources()
    var countryCodeSource: CountryCodeSource = phoneNumber.getCountryCodeSources()
    println("hasCountryCodeSource ==> ${hasCountryCodeSource}")
    println("countryCodeSource ==> ${matchCountryCodeSource(countryCodeSource)}")

    var hasPreferredDomesticCarrierCode: Bool = phoneNumber.hasPreferredDomesticCarrierCodes()
    var preferredDomesticCarrierCode: String = phoneNumber.getPreferredDomesticCarrierCodes()
    println("hasPreferredDomesticCarrierCode ==> ${hasPreferredDomesticCarrierCode}")
    println("preferredDomesticCarrierCode ==> ${preferredDomesticCarrierCode}")
}

func matchCountryCodeSource(countryCodeSource: CountryCodeSource): String {
    match (countryCodeSource) {
        case FROM_NUMBER_WITH_PLUS_SIGN => return "FROM_NUMBER_WITH_PLUS_SIGN"
        case FROM_NUMBER_WITH_IDD => return "FROM_NUMBER_WITH_IDD"
        case FROM_NUMBER_WITHOUT_PLUS_SIGN => "FROM_NUMBER_WITHOUT_PLUS_SIGN"
        case FROM_DEFAULT_COUNTRY => "FROM_DEFAULT_COUNTRY"
        case UNSPECIFIED => "UNSPECIFIED"
    }
}
