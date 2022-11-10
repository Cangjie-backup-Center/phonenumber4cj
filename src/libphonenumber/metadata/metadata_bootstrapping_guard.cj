package libphonenumber.metadata

public interface MetadataBootstrappingGuard<T> where T <: MetadataContainer {
    func getOrBootstrap(phoneMetadataFile: String): T
}
