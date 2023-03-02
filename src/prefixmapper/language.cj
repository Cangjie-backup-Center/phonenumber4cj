package prefixmapper

public enum Language {

    English |
    Chinese |
    China |
    US

    public func getCountry(): String {
        return match (this) {
            case English => ""
            case Chinese => ""
            case China => "CN"
            case US => "US"
        }
    }

    public func getDisplayCountry(): String {
        return match (this) {
            case English => "US"
            case Chinese => "中国"
            case China => "中国"
            case US => "US"
        }
    }

    public func getLanguage(): String {
        return match (this) {
            case English => "en"
            case Chinese => "zh"
            case China => "zh"
            case US => "en"
        }
    }

    public operator func == (that: Language): Bool {
        match ((this, that)) {
            case (English, English) => true
            case (Chinese, Chinese) => true
            case (China, China) => true
            case (US, US) => true
            case _ => false
        }
    }

    public operator func != (that: Language): Bool {
        return !(this == that)
    }

    public func toString(): String {
        return match(this) {
            case English => "English"
            case Chinese => "Chinese"
            case China => "China"
            case US => "US"
        }
    }
}
