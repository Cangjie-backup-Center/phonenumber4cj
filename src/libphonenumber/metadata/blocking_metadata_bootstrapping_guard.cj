package libphonenumber.metadata

from std import io.*
from std import collection.*

class BlockingMetadataBootstrappingGuard<T> <: MetadataBootstrappingGuard<T> where T <: MetadataContainer {
    private let metadataLoader: MetadataLoader
    private let metadataParser: MetadataParser
    private let metadataContainer: T
    private let loadedFiles: HashMap<String, String>

    init(metadataLoader: MetadataLoader, metadataParser: MetadataParser, metadataContainer: T) {
        this.metadataLoader = metadataLoader
        this.metadataParser = metadataParser
        this.metadataContainer = metadataContainer
        this.loadedFiles = HashMap<String, String>()
    }

    public func getOrBootstrap(phoneMetadataFile: String): T {
        return metadataContainer
    }

    private func bootstrapMetadata(phoneMetadataFile: String): Unit {}

    private func read(phoneMetadataFile: String): Collection<PhonemetadataPhoneMetadata> {
        return ArrayList<PhonemetadataPhoneMetadata>()
    }
}
