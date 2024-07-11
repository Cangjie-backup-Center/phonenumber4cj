/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.metadata

from std import regex.*

public class MultiFileModeFileNameProvider <: PhoneMetadataFileNameProvider {
    private var phoneMetadataFileNamePrefix: HashMap<String, ArrayList<String>>

    public init(phoneMetadataFileNameBase: HashMap<String, ArrayList<String>>) {
        this.phoneMetadataFileNamePrefix = phoneMetadataFileNameBase
    }

    public func getFor(key: String): ArrayList<String> {
        return match (phoneMetadataFileNamePrefix.get(key)) {
            case Some(x) => x
            case None => throw IllegalArgumentException("Invalid key: ${key}")
        }
    }
}
