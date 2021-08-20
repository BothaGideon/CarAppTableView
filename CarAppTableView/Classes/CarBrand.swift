class CarBrand {
    var brandName: String
    var carModels: [CarModel]?
    
    init(brandName: String, carModels: [CarModel]) {
        self.brandName = brandName
        self.carModels = carModels
    }
}
