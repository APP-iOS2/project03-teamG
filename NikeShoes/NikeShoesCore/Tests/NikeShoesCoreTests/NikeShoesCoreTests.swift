import XCTest
@testable import NikeShoesCore

final class NikeShoesCoreTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NikeShoesCore().text, "Hello, World!")
        
        if #available(iOS 13.0, *) {
//            let firebase = DefaultFireStoreService()
            
            let dto1 = UserDTO(id: UUID().uuidString,firstName: "박", lastName: "형환", email: "email", phoneNumber: "010", dateOfBirth: "2023", country: "한국")
            print(dto1)
            let value = dto1.toDictionaryNotNil()
            print(value)
            let json = try! JSONSerialization.data(withJSONObject: value)
            let resultDic =  ""// try! JSONDecoder().decode([String : String].self, from: json)
            
            print(resultDic)

//            XCTAssertEqual(value, resultDic,"fail")
        } else {
            // Fallback on earlier versions
        }
    
        
    }
}
