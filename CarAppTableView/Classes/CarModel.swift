import UIKit

class CarModel {
    var modelName: String?
    var colour: String?
    var yearManufactured: String?
    var engine: String?
    var fuelType: String?
    var bodyType: String?
    var transmission: String?
    var images: [UIImage]?
    var reviews: [Review]?
    
    init(modelName: String,
         colour: String,
         yearManufactured: String,
         engine: String,
         fuelType: String,
         bodyType: String,
         transmission: String,
         images: [UIImage]?,
         reviews: [Review]?) {
        self.modelName = modelName
        self.colour = colour
        self.yearManufactured = yearManufactured
        self.engine = engine
        self.fuelType = fuelType
        self.bodyType = bodyType
        self.transmission = transmission
        self.images = images
        self.reviews = reviews
    }
}
