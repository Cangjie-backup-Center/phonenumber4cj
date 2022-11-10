package libphonenumber

from std import io.*
from std import collection.*
from std import regex.*
from std import sync.*
from std import log.*
import libphonenumber.internal.*
import libphonenumber.metadata.*
import libphonenumber.inter.*

public open class PhoneNumberUtil {

    private static let lock = ReentrantMutex()

    static let REGEX_FLAGS: Int32 = 0x40 | 0x02

    private static let MIN_LENGTH_FOR_NSN: Int32 = 2

    static let MAX_LENGTH_FOR_NSN: Int32 = 17

    static let MAX_LENGTH_COUNTRY_CODE: Int32 = 3

    private static let MAX_INPUT_STRING_LENGTH: Int32 = 250

    private static let UNKNOWN_REGION: String = "ZZ"

    private static let NANPA_COUNTRY_CODE: Int32 = 1

    private static let COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX: String = "3"

    private static let MOBILE_TOKEN_MAPPINGS: HashMap<Int32, String> = HashMap<Int32, String>([(54, "9")])

    private static let GEO_MOBILE_COUNTRIES_WITHOUT_MOBILE_AREA_CODES: HashSet<Int32> = HashSet<Int32>([86])

    private static let GEO_MOBILE_COUNTRIES: HashSet<Int32> = HashSet<Int32>([52, 54, 55, 62])

    static let PLUS_SIGN: Char = '+'

    private static let STAR_SIGN: Char = '*'

    private static let RFC3966_EXTN_PREFIX: String = ";ext="
    private static let RFC3966_PREFIX: String = "tel:"
    private static let RFC3966_PHONE_CONTEXT: String = ";phone-context="
    private static let RFC3966_ISDN_SUBADDRESS: String = ";isub="

    private static let DIALLABLE_CHAR_MAPPINGS: HashMap<Char, Char> = HashMap<Char, Char>(
        [('#', '#'), ('*', '*'), ('+', '+'), ('0', '0'), ('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'),
        ('6', '6'), ('7', '7'), ('8', '8'), ('9', '9')])

    private static let ALPHA_MAPPINGS: HashMap<Char, Char> = HashMap<Char, Char>(
        [('A', '2'), ('B', '2'), ('C', '2'), ('D', '3'), ('E', '3'), ('F', '3'), ('G', '4'), ('H', '4'), ('I', '4'),
        ('J', '5'), ('K', '5'), ('L', '5'), ('M', '6'), ('N', '6'), ('O', '6'), ('P', '7'), ('Q', '7'), ('R', '7'),
        ('S', '7'), ('T', '8'), ('U', '8'), ('V', '8'), ('W', '9'), ('X', '9'), ('Y', '9'), ('Z', '9')])

    private static let ALPHA_PHONE_MAPPINGS: HashMap<Char, Char> = HashMap<Char, Char>(
        [('0', '0'), ('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'), ('6', '6'), ('7', '7'), ('8', '8'),
        ('9', '9'), ('A', '2'), ('B', '2'), ('C', '2'), ('D', '3'), ('E', '3'), ('F', '3'), ('G', '4'), ('H', '4'),
        ('I', '4'), ('J', '5'), ('K', '5'), ('L', '5'), ('M', '6'), ('N', '6'), ('O', '6'), ('P', '7'), ('Q', '7'),
        ('R', '7'), ('S', '7'), ('T', '8'), ('U', '8'), ('V', '8'), ('W', '9'), ('X', '9'), ('Y', '9'), ('Z', '9')])

    private static let ALL_PLUS_NUMBER_GROUPING_SYMBOLS: HashMap<Char, Char> = HashMap<Char, Char>(
        [('0', '0'), ('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'), ('6', '6'), ('7', '7'), ('8', '8'),
        ('9', '9'), ('A', 'A'), ('B', 'B'), ('C', 'C'), ('D', 'D'), ('E', 'E'), ('F', 'F'), ('G', 'G'), ('H', 'H'),
        ('I', 'I'), ('J', 'J'), ('K', 'K'), ('L', 'L'), ('M', 'M'), ('N', 'N'), ('O', 'O'), ('P', 'P'), ('Q', 'Q'),
        ('R', 'R'), ('S', 'S'), ('T', 'T'), ('U', 'U'), ('V', 'V'), ('W', 'W'), ('X', 'X'), ('Y', 'Y'), ('Z', 'Z'),
        ('a', 'A'), ('b', 'B'), ('c', 'C'), ('d', 'D'), ('e', 'E'), ('f', 'F'), ('g', 'G'), ('h', 'H'), ('i', 'I'),
        ('j', 'J'), ('k', 'K'), ('l', 'L'), ('m', 'M'), ('n', 'N'), ('o', 'O'), ('p', 'P'), ('q', 'Q'), ('r', 'R'),
        ('s', 'S'), ('t', 'T'), ('u', 'U'), ('v', 'V'), ('w', 'W'), ('x', 'X'), ('y', 'Y'), ('z', 'Z'), ('-', '-'),
        ('\u{FF0D}', '-'), ('\u{2010}', '-'), ('\u{2011}', '-'), ('\u{2012}', '-'), ('\u{2013}', '-'), ('\u{2014}', '-'),
        ('\u{2015}', '-'), ('\u{2212}', '-'), ('/', '/'), ('\u{FF0F}', '/'), (' ', ' '), ('\u{3000}', ' '),
        ('\u{2060}', ' '), ('.', '.'), ('\u{FF0E}', '.')])

    private static let SINGLE_INTERNATIONAL_PREFIX: Regex = Regex("[\\d]+(?:[~\u{2053}\u{223C}\u{FF5E}][\\d]+)?")

    static let VALID_PUNCTUATION: String = 
        "-x\u{2010}-\u{2015}\u{2212}\u{30FC}\u{FF0D}-\u{FF0F}\u{00A0}\u{00AD}\u{200B}\u{2060}\u{3000}()\u{FF08}\u{FF09}\u{FF3B}\u{FF3D}.\\[\\]/~\u{2053}\u{223C}\u{FF5E}"

    private static let DIGITS: String = "\\p{Nd}"

    private static let VALID_ALPHA: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    static let PLUS_CHARS: String = "+\u{FF0B}"

    static let PLUS_CHARS_PATTERN: Regex = Regex("[${PLUS_CHARS}]+")

    private static let SEPARATOR_PATTERN: Regex = Regex("[${VALID_PUNCTUATION}]+")

    private static let CAPTURING_DIGIT_PATTERN: Regex = Regex("(${DIGITS})")

    private static let VALID_START_CHAR: String = "[${PLUS_CHARS}${PLUS_CHARS}]"

    private static let VALID_START_CHAR_PATTERN: Regex = Regex("${VALID_START_CHAR}")

    private static let SECOND_NUMBER_START: String = "[\\\\/] *x"

    static let SECOND_NUMBER_START_PATTERN: Regex = Regex("${SECOND_NUMBER_START}")

    private static let UNWANTED_END_CHARS: String = "[[\\P{N}&&\\P{L}]&&[^#]]+$"

    static let UNWANTED_END_CHAR_PATTERN: Regex = Regex("${UNWANTED_END_CHARS}")

    private static let VALID_ALPHA_PHONE_PATTERN: Regex = Regex("(?:.*?[A-Za-z]){3}.*")

    private static let VALID_PHONE_NUMBER: String = 
        "${DIGITS}{${MIN_LENGTH_FOR_NSN}}|[${PLUS_CHARS}]*+(?:[${VALID_PUNCTUATION}${STAR_SIGN}]*${DIGITS}){3,}[${VALID_PUNCTUATION}${STAR_SIGN}${VALID_ALPHA}${DIGITS}]*"

    private static let DEFAULT_EXTN_PREFIX: String = " ext. "

    private static let EXTN_PATTERNS_FOR_PARSING: String = createExtnPattern(true)

    static let EXTN_PATTERNS_FOR_MATCHING: String = createExtnPattern(false)

    private static func extnDigits(maxLength: Int32): String {
        return ""
    }

    private static func createExtnPattern(forParsing: Bool): String {
        return ""
    }

    private static let EXTN_PATTERN: Regex = Regex("(?:${EXTN_PATTERNS_FOR_PARSING})$", RegexOption().ignoreCase())

    private static let VALID_PHONE_NUMBER_PATTERN: Regex = Regex(
        "${VALID_PHONE_NUMBER}(?:${EXTN_PATTERNS_FOR_PARSING})?", RegexOption().ignoreCase())

    static let NON_DIGITS_PATTERN: Regex = Regex("(\\D+)")

    private static let FIRST_GROUP_PATTERN: Regex = Regex("(\\$\\d)")

    private static let NP_STRING: String = "$NP"
    private static let FG_STRING: String = "$FG"
    private static let CC_STRING: String = "$CC"

    private static let FIRST_GROUP_ONLY_PREFIX_PATTERN: Regex = Regex("\\(?\\$1\\)?")

    private static var instance: Option<PhoneNumberUtil> = Option<PhoneNumberUtil>.None

    public static let REGION_CODE_FOR_NON_GEO_ENTITY: String = "001"

    private let metadataSource: MetadataSource
    private let countryCallingCodeToRegionCodeMap: HashMap<Int32, ArrayList<String>>
    private let matcherApi: MatcherApi = RegexBasedMatcher.create()
    private let nanpaRegions: HashSet<String> = HashSet<String>(35)
    private let regexCache: RegexCache = RegexCache(100)
    private let supportedRegions: HashSet<String> = HashSet<String>(320)
    private let countryCodesForNonGeographicalRegion: HashSet<Int32> = HashSet<Int32>()
    private var logger: SimpleLogger = SimpleLogger()

    init(metadataSource: MetadataSource, countryCallingCodeToRegionCodeMap: HashMap<Int32, ArrayList<String>>) {
        this.metadataSource = metadataSource
        this.countryCallingCodeToRegionCodeMap = countryCallingCodeToRegionCodeMap
        for ((k, v) in countryCallingCodeToRegionCodeMap) {
            var regionCodes: ArrayList<String> = v
            if (regionCodes.size == 1 && REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCodes.get(0).getOrThrow())) {
                countryCodesForNonGeographicalRegion.put(k)
            } else {
                supportedRegions.putAll(regionCodes)
            }
        }
        if (supportedRegions.remove(REGION_CODE_FOR_NON_GEO_ENTITY)) {
            logger.log(LogLevel.WARN, "invalid metadata (country calling code was mapped to the non-geo "
          + "entity as well as specific region(s))")
        }
        nanpaRegions.putAll(countryCallingCodeToRegionCodeMap.get(NANPA_COUNTRY_CODE).getOrThrow())
    }

    static func extractPossibleNumber(number: String): String {
        return ""
    }

    static func isViablePhoneNumber(number: String): Bool {
        return true
    }

    static func normalize(number: StringBuilder): StringBuilder {
        return StringBuilder()
    }

    public static func normalizeDigitsOnly(number: String): String {
        return ""
    }

    static func normalizeDigits(number: String, keepNonDigits: Bool): StringBuilder {
        return StringBuilder()
    }

    public static func normalizeDiallableCharsOnly(number: String): String {
        return ""
    }

    public static func convertAlphaCharactersInNumber(number: String): String {
        return ""
    }

    public open func getLengthOfGeographicalAreaCode(number: PhoneNumber): Int32 {
        return 0
    }

    public open func getLengthOfNationalDestinationCode(number: PhoneNumber): Int32 {
        return 0
    }

    public static func getCountryMobileToken(countryCallingCode: Int32): String {
        return ""
    }

    private static func normalizeHelper(number: String, normalizationReplacements: HashMap<Char, Char>, 
        removeNonMatches: Bool): String {
        return ""
    }

    static func setInstance(util: PhoneNumberUtil): Unit {
        synchronized(lock) {
            instance = util
        }
    }

    public open func getSupportedRegions(): HashSet<String> {
        return HashSet<String>()
    }

    public open func getSupportedGlobalNetworkCallingCodes(): HashSet<Int32> {
        return HashSet<Int32>()
    }

    public open func getSupportedCallingCodes(): HashSet<Int32> {
        return HashSet<Int32>()
    }

    private static func descHasPossibleNumberData(desc: PhonemetadataPhoneNumberDesc): Bool {
        return true
    }

    private static func descHasData(desc: PhonemetadataPhoneNumberDesc): Bool {
        return true
    }

    private func getSupportedTypesForMetadata(metadata: PhonemetadataPhoneMetadata): HashSet<PhoneNumberType> {
        return HashSet<PhoneNumberType>()
    }

    public open func getSupportedTypesForRegion(regionCode: String): HashSet<PhoneNumberType> {
        return HashSet<PhoneNumberType>()
    }

    public open func getSupportedTypesForNonGeoEntity(countryCallingCode: Int32): HashSet<PhoneNumberType> {
        return HashSet<PhoneNumberType>()
    }

    public static func getInstance(): Option<PhoneNumberUtil> {
        synchronized(lock) {
            match (instance) {
                case None => 
                    var metadataLoader: MetadataLoader = DefaultMetadataDependenciesProvider.getInstance().getMetadataLoader()
                    setInstance(createInstance(metadataLoader).getOrThrow())
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    public static func createInstance(metadataLoader: MetadataLoader): Option<PhoneNumberUtil> {
        return createInstance(MetadataSourceImpl(
            DefaultMetadataDependenciesProvider.getInstance().getPhoneNumberMetadataFileNameProvider(),
            metadataLoader, 
            DefaultMetadataDependenciesProvider.getInstance().getMetadataParser()
            ))
    }

    public static func createInstance(metadataSource: MetadataSource): Option<PhoneNumberUtil> {
        return PhoneNumberUtil(metadataSource, HashMap<Int32, ArrayList<String>>())
    }

    static func formattingRuleHasFirstGroupOnly(nationalPrefixFormattingRule: String): Bool {
        return true
    }

    public open func isNumberGeographical(phoneNumber: PhoneNumber): Bool {
        return true
    }

    public open func isNumberGeographical(phoneNumberType: PhoneNumberType, countryCallingCode: Int32): Bool {
        return true
    }

    private func isValidRegionCode(regionCode: String): Bool {
        return true
    }

    private func hasValidCountryCallingCode(countryCallingCode: Int32): Bool {
        return true
    }

    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat): String {
        return ""
    }

    public open func format(number: PhoneNumber, numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit {}

    public open func formatByPattern(number: PhoneNumber, numberFormat: PhoneNumberFormat, 
        userDefinedFormats: ArrayList<PhonemetadataNumberFormat>): String {
        return ""
    }

    public open func formatNationalNumberWithCarrierCode(number: PhoneNumber, carrierCode: String): String {
        return ""
    }

    private func getMetadataForRegionOrCallingCode(countryCallingCode: Int32, regionCode: String): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    public open func formatNationalNumberWithPreferredCarrierCode(number: PhoneNumber, fallbackCarrierCode: String): String {
        return ""
    }

    public open func formatNumberForMobileDialing(number: PhoneNumber, regionCallingFrom: String, withFormatting: Bool): String {
        return ""
    }

    public open func formatOutOfCountryCallingNumber(number: PhoneNumber, regionCallingFrom: String): String {
        return ""
    }

    public open func formatInOriginalFormat(number: PhoneNumber, regionCallingFrom: String): String {
        return ""
    }

    private func rawInputContainsNationalPrefix(rawInput: String, nationalPrefix: String, regionCode: String): Bool {
        return true
    }

    private func hasFormattingPatternForNumber(number: PhoneNumber): Bool {
        return true
    }

    public open func formatOutOfCountryKeepingAlphaChars(number: PhoneNumber, regionCallingFrom: String): String {
        return ""
    }

    public open func getNationalSignificantNumber(number: PhoneNumber): String {
        return ""
    }

    private func prefixNumberWithCountryCallingCode(countryCallingCode: Int32, numberFormat: PhoneNumberFormat, 
        formattedNumber: StringBuilder): Unit {}

    private func formatNsn(number: String, metadata: PhonemetadataPhoneMetadata, numberFormat: PhoneNumberFormat): String {
        return ""
    }

    private func formatNsn(number: String, metadata: PhonemetadataPhoneMetadata, numberFormat: PhoneNumberFormat, 
        carrierCode: String): String {
        return ""
    }

    open func chooseFormattingPatternForNumber(availableFormats: ArrayList<PhonemetadataNumberFormat>, 
        nationalNumber: String): PhonemetadataNumberFormat {
        return PhonemetadataNumberFormat()
    }

    open func formatNsnUsingPattern(nationalNumber: String, formattingPattern: PhonemetadataNumberFormat, 
        numberFormat: PhoneNumberFormat): String {
        return ""
    }

    private func formatNsnUsingPattern(nationalNumber: String, formattingPattern: PhonemetadataNumberFormat, 
        numberFormat: PhoneNumberFormat, carrierCode: String): String {
        return ""
    }

    public open func getExampleNumber(regionCode: String): PhoneNumber {
        return PhoneNumber()
    }

    public open func getInvalidExampleNumber(regionCode: String): PhoneNumber {
        return PhoneNumber()
    }

    public open func getExampleNumberForType(regionCode: String, `type`: PhoneNumberType): PhoneNumber {
        return PhoneNumber()
    }

    public open func getExampleNumberForType(types: PhoneNumberType): PhoneNumber {
        return PhoneNumber()
    }

    public open func getExampleNumberForNonGeoEntity(countryCallingCode: Int32): PhoneNumber {
        return PhoneNumber()
    }

    private func maybeAppendFormattedExtension(number: PhoneNumber, metadata: PhonemetadataPhoneMetadata, 
        numberFormat: PhoneNumberFormat, formattedNumber: StringBuilder): Unit {}

    open func getNumberDescByType(metadata: PhonemetadataPhoneMetadata, types: PhoneNumberType): PhonemetadataPhoneNumberDesc {
        return PhonemetadataPhoneNumberDesc()
    }

    public open func getNumberType(number: PhoneNumber): PhoneNumberType {
        return PhoneNumberType.FIXED_LINE
    }

    private func getNumberTypeHelper(nationalNumber: String, metadata: PhonemetadataPhoneMetadata): PhoneNumberType {
        return PhoneNumberType.FIXED_LINE
    }

    open func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    open func getMetadataForNonGeographicalRegion(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    private static func ensureMetadataIsNonNull(phoneMetadata: PhonemetadataPhoneMetadata, message: String): Unit {}

    open func isNumberMatchingDesc(nationalNumber: String, numberDesc: PhonemetadataPhoneNumberDesc): Bool {
        return true
    }

    public open func isValidNumber(number: PhoneNumber): Bool {
        return true
    }

    public open func isValidNumberForRegion(number: PhoneNumber, regionCode: String): Bool {
        return true
    }

    public open func getRegionCodeForNumber(number: PhoneNumber): String {
        return ""
    }

    private func getRegionCodeForNumberFromRegionList(number: PhoneNumber, regionCodes: ArrayList<String>): String {
        return ""
    }

    public open func getRegionCodeForCountryCode(countryCallingCode: Int32): String {
        return ""
    }

    public open func getRegionCodesForCountryCode(countryCallingCode: Int32): ArrayList<String> {
        return ArrayList<String>()
    }

    public open func getCountryCodeForRegion(regionCode: String): Int32 {
        return 0
    }

    private func getCountryCodeForValidRegion(regionCode: String): Int32 {
        return 0
    }

    public open func getNddPrefixForRegion(regionCode: String, stripNonDigits: Bool): String {
        return ""
    }

    public open func isNANPACountry(regionCode: String): Bool {
        return true
    }

    public open func isAlphaNumber(number: String): Bool {
        return true
    }

    public open func isPossibleNumber(number: PhoneNumber): Bool {
        return true
    }

    public open func isPossibleNumberForType(number: PhoneNumber, types: PhoneNumberType): Bool {
        return true
    }

    private func testNumberLength(number: String, metadata: PhonemetadataPhoneMetadata): ValidationResult {
        return ValidationResult.IS_POSSIBLE
    }

    private func testNumberLength(number: String, metadata: PhonemetadataPhoneMetadata, types: PhoneNumberType): ValidationResult {
        return ValidationResult.IS_POSSIBLE
    }

    public open func isPossibleNumberWithReason(number: PhoneNumber): ValidationResult {
        return ValidationResult.IS_POSSIBLE
    }

    public open func isPossibleNumberForTypeWithReason(number: PhoneNumber, types: PhoneNumberType): ValidationResult {
        return ValidationResult.IS_POSSIBLE
    }

    public open func isPossibleNumber(number: String, regionDialingFrom: String): Bool {
        return true
    }

    public open func truncateTooLongNumber(number: PhoneNumber): Bool {
        return true
    }

    //public open func getAsYouTypeFormatter (regionCode: String): AsYouTypeFormatter {
    //    return AsYouTypeFormatter()
    //}
    open func extractCountryCode(fullNumber: StringBuilder, nationalNumber: StringBuilder): Int32 {
        return 0
    }

    open func maybeExtractCountryCode(number: String, defaultRegionMetadata: PhonemetadataPhoneMetadata, 
        nationalNumber: StringBuilder, keepRawInput: Bool, phoneNumber: PhoneNumber): Int32 {
        return 0
    }

    private func parsePrefixAsIdd(iddPattern: Regex, number: StringBuilder): Bool {
        return true
    }

    open func maybeStripInternationalPrefixAndNormalize(number: StringBuilder, possibleIddPrefix: String): CountryCodeSource {
        return CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN
    }

    open func maybeStripNationalPrefixAndCarrierCode(number: StringBuilder, metadata: PhonemetadataPhoneMetadata, 
        carrierCode: StringBuilder): Bool {
        return true
    }

    open func maybeStripExtension(number: StringBuilder): String {
        return ""
    }

    private func checkRegionForParsing(numberToParse: String, defaultRegion: String): Bool {
        return true
    }

    public open func parse(numberToParse: String, defaultRegion: String): PhoneNumber {
        return PhoneNumber()
    }

    public open func parse(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit {}

    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String): PhoneNumber {
        return PhoneNumber()
    }

    public open func parseAndKeepRawInput(numberToParse: String, defaultRegion: String, phoneNumber: PhoneNumber): Unit {}

    static func setItalianLeadingZerosForPhoneNumber(nationalNumber: String, phoneNumber: PhoneNumber): Unit {}

    private func parseHelper(numberToParse: String, defaultRegion: String, keepRawInput: Bool, checkRegion: Bool, 
        phoneNumber: PhoneNumber): Unit {}

    private func buildNationalNumberForParsing(numberToParse: String, nationalNumber: StringBuilder): Unit {}

    private static func copyCoreFieldsOnly(phoneNumberIn: PhoneNumber): PhoneNumber {
        return PhoneNumber()
    }

    public open func isNumberMatch(firstNumberIn: PhoneNumber, secondNumberIn: PhoneNumber): MatchType {
        return MatchType.NOT_A_NUMBER
    }

    private func isNationalNumberSuffixOfTheOther(firstNumber: PhoneNumber, secondNumber: PhoneNumber): Bool {
        return true
    }

    public open func isNumberMatch(firstNumber: String, secondNumber: String): MatchType {
        return MatchType.NOT_A_NUMBER
    }

    public open func isNumberMatch(firstNumber: PhoneNumber, secondNumber: String): MatchType {
        return MatchType.NOT_A_NUMBER
    }

    public open func canBeInternationallyDialled(number: PhoneNumber): Bool {
        return true
    }

    public open func isMobileNumberPortableRegion(regionCode: String): Bool {
        return true
    }
}

public enum PhoneNumberFormat {
    | E164
    | INTERNATIONAL
    | NATIONAL
    | RFC3966
}

public enum PhoneNumberType <: Hashable & Equatable<PhoneNumberType> {
    | FIXED_LINE
    | MOBILE
    | FIXED_LINE_OR_MOBILE
    | TOLL_FREE
    | PREMIUM_RATE
    | SHARED_COST
    | VOIP
    | PERSONAL_NUMBER
    | PAGER
    | UAN
    | VOICEMAIL
    | UNKNOWN

    public operator func ==(that: PhoneNumberType): Bool {
        match ((this, that)) {
            case (FIXED_LINE, FIXED_LINE) => true
            case (MOBILE, MOBILE) => true
            case (FIXED_LINE_OR_MOBILE, FIXED_LINE_OR_MOBILE) => true
            case (TOLL_FREE, TOLL_FREE) => true
            case (PREMIUM_RATE, PREMIUM_RATE) => true
            case (SHARED_COST, SHARED_COST) => true
            case (VOIP, VOIP) => true
            case (PERSONAL_NUMBER, PERSONAL_NUMBER) => true
            case (PAGER, PAGER) => true
            case (UAN, UAN) => true
            case (VOICEMAIL, VOICEMAIL) => true
            case (UNKNOWN, UNKNOWN) => true
            case _ => false
        }
    }

    public operator func !=(that: PhoneNumberType): Bool {
        return !(this == that)
    }

    public func hashCode(): Int64 {
        match (this) {
            case FIXED_LINE => "FIXED_LINE".hashCode()
            case MOBILE => "MOBILE".hashCode()
            case FIXED_LINE_OR_MOBILE => "FIXED_LINE_OR_MOBILE".hashCode()
            case TOLL_FREE => "TOLL_FREE".hashCode()
            case PREMIUM_RATE => "PREMIUM_RATE".hashCode()
            case SHARED_COST => "SHARED_COST".hashCode()
            case VOIP => "VOIP".hashCode()
            case PERSONAL_NUMBER => "PERSONAL_NUMBER".hashCode()
            case PAGER => "PAGER".hashCode()
            case UAN => "UAN".hashCode()
            case VOICEMAIL => "VOICEMAIL".hashCode()
            case UNKNOWN => "UNKNOWN".hashCode()
        }
    }
}

public enum MatchType {
    | NOT_A_NUMBER
    | NO_MATCH
    | SHORT_NSN_MATCH
    | NSN_MATCH
    | EXACT_MATCH
}

public enum ValidationResult {
    | IS_POSSIBLE
    | IS_POSSIBLE_LOCAL_ONLY
    | INVALID_COUNTRY_CODE
    | TOO_SHORT
    | INVALID_LENGTH
    | TOO_LONG
}
