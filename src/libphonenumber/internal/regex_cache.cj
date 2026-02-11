/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package cangjie_tpc::phonenumber4cj.libphonenumber.internal

public open class RegexCache {
    private var cache: HashMap<String, Regex> = HashMap<String, Regex>()

    public init() {}

    public open func getPatternForRegex(regex: String): Regex {
        var reg: ?Regex = cache.get(regex)
        if (let None <- reg) {
            reg = Regex(regex)
            cache.add(regex, reg.getOrThrow())
        }
        return reg.getOrThrow()
    }
}
