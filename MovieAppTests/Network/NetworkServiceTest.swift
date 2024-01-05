//
//  NetworkServiceTest.swift
//  MovieAppTests
//
//  Created by Muhammad Affan on 05/01/24.
//

@testable import MovieApp
import XCTest
import RxSwift
import RxTest

final class NetworkServiceImplTests: XCTestCase {
    
    private var mockSession = NetworkSessionMockImpl()
    private lazy var errorObserver = scheduler.createObserver(Error.self)
    
    private var scheduler: TestScheduler = TestScheduler(initialClock: 0)
    private var disposeBag = DisposeBag()
    
    struct EndpointMock: Requestable {
        var path: String
        var isFullPath: Bool = false
        var method: HTTPMethod
        var queryParameters: [String : Any] = [:]
        var headerParamaters: [String : String] = [:]
        var bodyParamaters: [String : Any] = [:]
        
        init(path: String = "v1/mock/test", method: HTTPMethod = .get) {
            self.path = path
            self.method = method
        }
    }
    
    override func setUp() {
        super.setUp()
        errorObserver = scheduler.createObserver(Error.self)
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func test_request_expectReturnValidData() {
        let responseData = MovieModel.mock200()
        mockSession.data = responseData
        let sut = makeSUT()
        
        sut.request(with: EndpointMock()).subscribe(
            scheduler: scheduler,
            onNext: { data in
                XCTAssertEqual(data, responseData)
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func test_request_expectErrorNoData() {
        mockSession.data = nil
        let sut = makeSUT()
        
        sut.request(with: EndpointMock()).subscribe(
            scheduler: scheduler,
            onError: { error in
                XCTAssertEqual(error.localizedDescription, APIError.noData.localizedDescription)
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func test_request_expectErrorNoConnected() {
        mockSession.error = APIError.noConnection
        let sut = makeSUT()
        
        sut.request(with: EndpointMock()).subscribe(
            scheduler: scheduler,
            onError: { error in
                XCTAssertEqual(error.localizedDescription, APIError.noConnection.localizedDescription)
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func test_request_expectErrorUnexpected() {
        mockSession.error = APIError.createError(code: NSURLErrorUnknown, description: "Unexpected Error")
        let sut = makeSUT()
        
        sut.request(with: EndpointMock()).subscribe(
            scheduler: scheduler,
            onError: { error in
                XCTAssertEqual(error.localizedDescription, "Unexpected Error")
            })
        .disposed(by: disposeBag)
        
        scheduler.start()
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> NetworkServiceImpl {
        let sut = NetworkServiceImpl()
        sut.session = mockSession
        trackForMemoryLeaks(sut)
        
        return sut
    }
    
}

