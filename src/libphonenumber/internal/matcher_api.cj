/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.internal

public interface MatcherApi {
    func matchNationalNumber(number: String, numberDesc: PhonemetadataPhoneNumberDesc, allowPrefixMatch: Bool): Bool
}
