package libphonenumber.metadata

from std import sync.*
from encoding import json.*
from std import io.*
from std import collection.*

public class BlockingMetadataBootstrappingGuard<T> <: MetadataBootstrappingGuard<T> where T <: MetadataContainer {

    private static let lock = ReentrantMutex()
    private let metadataLoader: MetadataLoader
    private let metadataParser: MetadataParser
    private let metadataContainer: T
    private let loadedFiles: HashMap<String, String>

    public init(metadataLoader: MetadataLoader, metadataParser: MetadataParser, metadataContainer: T) {
        this.metadataLoader = metadataLoader
        this.metadataParser = metadataParser
        this.metadataContainer = metadataContainer
        this.loadedFiles = HashMap<String, String>()
    }

    public func getOrBootstrap(phoneMetadataFile: ArrayList<String>): T {
        var hash: Int64 = phoneMetadataFile.toString().hashCode()
        if (!loadedFiles.contains(hash.toString())) {
            bootstrapMetadata(phoneMetadataFile)
        }
        return metadataContainer
    }

    private func bootstrapMetadata(phoneMetadataFile: ArrayList<String>): Unit {
        synchronized(lock) {
            var hash: Int64 = phoneMetadataFile.toString().hashCode()
            var phoneMetadata: Collection<PhonemetadataPhoneMetadata> = read(phoneMetadataFile)
            for (metadata in phoneMetadata) {
                metadataContainer.accept(metadata)
            }
            loadedFiles.put(hash.toString(), hash.toString())
        }
    }

    private func read(phoneMetadataFile: ArrayList<String>): Collection<PhonemetadataPhoneMetadata> {
        try {
            var arrayList = metadataLoader.loadMetadata(phoneMetadataFile)
            return metadataParser.parse(arrayList)
        } catch(e: IllegalArgumentException) {
            throw IllegalArgumentException("Failed to read file " + phoneMetadataFile.toString())
        }
    }
}
