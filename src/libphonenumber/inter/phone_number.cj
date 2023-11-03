package libphonenumber.inter

from serialization import serialization.*
from std import collection.*

public class PhoneNumber <: Serializable<PhoneNumber> {
    private static let serialVersionUID: Int64 = 1
    private var hasCountryCode: Bool = false
    private var countryCode: Int64 = 0
    private var hasNationalNumber: Bool = false
    private var nationalNumber: Int64 = 0
    private var hasExtension: Bool = false
    private var extension: String = ""
    private var hasItalianLeadingZero: Bool = false
    private var italianLeadingZero: Bool = false
    private var hasNumberOfLeadingZeros: Bool = false
    private var numberOfLeadingZeros: Int64 = 1
    private var hasRawInput: Bool = false
    private var rawInput: String = ""
    private var hasCountryCodeSource: Bool = false
    private var countryCodeSource: CountryCodeSource
    private var hasPreferredDomesticCarrierCode: Bool = false
    private var preferredDomesticCarrierCode: String = ""

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Bool>("hasCountryCode", hasCountryCode)).add(
            field<Int64>("countryCode", countryCode)).add(field<Bool>("hasNationalNumber", hasNationalNumber)).add(
            field<Int64>("nationalNumber", nationalNumber)).add(field<Bool>("hasExtension", hasExtension)).add(
            field<String>("extension", extension)).add(field<Bool>("hasItalianLeadingZero", hasItalianLeadingZero)).
        add(field<Bool>("italianLeadingZero", italianLeadingZero)).add(
            field<Bool>("hasNumberOfLeadingZeros", hasNumberOfLeadingZeros)).add(
            field<Int64>("numberOfLeadingZeros", numberOfLeadingZeros)).add(field<Bool>("hasRawInput", hasRawInput)).
        add(field<String>("rawInput", rawInput)).add(field<Bool>("hasCountryCodeSource", hasCountryCodeSource)).add(
            field<Bool>("hasPreferredDomesticCarrierCode", hasPreferredDomesticCarrierCode)).add(
            field<String>("preferredDomesticCarrierCode", preferredDomesticCarrierCode))
    }

    public static func deserialize(dm: DataModel): PhoneNumber {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = PhoneNumber()
        result.hasCountryCode = Bool.deserialize(dms.get("hasCountryCode"))
        result.countryCode = Int64.deserialize(dms.get("countryCode"))
        result.hasNationalNumber = Bool.deserialize(dms.get("hasNationalNumber"))
        result.nationalNumber = Int64.deserialize(dms.get("nationalNumber"))
        result.hasExtension = Bool.deserialize(dms.get("hasExtension"))
        result.extension = String.deserialize(dms.get("extension"))
        result.hasItalianLeadingZero = Bool.deserialize(dms.get("hasItalianLeadingZero"))
        result.italianLeadingZero = Bool.deserialize(dms.get("italianLeadingZero"))
        result.hasNumberOfLeadingZeros = Bool.deserialize(dms.get("hasNumberOfLeadingZeros"))
        result.numberOfLeadingZeros = Int64.deserialize(dms.get("numberOfLeadingZeros"))
        result.hasRawInput = Bool.deserialize(dms.get("hasRawInput"))
        result.rawInput = String.deserialize(dms.get("rawInput"))
        result.hasCountryCodeSource = Bool.deserialize(dms.get("hasCountryCodeSource"))
        result.hasPreferredDomesticCarrierCode = Bool.deserialize(dms.get("hasPreferredDomesticCarrierCode"))
        result.preferredDomesticCarrierCode = String.deserialize(dms.get("preferredDomesticCarrierCode"))
        return result
    }

    public init() {
        countryCodeSource = CountryCodeSource.UNSPECIFIED
    }

    public func hasCountryCodes(): Bool {
        return hasCountryCode
    }

    public func getCountryCodes(): Int64 {
        return countryCode
    }

    public func setCountryCodes(value: Int64): PhoneNumber {
        hasCountryCode = true
        countryCode = value
        return this
    }

    public func clearCountryCodes(): PhoneNumber {
        hasCountryCode = false
        countryCode = 0
        return this
    }

    public func hasNationalNumbers(): Bool {
        return hasNationalNumber
    }

    public func getNationalNumbers(): Int64 {
        return nationalNumber
    }

    public func setNationalNumbers(value: Int64): PhoneNumber {
        hasNationalNumber = true
        nationalNumber = value
        return this
    }

    public func clearNationalNumbers(): PhoneNumber {
        hasNationalNumber = false
        nationalNumber = 0
        return this
    }

    public func hasExtensions(): Bool {
        return hasExtension
    }

    public func getExtensions(): String {
        return extension
    }

    public func setExtensions(value: String): PhoneNumber {
        hasExtension = true
        extension = value
        return this
    }

    public func clearExtensions(): PhoneNumber {
        hasExtension = false
        extension = ""
        return this
    }

    public func hasItalianLeadingZeros(): Bool {
        return hasItalianLeadingZero
    }

    public func isItalianLeadingZeros(): Bool {
        return italianLeadingZero
    }

    public func setItalianLeadingZeros(value: Bool): PhoneNumber {
        hasItalianLeadingZero = true
        italianLeadingZero = value
        return this
    }

    public func clearItalianLeadingZeros(): PhoneNumber {
        hasItalianLeadingZero = false
        italianLeadingZero = false
        return this
    }

    public func hasNumbersOfLeadingZeros(): Bool {
        return hasNumberOfLeadingZeros
    }

    public func getNumbersOfLeadingZeros(): Int64 {
        return numberOfLeadingZeros
    }

    public func setNumberOfLeadingZeros(value: Int64): PhoneNumber {
        hasNumberOfLeadingZeros = true
        numberOfLeadingZeros = value
        return this
    }

    public func clearNumberOfLeadingZeros(): PhoneNumber {
        hasNumberOfLeadingZeros = false
        numberOfLeadingZeros = 1
        return this
    }

    public func hasRawInputs(): Bool {
        return hasRawInput
    }

    public func getRawInputs(): String {
        return rawInput
    }

    public func setRawInputs(value: String): PhoneNumber {
        hasRawInput = true
        rawInput = value
        return this
    }

    public func clearRawInputs(): PhoneNumber {
        hasRawInput = false
        rawInput = ""
        return this
    }

    public func hasCountryCodeSources(): Bool {
        return hasCountryCodeSource
    }

    public func getCountryCodeSources(): CountryCodeSource {
        return countryCodeSource
    }

    public func setCountryCodeSources(value: CountryCodeSource): PhoneNumber {
        hasCountryCodeSource = true
        countryCodeSource = value
        return this
    }

    public func clearCountryCodeSources(): PhoneNumber {
        hasCountryCodeSource = false
        countryCodeSource = CountryCodeSource.UNSPECIFIED
        return this
    }

    public func hasPreferredDomesticCarrierCodes(): Bool {
        return hasPreferredDomesticCarrierCode
    }

    public func getPreferredDomesticCarrierCodes(): String {
        return preferredDomesticCarrierCode
    }

    public func setPreferredDomesticCarrierCodes(value: String): PhoneNumber {
        hasPreferredDomesticCarrierCode = true
        preferredDomesticCarrierCode = value
        return this
    }

    public func clearPreferredDomesticCarrierCodes(): PhoneNumber {
        hasPreferredDomesticCarrierCode = false
        preferredDomesticCarrierCode = ""
        return this
    }

    public func clear(): PhoneNumber {
        clearCountryCodes()
        clearNationalNumbers()
        clearExtensions()
        clearItalianLeadingZeros()
        clearNumberOfLeadingZeros()
        clearRawInputs()
        clearCountryCodeSources()
        clearPreferredDomesticCarrierCodes()
        return this
    }

    public func mergeFrom(other: PhoneNumber): PhoneNumber {
        if (other.hasCountryCodes()) {
            setCountryCodes(other.getCountryCodes())
        }
        if (other.hasNationalNumbers()) {
            setNationalNumbers(other.getNationalNumbers())
        }
        if (other.hasExtensions()) {
            setExtensions(other.getExtensions())
        }
        if (other.hasItalianLeadingZeros()) {
            setItalianLeadingZeros(other.isItalianLeadingZeros())
        }
        if (other.hasNumbersOfLeadingZeros()) {
            setNumberOfLeadingZeros(other.getNumbersOfLeadingZeros())
        }
        if (other.hasRawInputs()) {
            setRawInputs(other.getRawInputs())
        }
        if (other.hasCountryCodeSources()) {
            setCountryCodeSources(other.getCountryCodeSources())
        }
        if (other.hasPreferredDomesticCarrierCodes()) {
            setPreferredDomesticCarrierCodes(other.getPreferredDomesticCarrierCodes())
        }
        return this
    }

    public func exactlySameAs(other: PhoneNumber): Bool {
        if (refEq(this, other)) {
            return true
        }
        return (countryCode == other.countryCode && 
            nationalNumber == other.nationalNumber &&
            extension == other.extension) && 
            italianLeadingZero == other.italianLeadingZero &&
            numberOfLeadingZeros == other.numberOfLeadingZeros &&
            rawInput == other.rawInput &&
            countryCodeSource == other.countryCodeSource &&
            preferredDomesticCarrierCode == other.preferredDomesticCarrierCode &&
            hasPreferredDomesticCarrierCodes() == other.hasPreferredDomesticCarrierCodes()
    }

    /* 
     * 从 proto 自动生成的 hashCode 函数的简化形式
     * 通常被认为是等于它们显式设置的等价物，一般不检查是否有值
     * 唯一的例外是首选的国内运营商代码
     */
    public func hashCode(): Int64 {
        var hash: Int64 = 41
        hash = (53 * hash) + getCountryCodes()
        hash = (53 * hash) + getNationalNumbers().hashCode()
        hash = (53 * hash) + getExtensions().hashCode()
        if (isItalianLeadingZeros()) {
            hash = (53 * hash) + 1231
        } else {
            hash = (53 * hash) + 1237
        }
        hash = (53 * hash) + getNumbersOfLeadingZeros()
        hash = (53 * hash) + getRawInputs().hashCode()
        hash = (53 * hash) + getPreferredDomesticCarrierCodes().hashCode()
        if (hasPreferredDomesticCarrierCodes()) {
            hash = (53 * hash) + 1231
        } else {
            hash = (53 * hash) + 1237
        }
        return hash
    }

    public func equals(that: Object): Bool {
        if (that is PhoneNumber) {
            var opt = that as PhoneNumber
            var result = opt.getOrThrow()
            return exactlySameAs(result)
        }
        return false
    }

    public func toString(): String {
        var outputString: StringBuilder = StringBuilder()
        outputString.append("Country Code: ")
        outputString.append(countryCode)
        outputString.append(" National Number: ")
        outputString.append(nationalNumber)
        if (hasItalianLeadingZeros()) {
            if (isItalianLeadingZeros()) {
                outputString.append(" Leading Zero(s): true")
            }
        }
        if (hasNumbersOfLeadingZeros()) {
            outputString.append(" Number of leading zeros: ")
            outputString.append(numberOfLeadingZeros)
        }
        if (hasExtensions()) {
            outputString.append(" Extension: ")
            outputString.append(extension)
        }
        if (hasCountryCodeSources()) {
            outputString.append(" Country Code Source: ")
            outputString.append(countryCodeSource.toString())
        }
        if (hasPreferredDomesticCarrierCodes()) {
            outputString.append(" Preferred Domestic Carrier Code: ")
            outputString.append(preferredDomesticCarrierCode)
        }
        return outputString.toString()
    }
}

public enum CountryCodeSource {
    | FROM_NUMBER_WITH_PLUS_SIGN
    | FROM_NUMBER_WITH_IDD
    | FROM_NUMBER_WITHOUT_PLUS_SIGN
    | FROM_DEFAULT_COUNTRY
    | UNSPECIFIED

    public operator func ==(that: CountryCodeSource): Bool {
        match ((this, that)) {
            case (FROM_NUMBER_WITH_PLUS_SIGN, FROM_NUMBER_WITH_PLUS_SIGN) => true
            case (FROM_NUMBER_WITH_IDD, FROM_NUMBER_WITH_IDD) => true
            case (FROM_NUMBER_WITHOUT_PLUS_SIGN, FROM_NUMBER_WITHOUT_PLUS_SIGN) => true
            case (FROM_DEFAULT_COUNTRY, FROM_DEFAULT_COUNTRY) => true
            case (UNSPECIFIED, UNSPECIFIED) => true
            case _ => false
        }
    }

    public operator func !=(that: CountryCodeSource): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match (this) {
            case FROM_NUMBER_WITH_PLUS_SIGN => "FROM_NUMBER_WITH_PLUS_SIGN"
            case FROM_NUMBER_WITH_IDD => "FROM_NUMBER_WITH_IDD"
            case FROM_NUMBER_WITHOUT_PLUS_SIGN => "FROM_NUMBER_WITHOUT_PLUS_SIGN"
            case FROM_DEFAULT_COUNTRY => "FROM_DEFAULT_COUNTRY"
            case UNSPECIFIED => "UNSPECIFIED"
        }
    }
}
