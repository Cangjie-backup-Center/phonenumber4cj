/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.metadata

public interface MetadataBootstrappingGuard<T> where T <: MetadataContainer {
    func getOrBootstrap(phoneMetadataFile: ArrayList<String>): T
}
