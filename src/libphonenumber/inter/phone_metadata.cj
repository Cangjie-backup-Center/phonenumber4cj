package libphonenumber.inter

from std import io.*
from std import convert.*

public open class PhonemetadataNumberFormat <: Equatable<PhonemetadataNumberFormat> {
    public init() {}

    public static func newBuilder(): NumberFormatBuilder {
        return NumberFormatBuilder()
    }

    private var hasPattern: Bool = false
    private var pattern_: String = ""
    public func hasPatternFunc(): Bool {
        return hasPattern
    }
    public func getPattern(): String {
        return pattern_
    }
    public func setPattern(value: String): PhonemetadataNumberFormat {
        hasPattern = true
        pattern_ = value
        return this
    }

    private var hasFormat: Bool = false
    private var format_: String = ""
    public func hasFormatFunc(): Bool {
        return hasFormat
    }
    public func getFormat(): String {
        return format_
    }
    public func setFormat(value: String): PhonemetadataNumberFormat {
        hasFormat = true
        format_ = value
        return this
    }

    private var leadingDigitsPattern_: ArrayList<String> = ArrayList<String>()
    public func leadingDigitPatterns(): ArrayList<String> {
        return leadingDigitsPattern_
    }
    public func leadingDigitsPatternSize(): Int32 {
        getLeadingDigitsPatternCount()
    }
    public func getLeadingDigitsPatternCount(): Int32 {
        return Int32(leadingDigitsPattern_.size)
    }
    public func getLeadingDigitsPattern(index: Int32): Option<String> {
        leadingDigitsPattern_.get(Int64(index))
    }
    public func addLeadingDigitsPattern(value: Option<String>): PhonemetadataNumberFormat {
        if (value == Option<String>.None) {
            throw IndexOutOfBoundsException()
        }
        leadingDigitsPattern_.append(value.getOrThrow())
        return this
    }

    private var hasNationalPrefixFormattingRule: Bool = false
    private var nationalPrefixFormattingRule_: String = ""
    public func hasNationalPrefixFormattingRuleFunc(): Bool {
        return hasNationalPrefixFormattingRule
    }
    public func getNationalPrefixFormattingRule(): String {
        return nationalPrefixFormattingRule_
    }
    public func setNationalPrefixFormattingRule(value: String): PhonemetadataNumberFormat {
        hasNationalPrefixFormattingRule = true
        nationalPrefixFormattingRule_ = value
        return this
    }
    public func clearNationalPrefixFormattingRule(): PhonemetadataNumberFormat {
        hasNationalPrefixFormattingRule = false
        nationalPrefixFormattingRule_ = ""
        return this
    }

    private var hasNationalPrefixOptionalWhenFormatting: Bool = false
    private var nationalPrefixOptionalWhenFormatting_: Bool = false
    public func hasNationalPrefixOptionalWhenFormattingFunc(): Bool {
        return hasNationalPrefixOptionalWhenFormatting
    }
    public func getNationalPrefixOptionalWhenFormatting(): Bool {
        return nationalPrefixOptionalWhenFormatting_
    }
    public func setNationalPrefixOptionalWhenFormatting(value: Bool): PhonemetadataNumberFormat {
        hasNationalPrefixOptionalWhenFormatting = true
        nationalPrefixOptionalWhenFormatting_ = value
        return this
    }

    private var hasDomesticCarrierCodeFormattingRule: Bool = false
    private var domesticCarrierCodeFormattingRule_: String = ""
    public func hasDomesticCarrierCodeFormattingRuleFunc(): Bool {
        return hasDomesticCarrierCodeFormattingRule
    }
    public func getDomesticCarrierCodeFormattingRule(): String {
        return domesticCarrierCodeFormattingRule_
    }
    public func setDomesticCarrierCodeFormattingRule(value: String): PhonemetadataNumberFormat {
        hasDomesticCarrierCodeFormattingRule = true
        domesticCarrierCodeFormattingRule_ = value
        return this
    }

    public func readExternal(objectInput: Iterator<String>): Unit {
        setPattern(objectInput.next().getOrThrow())
        setFormat(objectInput.next().getOrThrow())
        var leadingDigitsPatternSize: Int32 = Int32.parse(objectInput.next().getOrThrow())
        for (i in 0..leadingDigitsPatternSize) {
            leadingDigitsPattern_.append(objectInput.next().getOrThrow())
        }
        if (Bool.parse(objectInput.next().getOrThrow())) {
            setNationalPrefixFormattingRule(objectInput.next().getOrThrow())
        }
        if (Bool.parse(objectInput.next().getOrThrow())) {
            setDomesticCarrierCodeFormattingRule(objectInput.next().getOrThrow())
        }
        setNationalPrefixOptionalWhenFormatting(Bool.parse(objectInput.next().getOrThrow()))
    }

    public operator func ==(rhs: PhonemetadataNumberFormat): Bool {
        return refEq(this, rhs)
    }
    public operator func !=(rhs: PhonemetadataNumberFormat): Bool {
        return !refEq(this, rhs)
    }
}

public class NumberFormatBuilder <: PhonemetadataNumberFormat {
    var class_out: PhonemetadataNumberFormat
    public init(out: PhonemetadataNumberFormat) {
        class_out = out
    }
    public init() {
        class_out = PhonemetadataNumberFormat()
    }
    public func build(): PhonemetadataNumberFormat {
        return this
    }
    public func mergeFrom(other: PhonemetadataNumberFormat): NumberFormatBuilder {
        if (other.hasPatternFunc()) {
            setPattern(other.getPattern())
        }
        if (other.hasFormatFunc()) {
            setFormat(other.getFormat())
        }
        for (i in 0..other.leadingDigitsPatternSize()) {
            addLeadingDigitsPattern(other.getLeadingDigitsPattern(i))
        }
        if (other.hasNationalPrefixFormattingRuleFunc()) {
            setNationalPrefixFormattingRule(other.getNationalPrefixFormattingRule());
        }
        if (other.hasDomesticCarrierCodeFormattingRuleFunc()) {
            setDomesticCarrierCodeFormattingRule(other.getDomesticCarrierCodeFormattingRule());
        }
        if (other.hasNationalPrefixOptionalWhenFormattingFunc()) {
            setNationalPrefixOptionalWhenFormatting(other.getNationalPrefixOptionalWhenFormatting());
        }
        return this
    }
}

public open class PhonemetadataPhoneNumberDesc <: Equatable<PhonemetadataPhoneNumberDesc> {
    public init() {}
    public static func newBuilder(): PhoneNumberDescBuilder {
        return PhoneNumberDescBuilder()
    }

    private var hasNationalNumberPattern: Bool = false
    private var nationalNumberPattern_: String = ""
    public func hasNationalNumberPatternFunc(): Bool {
        return hasNationalNumberPattern
    }
    public func getNationalNumberPattern(): String {
        return nationalNumberPattern_
    }
    public func setNationalNumberPattern(value: String): PhonemetadataPhoneNumberDesc {
        hasNationalNumberPattern = true
        nationalNumberPattern_ = value
        return this
    }
    public func clearNationalNumberPattern(): PhonemetadataPhoneNumberDesc {
        hasNationalNumberPattern = false
        nationalNumberPattern_ = ""
        return this
    }

    private var possibleLength_: ArrayList<Int32> = ArrayList<Int32>()
    public func getPossibleLengthList(): ArrayList<Int32> {
        return possibleLength_
    }
    public func getPossibleLengthCount(): Int32 {
        return Int32(possibleLength_.size)
    }
    public func getPossibleLength(index: Int32): Option<Int32> {
        return possibleLength_.get(Int64(index))
    }
    public func addPossibleLength(value: Int32): PhonemetadataPhoneNumberDesc {
        possibleLength_.append(value)
        return this
    }
    public func clearPossibleLength(): PhonemetadataPhoneNumberDesc {
        possibleLength_.clear()
        return this
    }

    private var possibleLengthLocalOnly_: ArrayList<Int32> = ArrayList<Int32>()
    public func getPossibleLengthLocalOnlyList(): ArrayList<Int32> {
        return possibleLengthLocalOnly_
    }
    public func getPossibleLengthLocalOnlyCount(): Int32 {
        return Int32(possibleLengthLocalOnly_.size)
    }
    public func getPossibleLengthLocalOnly(index: Int32): Option<Int32> {
        return possibleLengthLocalOnly_.get(Int64(index))
    }
    public func addPossibleLengthLocalOnly(value: Int32): PhonemetadataPhoneNumberDesc {
        possibleLengthLocalOnly_.append(value)
        return this
    }
    public func clearPossibleLengthLocalOnly(): PhonemetadataPhoneNumberDesc {
        possibleLengthLocalOnly_.clear()
        return this
    }

    private var hasExampleNumber: Bool = false
    private var exampleNumber_: String = ""
    public func hasExampleNumberFunc(): Bool {
        return hasExampleNumber
    }
    public func getExampleNumber(): String {
        return exampleNumber_
    }
    public func setExampleNumber(value: String): PhonemetadataPhoneNumberDesc {
        hasExampleNumber = true
        exampleNumber_ = value
        return this
    }
    public func clearExampleNumber(): PhonemetadataPhoneNumberDesc {
        hasExampleNumber = false
        exampleNumber_ = ""
        return this
    }

    public func exactlySameAs(other: PhonemetadataPhoneNumberDesc): Bool {
        return nationalNumberPattern_ == (other.nationalNumberPattern_) && possibleLength_ == (other.possibleLength_) &&
            possibleLengthLocalOnly_ == (other.possibleLengthLocalOnly_) && exampleNumber_ == (other.exampleNumber_)
    }

    public func readExternal(objectInput: Iterator<String>): Unit {
        if (Bool.parse(objectInput.next().getOrThrow())) {
            setNationalNumberPattern(objectInput.next().getOrThrow())
        }
        var possibleLengthSize: Int64 = Int64.parse(objectInput.next().getOrThrow())
        for (i in 0..possibleLengthSize) {
            possibleLength_.append(Int32.parse(objectInput.next().getOrThrow()))
        }
        var possibleLengthLocalOnlySize: Int32 = Int32.parse(objectInput.next().getOrThrow())
        for (i in 0..possibleLengthLocalOnlySize) {
            possibleLengthLocalOnly_.append(Int32.parse(objectInput.next().getOrThrow()))
        }
        if (Bool.parse(objectInput.next().getOrThrow())) {
            setExampleNumber(objectInput.next().getOrThrow())
        }
    }

    public operator func ==(rhs: PhonemetadataPhoneNumberDesc): Bool {
        return refEq(this, rhs)
    }

    public operator func !=(rhs: PhonemetadataPhoneNumberDesc): Bool {
        return !refEq(this, rhs)
    }
}

public class PhoneNumberDescBuilder <: PhonemetadataPhoneNumberDesc {
    var class_out: PhonemetadataPhoneNumberDesc
    public init(out: PhonemetadataPhoneNumberDesc) {
        class_out = out
    }
    public init() {
        class_out = PhonemetadataPhoneNumberDesc()
    }
    public func build(): PhonemetadataPhoneNumberDesc {
        return this
    }

    public func mergeFrom(other: PhonemetadataPhoneNumberDesc): PhoneNumberDescBuilder {
        if (other.hasNationalNumberPatternFunc()) {
            setNationalNumberPattern(other.getNationalNumberPattern())
        }
        for (i in 0..other.getPossibleLengthCount()) {
            addPossibleLength(other.getPossibleLength(i).getOrThrow())
        }
        for (i in 0..other.getPossibleLengthLocalOnlyCount()) {
            addPossibleLengthLocalOnly(other.getPossibleLengthLocalOnly(i).getOrThrow())
        }
        if (other.hasExampleNumberFunc()) {
            setExampleNumber(other.getExampleNumber())
        }
        return this
    }
}

public open class PhonemetadataPhoneMetadata <: Equatable<PhonemetadataPhoneMetadata> {
    public init() {}
    public static func newBuilder(): PhoneMetadataBuilder {
        return PhoneMetadataBuilder()
    }

    private var hasGeneralDesc: Bool = false
    private var generalDesc_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasGeneralDescFunc(): Bool {
        return hasGeneralDesc
    }
    public func getGeneralDesc(): Option<PhonemetadataPhoneNumberDesc> {
        return generalDesc_
    }
    public func getGeneralDescBuilder(): PhonemetadataPhoneNumberDesc {
        if (generalDesc_ == Option<PhonemetadataPhoneNumberDesc>.None) {
            generalDesc_ = Option<PhonemetadataPhoneNumberDesc>.Some(PhonemetadataPhoneNumberDesc())
        }
        return generalDesc_.getOrThrow()
    }
    public func setGeneralDesc(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasGeneralDesc = true
        generalDesc_ = value.getOrThrow()
        return this
    }

    private var hasFixedLine: Bool = false
    private var fixedLine_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasFixedLineFunc(): Bool {
        return hasFixedLine
    }
    public func getFixedLine(): Option<PhonemetadataPhoneNumberDesc> {
        return fixedLine_
    }
    public func setFixedLine(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasFixedLine = true
        fixedLine_ = value
        return this
    }

    private var hasMobile: Bool = false
    private var mobile_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasMobileFunc(): Bool {
        return hasMobile
    }
    public func getMobile(): Option<PhonemetadataPhoneNumberDesc> {
        return mobile_
    }
    public func setMobile(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasMobile = true
        mobile_ = value
        return this
    }

    private var hasTollFree: Bool = false
    private var tollFree_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasTollFreeFunc(): Bool {
        return hasTollFree
    }
    public func getTollFree(): Option<PhonemetadataPhoneNumberDesc> {
        return tollFree_
    }
    public func setTollFree(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasTollFree = true
        tollFree_ = value
        return this
    }

    private var hasPremiumRate: Bool = false
    private var premiumRate_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasPremiumRateFunc(): Bool {
        return hasPremiumRate
    }
    public func getPremiumRate(): Option<PhonemetadataPhoneNumberDesc> {
        return premiumRate_
    }
    public func setPremiumRate(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasPremiumRate = true
        premiumRate_ = value
        return this
    }

    private var hasSharedCost: Bool = false
    private var sharedCost_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasSharedCostFunc(): Bool {
        return hasSharedCost
    }
    public func getSharedCost(): Option<PhonemetadataPhoneNumberDesc> {
        return sharedCost_
    }
    public func setSharedCost(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasSharedCost = true
        sharedCost_ = value
        return this
    }

    private var hasPersonalNumber: Bool = false
    private var personalNumber_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasPersonalNumberFunc(): Bool {
        return hasPersonalNumber
    }
    public func getPersonalNumber(): Option<PhonemetadataPhoneNumberDesc> {
        return personalNumber_
    }
    public func setPersonalNumber(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasPersonalNumber = true
        personalNumber_ = value
        return this
    }

    private var hasVoip: Bool = false
    private var voip_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasVoipFunc(): Bool {
        return hasVoip
    }
    public func getVoip(): Option<PhonemetadataPhoneNumberDesc> {
        return voip_
    }
    public func setVoip(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasVoip = true
        voip_ = value
        return this
    }

    private var hasPager: Bool = false
    private var pager_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasPagerFunc(): Bool {
        return hasPager
    }
    public func getPager(): Option<PhonemetadataPhoneNumberDesc> {
        return pager_
    }
    public func setPager(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasPager = true
        pager_ = value
        return this
    }

    private var hasUan: Bool = false
    private var uan_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasUanFunc(): Bool {
        return hasUan
    }
    public func getUan(): Option<PhonemetadataPhoneNumberDesc> {
        return uan_
    }
    public func setUan(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasUan = true
        uan_ = value
        return this
    }

    private var hasEmergency: Bool = false
    private var emergency_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasEmergencyFunc(): Bool {
        return hasEmergency
    }
    public func getEmergency(): Option<PhonemetadataPhoneNumberDesc> {
        return emergency_
    }
    public func setEmergency(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasEmergency = true
        emergency_ = value
        return this
    }

    private var hasVoicemail: Bool = false
    private var voicemail_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasVoicemailFunc(): Bool {
        return hasVoicemail
    }
    public func getVoicemail(): Option<PhonemetadataPhoneNumberDesc> {
        return voicemail_
    }
    public func setVoicemail(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasVoicemail = true
        voicemail_ = value
        return this
    }

    private var hasShortCode: Bool = false
    private var shortCode_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasShortCodeFunc(): Bool {
        return hasShortCode
    }
    public func getShortCode(): Option<PhonemetadataPhoneNumberDesc> {
        return shortCode_
    }
    public func setShortCode(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasShortCode = true
        shortCode_ = value
        return this
    }

    private var hasStandardRate: Bool = false
    private var standardRate_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasStandardRateFunc(): Bool {
        return hasStandardRate
    }
    public func getStandardRate(): Option<PhonemetadataPhoneNumberDesc> {
        return standardRate_
    }
    public func setStandardRate(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasStandardRate = true
        standardRate_ = value
        return this
    }

    private var hasCarrierSpecific: Bool = false
    private var carrierSpecific_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasCarrierSpecificFunc(): Bool {
        return hasCarrierSpecific
    }
    public func getCarrierSpecific(): Option<PhonemetadataPhoneNumberDesc> {
        return carrierSpecific_
    }
    public func setCarrierSpecific(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasCarrierSpecific = true
        carrierSpecific_ = value
        return this
    }

    private var hasSmsServices: Bool = false
    private var smsServices_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.None
    public func hasSmsServicesFunc(): Bool {
        return hasSmsServices
    }
    public func getSmsServices(): Option<PhonemetadataPhoneNumberDesc> {
        return smsServices_
    }
    public func setSmsServices(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasSmsServices = true
        smsServices_ = value
        return this
    }

    private var hasNoInternationalDialling: Bool = false
    private var noInternationalDialling_: Option<PhonemetadataPhoneNumberDesc> = Option<PhonemetadataPhoneNumberDesc>.
    None
    public func hasNoInternationalDiallingFunc(): Bool {
        return hasNoInternationalDialling
    }
    public func getNoInternationalDialling(): Option<PhonemetadataPhoneNumberDesc> {
        return noInternationalDialling_
    }
    public func setNoInternationalDialling(value: Option<PhonemetadataPhoneNumberDesc>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataPhoneNumberDesc>.None) {
            throw IllegalArgumentException()
        }
        hasNoInternationalDialling = true
        noInternationalDialling_ = value
        return this
    }

    private var hasId: Bool = false
    private var id_: String = ""
    public func hasIdFunc(): Bool {
        return hasId
    }
    public func getId(): String {
        return id_
    }
    public open func setId(value: String): PhonemetadataPhoneMetadata {
        hasId = true
        id_ = value
        return this
    }

    private var hasCountryCode: Bool = false
    private var countryCode_: Int32 = 0
    public func hasCountryCodeFunc(): Bool {
        return hasCountryCode
    }
    public func getCountryCode(): Int32 {
        return countryCode_
    }
    public func setCountryCode(value: Int32): PhonemetadataPhoneMetadata {
        hasCountryCode = true
        countryCode_ = value
        return this
    }

    private var hasInternationalPrefix: Bool = false
    private var internationalPrefix_: String = ""
    public func hasInternationalPrefixFunc(): Bool {
        return hasInternationalPrefix
    }
    public func getInternationalPrefix(): String {
        return internationalPrefix_
    }
    public open func setInternationalPrefix(value: String): PhonemetadataPhoneMetadata {
        hasInternationalPrefix = true
        internationalPrefix_ = value
        return this
    }

    private var hasPreferredInternationalPrefix: Bool = false
    private var preferredInternationalPrefix_: String = ""
    public func hasPreferredInternationalPrefixFunc(): Bool {
        return hasPreferredInternationalPrefix
    }
    public func getPreferredInternationalPrefix(): String {
        return preferredInternationalPrefix_
    }
    public func setPreferredInternationalPrefix(value: String): PhonemetadataPhoneMetadata {
        hasPreferredInternationalPrefix = true
        preferredInternationalPrefix_ = value
        return this
    }
    public func clearPreferredInternationalPrefix(): PhonemetadataPhoneMetadata {
        hasPreferredInternationalPrefix = false
        preferredInternationalPrefix_ = ""
        return this
    }

    private var hasNationalPrefix: Bool = false
    private var nationalPrefix_: String = ""
    public func hasNationalPrefixFunc(): Bool {
        return hasNationalPrefix
    }
    public func getNationalPrefix(): String {
        return nationalPrefix_
    }
    public func setNationalPrefix(value: String): PhonemetadataPhoneMetadata {
        hasNationalPrefix = true
        nationalPrefix_ = value
        return this
    }
    public func clearNationalPrefix(): PhonemetadataPhoneMetadata {
        hasNationalPrefix = false
        nationalPrefix_ = ""
        return this
    }

    private var hasPreferredExtnPrefix: Bool = false
    private var preferredExtnPrefix_: String = ""
    public func hasPreferredExtnPrefixFunc(): Bool {
        return hasPreferredExtnPrefix
    }
    public func getPreferredExtnPrefix(): String {
        return preferredExtnPrefix_
    }
    public func setPreferredExtnPrefix(value: String): PhonemetadataPhoneMetadata {
        hasPreferredExtnPrefix = true
        preferredExtnPrefix_ = value
        return this
    }
    public func clearPreferredExtnPrefix(): PhonemetadataPhoneMetadata {
        hasPreferredExtnPrefix = false
        preferredExtnPrefix_ = ""
        return this
    }

    private var hasNationalPrefixForParsing: Bool = false
    private var nationalPrefixForParsing_: String = ""
    public func hasNationalPrefixForParsingFunc(): Bool {
        return hasNationalPrefixForParsing
    }
    public func getNationalPrefixForParsing(): String {
        return nationalPrefixForParsing_
    }

    public func setNationalPrefixForParsing(value: String): PhonemetadataPhoneMetadata {
        hasNationalPrefixForParsing = true
        nationalPrefixForParsing_ = value
        return this
    }

    private var hasNationalPrefixTransformRule: Bool = false
    private var nationalPrefixTransformRule_: String = ""
    public func hasNationalPrefixTransformRuleFunc(): Bool {
        return hasNationalPrefixTransformRule
    }
    public func getNationalPrefixTransformRule(): String {
        return nationalPrefixTransformRule_
    }
    public func setNationalPrefixTransformRule(value: String): PhonemetadataPhoneMetadata {
        hasNationalPrefixTransformRule = true
        nationalPrefixTransformRule_ = value
        return this
    }
    public func clearNationalPrefixTransformRule(): PhonemetadataPhoneMetadata {
        hasNationalPrefixTransformRule = false
        nationalPrefixTransformRule_ = ""
        return this
    }

    private var hasSameMobileAndFixedLinePattern: Bool = false
    private var sameMobileAndFixedLinePattern_: Bool = false
    public func hasSameMobileAndFixedLinePatternFunc(): Bool {
        return hasSameMobileAndFixedLinePattern
    }
    public func getSameMobileAndFixedLinePattern(): Bool {
        return sameMobileAndFixedLinePattern_
    }
    public func setSameMobileAndFixedLinePattern(value: Bool): PhonemetadataPhoneMetadata {
        hasSameMobileAndFixedLinePattern = true
        sameMobileAndFixedLinePattern_ = value
        return this
    }
    public func clearSameMobileAndFixedLinePattern(): PhonemetadataPhoneMetadata {
        hasSameMobileAndFixedLinePattern = false
        sameMobileAndFixedLinePattern_ = false
        return this
    }

    private var numberFormat_: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    public func numberFormats(): ArrayList<PhonemetadataNumberFormat> {
        return getNumberFormatList()
    }

    public func getNumberFormatList(): ArrayList<PhonemetadataNumberFormat> {
        return numberFormat_
    }
    public func numberFormatSize(): Int32 {
        return getNumberFormatCount()
    }
    public func getNumberFormatCount(): Int32 {
        return Int32(numberFormat_.size)
    }
    public func getNumberFormat(index: Int32): Option<PhonemetadataNumberFormat> {
        return numberFormat_.get(Int64(index))
    }
    public func addNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataNumberFormat>.None) {
            throw IllegalArgumentException()
        }
        numberFormat_.append(value.getOrThrow());
        return this
    }

    private var intlNumberFormat_: ArrayList<PhonemetadataNumberFormat> = ArrayList<PhonemetadataNumberFormat>()
    public func intlNumberFormats(): ArrayList<PhonemetadataNumberFormat> {
        return getIntlNumberFormatList()
    }
    public func getIntlNumberFormatList(): ArrayList<PhonemetadataNumberFormat> {
        return intlNumberFormat_
    }
    public func intlNumberFormatSize(): Int32 {
        return getIntlNumberFormatCount()
    }
    public func getIntlNumberFormatCount(): Int32 {
        return Int32(intlNumberFormat_.size)
    }
    public func getIntlNumberFormat(index: Int32): Option<PhonemetadataNumberFormat> {
        return intlNumberFormat_.get(Int64(index))
    }
    public func addIntlNumberFormat(value: Option<PhonemetadataNumberFormat>): PhonemetadataPhoneMetadata {
        if (value == Option<PhonemetadataNumberFormat>.None) {
            throw IllegalArgumentException()
        }
        intlNumberFormat_.append(value.getOrThrow())
        return this
    }
    public func clearIntlNumberFormat(): PhonemetadataPhoneMetadata {
        intlNumberFormat_.clear()
        return this
    }

    private var hasMainCountryForCode: Bool = false
    private var mainCountryForCode_: Bool = false
    public func hasMainCountryForCodeFunc(): Bool {
        return hasMainCountryForCode
    }
    public func isMainCountryForCode(): Bool {
        return mainCountryForCode_
    }
    public func getMainCountryForCode(): Bool {
        return mainCountryForCode_
    }
    public func setMainCountryForCode(value: Bool): PhonemetadataPhoneMetadata {
        hasMainCountryForCode = true
        mainCountryForCode_ = value
        return this
    }
    public func clearMainCountryForCode(): PhonemetadataPhoneMetadata {
        hasMainCountryForCode = false
        mainCountryForCode_ = false
        return this
    }

    private var hasLeadingDigits: Bool = false
    private var leadingDigits_: String = ""
    public func hasLeadingDigitsFunc(): Bool {
        return hasLeadingDigits
    }
    public func getLeadingDigits(): String {
        return leadingDigits_
    }
    public func setLeadingDigits(value: String): PhonemetadataPhoneMetadata {
        hasLeadingDigits = true
        leadingDigits_ = value
        return this
    }

    private var hasLeadingZeroPossible: Bool = false
    private var leadingZeroPossible_: Bool = false
    public func hasLeadingZeroPossibleFunc(): Bool {
        return hasLeadingZeroPossible
    }
    public func isLeadingZeroPossible(): Bool {
        return leadingZeroPossible_
    }
    public func setLeadingZeroPossible(value: Bool): PhonemetadataPhoneMetadata {
        hasLeadingZeroPossible = true
        leadingZeroPossible_ = value
        return this
    }

    public func clearLeadingZeroPossible(): PhonemetadataPhoneMetadata {
        hasLeadingZeroPossible = false
        leadingZeroPossible_ = false
        return this
    }

    private var hasMobileNumberPortableRegion: Bool = false
    private var mobileNumberPortableRegion_: Bool = false
    public func hasMobileNumberPortableRegionFunc(): Bool {
        return hasMobileNumberPortableRegion
    }
    public func isMobileNumberPortableRegion(): Bool {
        return getMobileNumberPortableRegion()
    }
    public func getMobileNumberPortableRegion(): Bool {
        return mobileNumberPortableRegion_
    }
    public func setMobileNumberPortableRegion(value: Bool): PhonemetadataPhoneMetadata {
        hasMobileNumberPortableRegion = true
        mobileNumberPortableRegion_ = value
        return this
    }
    public func clearMobileNumberPortableRegion(): PhonemetadataPhoneMetadata {
        hasMobileNumberPortableRegion = false
        mobileNumberPortableRegion_ = false
        return this
    }

    public func readExternal(objectInput: Iterator<String>): Unit {
        var hasDesc: Bool = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setGeneralDesc(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setFixedLine(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setMobile(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setTollFree(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setPremiumRate(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setSharedCost(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setPersonalNumber(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setVoip(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setPager(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setUan(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setEmergency(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setVoicemail(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setShortCode(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setStandardRate(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setCarrierSpecific(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setSmsServices(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        hasDesc = Bool.parse(objectInput.next().getOrThrow())
        if (hasDesc) {
            var desc: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc()
            desc.readExternal(objectInput)
            setNoInternationalDialling(Option<PhonemetadataPhoneNumberDesc>.Some(desc))
        }
        setId(objectInput.next().getOrThrow())
        setCountryCode(Int32.parse(objectInput.next().getOrThrow()))
        setInternationalPrefix(objectInput.next().getOrThrow())

        var hasString: Bool = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setPreferredInternationalPrefix(objectInput.next().getOrThrow())
        }
        hasString = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setNationalPrefix(objectInput.next().getOrThrow())
        }
        hasString = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setPreferredExtnPrefix(objectInput.next().getOrThrow())
        }
        hasString = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setNationalPrefixForParsing(objectInput.next().getOrThrow())
        }
        hasString = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setNationalPrefixTransformRule(objectInput.next().getOrThrow())
        }
        setSameMobileAndFixedLinePattern(Bool.parse(objectInput.next().getOrThrow()))

        var nationalFormatSize: Int32 = Int32.parse(objectInput.next().getOrThrow())
        for (i in 0..Int64(nationalFormatSize)) {
            var numFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
            numFormat.readExternal(objectInput)
            numberFormat_.append(numFormat)
        }

        var intlNumberFormatSize: Int32 = Int32.parse(objectInput.next().getOrThrow())
        for (i in 0..Int64(intlNumberFormatSize)) {
            var numFormat: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
            numFormat.readExternal(objectInput)
            intlNumberFormat_.append(numFormat)
        }

        setMainCountryForCode(Bool.parse(objectInput.next().getOrThrow()))
        hasString = Bool.parse(objectInput.next().getOrThrow())
        if (hasString) {
            setLeadingDigits(objectInput.next().getOrThrow())
        }
        setLeadingZeroPossible(Bool.parse(objectInput.next().getOrThrow()))
        setMobileNumberPortableRegion(Bool.parse(objectInput.next().getOrThrow()))
    }

    public operator func ==(rhs: PhonemetadataPhoneMetadata): Bool {
        return refEq(this, rhs)
    }
    public operator func !=(rhs: PhonemetadataPhoneMetadata): Bool {
        return !refEq(this, rhs)
    }
}

public class PhoneMetadataBuilder <: PhonemetadataPhoneMetadata {
    var class_out: PhonemetadataPhoneMetadata
    public init(out: PhonemetadataPhoneMetadata) {
        class_out = out
    }
    public init() {
        class_out = PhonemetadataPhoneMetadata()
    }
    public func build(): PhonemetadataPhoneMetadata {
        return this
    }
    public func setId(value: String): PhoneMetadataBuilder {
        super.setId(value)
        return this
    }
    public func setInternationalPrefix(value: String): PhoneMetadataBuilder {
        super.setInternationalPrefix(value);
        return this
    }
}

public open class PhonemetadataPhoneMetadataCollection {
    public init() {}
    public static func newBuilder(): PhoneMetadataBuilder {
        return PhoneMetadataBuilder()
    }

    private var metadata_: ArrayList<PhonemetadataPhoneMetadata> = ArrayList<PhonemetadataPhoneMetadata>()
    public func getMetadataList(): ArrayList<PhonemetadataPhoneMetadata> {
        return metadata_
    }
    public func getMetadataCount(): Int32 {
        return Int32(metadata_.size)
    }

    public func addMetadata(value: Option<PhonemetadataPhoneMetadata>): PhonemetadataPhoneMetadataCollection {
        if (value == Option<PhonemetadataPhoneMetadata>.None) {
            throw IllegalArgumentException()
        }
        metadata_.append(value.getOrThrow())
        return this
    }

    public func readExternal(objectInput: ArrayList<String>): Unit {
        var data: Iterator<String> = objectInput.iterator()
        var size: Int32 = Int32.parse(data.next().getOrThrow())
        for (i in 0..Int64(size)) {
            var metadata: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata()
            metadata.readExternal(data)
            metadata_.append(metadata)
        }
    }

    public func clear(): PhonemetadataPhoneMetadataCollection {
        metadata_.clear();
        return this
    }
}

public class PhoneMetadataCollectionBuilder <: PhonemetadataPhoneMetadataCollection {
    var class_out: PhonemetadataPhoneMetadataCollection
    public init(out: PhonemetadataPhoneMetadataCollection) {
        class_out = out
    }
    public init() {
        class_out = PhonemetadataPhoneMetadataCollection()
    }
    public func build(): PhonemetadataPhoneMetadataCollection {
        return class_out
    }
}
