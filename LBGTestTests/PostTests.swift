import XCTest
@testable import LBGTest

final class PostTests: XCTestCase {
    
    func testDecodePostFromJSON() throws {
        let json = """
        {
            "id": 1,
            "title": "Test Title",
            "body": "This is the body of the test post."
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let post = try decoder.decode(Post.self, from: json)
        
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Test Title")
        XCTAssertEqual(post.body, "This is the body of the test post.")
    }
    
    func testEncodePostToJSON() throws {
        let post = Post(id: 2, title: "Encoded Title", body: "This is the encoded post body.")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let data = try encoder.encode(post)
        let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        XCTAssertEqual(jsonObject?["id"] as? Int, 2)
        XCTAssertEqual(jsonObject?["title"] as? String, "Encoded Title")
        XCTAssertEqual(jsonObject?["body"] as? String, "This is the encoded post body.")
    }
}
