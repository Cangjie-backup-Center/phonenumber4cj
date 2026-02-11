/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package cangjie_tpc::phonenumber4cj.prefixmapper

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

    public func getDisplayCountryToCN(): String {
        return match (this) {
            case English => "China"
            case US => "China"
            case Chinese => "中国"
            case China => "中国"
        }
    }

    public func getDisplayCountryToUS(): String {
        return match (this) {
            case English => "United States"
            case US => "United States"
            case Chinese => "美国"
            case China => "美国"
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
