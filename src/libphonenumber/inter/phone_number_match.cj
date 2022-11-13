package libphonenumber.inter

public class PhoneNumberMatch {
    private var start: Int64
    private var rawString: String
    private var number: PhoneNumber

    public init(start: Int64, rawString: String, number: PhoneNumber) {
        if (start < 0) {
            throw IllegalArgumentException("Start index must be >= 0.")
        }
        if (rawString.isEmpty()) {
            throw Exception("Null Pointer")
        }
        this.start = start
        this.rawString = rawString
        this.number = number
    }

    public func getNumber(): PhoneNumber {
        return number
    }

    public func getStart(): Int64 {
        return start
    }

    public func getEnd(): Int64 {
        return start + rawString.size
    }

    public func getRawString(): String {
        return rawString
    }

    public func equals(obj: Object): Bool {
        if (refEq(this, obj)) {
            return true
        }
        if (!(obj is PhoneNumberMatch)) {
            return false
        }
        var opt = obj as PhoneNumberMatch
        var result = opt.getOrThrow()
        var other: PhoneNumberMatch = result
        var isRawString = rawString.equals(other.rawString)
        var isStart = (start == other.start)
        var isNumber = number.equals(other.number)
        return isRawString && isStart && isNumber
    }

    public func toString(): String {
        return "PhoneNumberMatch [ ${getStart()} , + ${getEnd()}) + rawString "
    }
}
