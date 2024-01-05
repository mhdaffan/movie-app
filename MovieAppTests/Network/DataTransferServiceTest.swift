//
//  DataTransferServiceTest.swift
//  MovieAppTests
//
//  Created by Muhammad Affan on 05/01/24.
//

@testable import MovieApp
import XCTest
import RxSwift
import RxTest

final class DataTransferServiceTest: XCTestCase {
    
    var session = NetworkSessionMockImpl()
    var mockMovieEndpoint = MovieEndpoint.searchMovies(keyword: "star", country: "au")
    
    private lazy var errorObserver = scheduler.createObserver(Error.self)
    private var scheduler: TestScheduler = TestScheduler(initialClock: 0)
    private var disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        session = NetworkSessionMockImpl()
        errorObserver = scheduler.createObserver(Error.self)
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func test_request_withSuccessResponse_expectMappingToMovieModel() {
        session.data = MovieModel.mock200()
        let sut = makeSUT()
        
        sut.request(with: mockMovieEndpoint).subscribe(
            scheduler: scheduler,
            onNext: { movie in
                XCTAssertEqual(movie.count, MovieModel.stub200().count)
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func test_request_withNoResponse_expectNoDataError() {
        session.data = nil
        assertErrorRequest(expError: APIError.noData)
    }
    
    func test_request_withInvalidResponse_expectParsingJSONError() {
        session.data = Data("Internal Server Error".utf8)
        assertErrorRequest(expError: APIError.parseError)
    }
    
    func test_request_withNoInternet_expectNetworkFailureError() {
        session.error = APIError.noConnection
        assertErrorRequest(expError: APIError.noConnection)
    }
    
    func assertErrorRequest(expError: Error, file: StaticString = #file, line: UInt = #line) {
        let sut = makeSUT()
        
        sut.request(with: mockMovieEndpoint).subscribe(
            scheduler: scheduler,
            onError: { error in
                XCTAssertEqual(error.localizedDescription, expError.localizedDescription)
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> DataTransferServiceImpl {
        InjectedValue[\.networkSession] = session
        let sut = DataTransferServiceImpl()
        trackForMemoryLeaks(sut)
        
        return sut
    }
    
}
