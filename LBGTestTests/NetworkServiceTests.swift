import XCTest
@testable import LBGTest

final class NetworkServiceTests: XCTestCase {

    // Test real API call
    func testFetchPostsReturnsValidPosts() async throws {
        // Arrange
        let service: NetworkServicing = NetworkService()
        
        // Act
        let posts = try await service.fetchPosts()
        
        // Assert
        XCTAssertFalse(posts.isEmpty, "Expected non-empty post list from API.")
        
        let first = posts.first!
        XCTAssertNotNil(first.id)
        XCTAssertNotNil(first.title)
        XCTAssertNotNil(first.body)
    }

    // Optional: Test invalid URL handling
    func testFetchPostsThrowsErrorForBadURL() async {
        // Temporary subclass to simulate bad URL scenario
        final class BadURLService: NetworkServicing {
            func fetchPosts() async throws -> [Post] {
                guard let url = URL(string: "❌INVALID_URL") else {
                    throw URLError(.badURL)
                }
                let (data, _) = try await URLSession.shared.data(from: url)
                return try JSONDecoder().decode([Post].self, from: data)
            }
        }

        let service: NetworkServicing = BadURLService()

        do {
            _ = try await service.fetchPosts()
            XCTFail("Expected fetch to throw an error due to bad URL.")
        } catch {
            XCTAssertTrue(error is URLError, "Expected URLError but got \(error)")
        }
    }
}
