import UIKit

class dataSourceProvider {
    func generateData() -> [CarBrand]? {
        
        var carBrands = [CarBrand]()
        
        carBrands.append(
            CarBrand.init(
                brandName: "Mercedes",
                carModels: [
                    CarModel.init(
                        modelName: "S-class",
                        colour: "Black",
                        yearManufactured: "1990",
                        engine: "2L",
                        fuelType: "Petrol",
                        bodyType: "Cadelac",
                        transmission: "Manual",
                        images: nil,
                        reviews: [
                            Review.init(
                                name: "Piet",
                                rating: 5,
                                description: "Amazing car! Great power and balance. Really feels like a millionnaire's car")])]))
        carBrands.append(
            CarBrand.init(
                brandName: "Volkswagen",
                carModels: [
                    CarModel.init(
                        modelName: "Polo Vivo",
                        colour: "Blue",
                        yearManufactured: "2021",
                        engine: "1.4L",
                        fuelType: "Petrol",
                        bodyType: "Hatchback",
                        transmission: "Manual",
                        images: nil,
                        reviews: [
                            Review.init(
                                name: "Jan",
                                rating: 4,
                                description: "Loving the car! Very nippy and the maneuverability is great!"),
                            Review.init(
                                name: "Koos",
                                rating: 3,
                                description: "It's not all the hype that everyone makes it out to be. Very cramped!")])]))
        carBrands.append(
            CarBrand.init(
                brandName: "Ferrari",
                carModels: [
                    CarModel.init(
                        modelName: "Roma",
                        colour: "Gunmetal Gray",
                        yearManufactured: "2021",
                        engine: "V8",
                        fuelType: "Petrol",
                        bodyType: "Convertible",
                        transmission: "Manual",
                        images: nil,
                        reviews: nil),
                    CarModel.init(
                        modelName: "F8-Spider",
                        colour: "Yellow",
                        yearManufactured: "2021",
                        engine: "V8",
                        fuelType: "Petrol",
                        bodyType: "Convertible",
                        transmission: "Manual",
                        images: nil,
                        reviews: nil)]))
        
        return carBrands
    }
}
