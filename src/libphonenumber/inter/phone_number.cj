package libphonenumber.inter

from serialization import serialization.*
from std import collection.*

public class PhoneNumber <: Serializable<PhoneNumber> {
    private static let serialVersionUID: Int64 = 1
    private var hasCountryCode: Bool = false
    private var countryCode_: Int64 = 0
    private var hasNationalNumber: Bool = false
    private var nationalNumber_: Int64 = 0
    private var hasExtension: Bool = false
    private var extension_: String = ""
    private var hasItalianLeadingZero: Bool = false
    private var italianLeadingZero_: Bool = false
    private var hasNumberOfLeadingZeros: Bool = false
    private var numberOfLeadingZeros_: Int64 = 1
    private var hasRawInput: Bool = false
    private var rawInput_: String = ""
    private var hasCountryCodeSource: Bool = false
    private var countryCodeSource_: CountryCodeSource
    private var hasPreferredDomesticCarrierCode: Bool = false
    private var preferredDomesticCarrierCode_: String = ""

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Bool>("hasCountryCode", hasCountryCode)).add(
            field<Int64>("countryCode_", countryCode_)).add(field<Bool>("hasNationalNumber", hasNationalNumber)).add(
            field<Int64>("nationalNumber_", nationalNumber_)).add(field<Bool>("hasExtension", hasExtension)).add(
            field<String>("extension_", extension_)).add(field<Bool>("hasItalianLeadingZero", hasItalianLeadingZero)).
        add(field<Bool>("italianLeadingZero_", italianLeadingZero_)).add(
            field<Bool>("hasNumberOfLeadingZeros", hasNumberOfLeadingZeros)).add(
            field<Int64>("numberOfLeadingZeros_", numberOfLeadingZeros_)).add(field<Bool>("hasRawInput", hasRawInput)).
        add(field<String>("rawInput_", rawInput_)).add(field<Bool>("hasCountryCodeSource", hasCountryCodeSource)).add(
            field<Bool>("hasPreferredDomesticCarrierCode", hasPreferredDomesticCarrierCode)).add(
            field<String>("preferredDomesticCarrierCode_", preferredDomesticCarrierCode_))
    }

    public static func deserialize(dm: DataModel): PhoneNumber {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = PhoneNumber()
        result.hasCountryCode = Bool.deserialize(dms.get("hasCountryCode"))
        result.countryCode_ = Int64.deserialize(dms.get("countryCode_"))
        result.hasNationalNumber = Bool.deserialize(dms.get("hasNationalNumber"))
        result.nationalNumber_ = Int64.deserialize(dms.get("nationalNumber_"))
        result.hasExtension = Bool.deserialize(dms.get("hasExtension"))
        result.extension_ = String.deserialize(dms.get("extension_"))
        result.hasItalianLeadingZero = Bool.deserialize(dms.get("hasItalianLeadingZero"))
        result.italianLeadingZero_ = Bool.deserialize(dms.get("italianLeadingZero_"))
        result.hasNumberOfLeadingZeros = Bool.deserialize(dms.get("hasNumberOfLeadingZeros"))
        result.numberOfLeadingZeros_ = Int64.deserialize(dms.get("numberOfLeadingZeros_"))
        result.hasRawInput = Bool.deserialize(dms.get("hasRawInput"))
        result.rawInput_ = String.deserialize(dms.get("rawInput_"))
        result.hasCountryCodeSource = Bool.deserialize(dms.get("hasCountryCodeSource"))
        result.hasPreferredDomesticCarrierCode = Bool.deserialize(dms.get("hasPreferredDomesticCarrierCode"))
        result.preferredDomesticCarrierCode_ = String.deserialize(dms.get("preferredDomesticCarrierCode_"))
        return result
    }

    public init() {
        countryCodeSource_ = CountryCodeSource.UNSPECIFIED
    }

    public func hasCountryCodes(): Bool {
        return hasCountryCode
    }

    public func getCountryCodes(): Int64 {
        return countryCode_
    }

    public func setCountryCodes(value: Int64): PhoneNumber {
        hasCountryCode = true
        countryCode_ = value
        return this
    }

    public func clearCountryCodes(): PhoneNumber {
        hasCountryCode = false
        countryCode_ = 0
        return this
    }

    public func hasNationalNumbers(): Bool {
        return hasNationalNumber
    }

    public func getNationalNumbers(): Int64 {
        return nationalNumber_
    }

    public func setNationalNumbers(value: Int64): PhoneNumber {
        hasNationalNumber = true
        nationalNumber_ = value
        return this
    }

    public func clearNationalNumbers(): PhoneNumber {
        hasNationalNumber = false
        nationalNumber_ = 0
        return this
    }

    public func hasExtensions(): Bool {
        return hasExtension
    }

    public func getExtensions(): String {
        return extension_
    }

    public func setExtensions(value: String): PhoneNumber {
        hasExtension = true
        extension_ = value
        return this
    }

    public func clearExtensions(): PhoneNumber {
        hasExtension = false
        extension_ = ""
        return this
    }

    public func hasItalianLeadingZeros(): Bool {
        return hasItalianLeadingZero
    }

    public func isItalianLeadingZeros(): Bool {
        return italianLeadingZero_
    }

    public func setItalianLeadingZeros(value: Bool): PhoneNumber {
        hasItalianLeadingZero = true
        italianLeadingZero_ = value
        return this
    }

    public func clearItalianLeadingZeros(): PhoneNumber {
        hasItalianLeadingZero = false
        italianLeadingZero_ = false
        return this
    }

    public func hasNumbersOfLeadingZeros(): Bool {
        return hasNumberOfLeadingZeros
    }

    public func getNumbersOfLeadingZeros(): Int64 {
        return numberOfLeadingZeros_
    }

    public func setNumberOfLeadingZeros(value: Int64): PhoneNumber {
        hasNumberOfLeadingZeros = true
        numberOfLeadingZeros_ = value
        return this
    }

    public func clearNumberOfLeadingZeros(): PhoneNumber {
        hasNumberOfLeadingZeros = false
        numberOfLeadingZeros_ = 1
        return this
    }

    public func hasRawInputs(): Bool {
        return hasRawInput
    }

    public func getRawInputs(): String {
        return rawInput_
    }

    public func setRawInputs(value: String): PhoneNumber {
        hasRawInput = true
        rawInput_ = value
        return this
    }

    public func clearRawInputs(): PhoneNumber {
        hasRawInput = false
        rawInput_ = ""
        return this
    }

    public func hasCountryCodeSources(): Bool {
        return hasCountryCodeSource
    }

    public func getCountryCodeSources(): CountryCodeSource {
        return countryCodeSource_
    }

    public func setCountryCodeSources(value: CountryCodeSource): PhoneNumber {
        hasCountryCodeSource = true
        countryCodeSource_ = value
        return this
    }

    public func clearCountryCodeSources(): PhoneNumber {
        hasCountryCodeSource = false
        countryCodeSource_ = CountryCodeSource.UNSPECIFIED
        return this
    }

    public func hasPreferredDomesticCarrierCodes(): Bool {
        return hasPreferredDomesticCarrierCode
    }

    public func getPreferredDomesticCarrierCodes(): String {
        return preferredDomesticCarrierCode_
    }

    public func setPreferredDomesticCarrierCodes(value: String): PhoneNumber {
        hasPreferredDomesticCarrierCode = true
        preferredDomesticCarrierCode_ = value
        return this
    }

    public func clearPreferredDomesticCarrierCodes(): PhoneNumber {
        hasPreferredDomesticCarrierCode = false
        preferredDomesticCarrierCode_ = ""
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
        return (countryCode_ == other.countryCode_
            && nationalNumber_ == other.nationalNumber_
            && extension_.equals(other.extension_)
            && italianLeadingZero_ == other.italianLeadingZero_
            && numberOfLeadingZeros_ == other.numberOfLeadingZeros_
            && rawInput_.equals(other.rawInput_)
            && countryCodeSource_ == other.countryCodeSource_
            && preferredDomesticCarrierCode_.equals(other.preferredDomesticCarrierCode_)
            && hasPreferredDomesticCarrierCodes() == other.hasPreferredDomesticCarrierCodes())
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
        outputString.append("Country Code: ").append(countryCode_);
        outputString.append(" National Number: ").append(nationalNumber_)
        if (hasItalianLeadingZeros() && isItalianLeadingZeros()) {
            outputString.append(" Leading Zero(s): true")
        }
        if (hasNumbersOfLeadingZeros()) {
            outputString.append(" Number of leading zeros: ").append(numberOfLeadingZeros_)
        }
        if (hasExtensions()) {
            outputString.append(" Extension: ").append(extension_)
        }
        if (hasCountryCodeSources()) {
            outputString.append(" Country Code Source: ").append(countryCodeSource_.toString())
        }
        if (hasPreferredDomesticCarrierCodes()) {
            outputString.append(" Preferred Domestic Carrier Code: ").append(preferredDomesticCarrierCode_)
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
