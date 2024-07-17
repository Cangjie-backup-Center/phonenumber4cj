/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.libphonenumber.metadata

public class ClassPathResourceMetadataLoader <: MetadataLoader {
    
    public init() {}

    public func loadMetadata(metadataFileName: ArrayList<String>): ArrayList<String> {
        return metadataFileName
    }
}
