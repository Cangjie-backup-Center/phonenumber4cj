/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.inter

public class NumberParseException <: Exception {

    private var errorType: ErrorType
    private var msg: String

    public init(errorType: ErrorType, msg: String) {
        super(msg)
        this.msg = msg
        this.errorType = errorType
    }

    public func getErrorType(): ErrorType {
        return errorType
    }

    public func toString(): String {
        return "Error type: " + errorType.toString() + ". " + msg
    }
    
}

public enum ErrorType {

    INVALID_COUNTRY_CODE |
    NOT_A_NUMBER |
    TOO_SHORT_AFTER_IDD |
    TOO_SHORT_NSN |
    TOO_LONG

    public operator func == (that: ErrorType): Bool {
        match ((this, that)) {
            case (INVALID_COUNTRY_CODE, INVALID_COUNTRY_CODE) => true
            case (NOT_A_NUMBER, NOT_A_NUMBER) => true
            case (TOO_SHORT_AFTER_IDD, TOO_SHORT_AFTER_IDD) => true
            case (TOO_SHORT_NSN, TOO_SHORT_NSN) => true
            case (TOO_LONG, TOO_LONG) => true
            case _ => false
        }
    }

    public operator func != (that: ErrorType): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case INVALID_COUNTRY_CODE                => "INVALID_COUNTRY_CODE"
            case NOT_A_NUMBER          => "NOT_A_NUMBER"
            case TOO_SHORT_AFTER_IDD               => "TOO_SHORT_AFTER_IDD"
            case TOO_SHORT_NSN   => "TOO_SHORT_NSN"
            case TOO_LONG            => "TOO_LONG"
        }
    }
}
