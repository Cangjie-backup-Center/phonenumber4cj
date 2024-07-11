/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.internal

from std import collection.*
from std import regex.*

public open class RegexCache {
    private var cache: HashMap<String, Regex> = HashMap<String, Regex>()

    public init() {}

    public open func getPatternForRegex(regex: String): Regex {
        var reg: ?Regex = cache.get(regex)
        if (let None <- reg) {
            reg = Regex(regex)
            cache.put(regex, reg.getOrThrow())
        }
        return reg.getOrThrow()
    }
}
