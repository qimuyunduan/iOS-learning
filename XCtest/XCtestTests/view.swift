import Quick
import Nimble
@testable import XCtest

class viewSpec: QuickSpec {
    
    
    override func spec() {
        describe("test one") {
            
            describe("viewContainer") {
                it("function test") {
                    let test = TextClass()
                    expect(test.firstWish()).to(equal(""))
                    test.addWish("apple")
                    expect(test.getWishCount()).to(equal(2))
                }
                
            }
            
        }
        
    }
}
