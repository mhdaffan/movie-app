# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def movie_pods
  pod 'netfox', '1.21.0'
  pod 'SnapKit', '~> 5.6.0'
  pod 'IGListKit', '4.0.0'
  pod 'Kingfisher', '~> 7.0'
  pod 'RxSwift', '6.6.0'
  pod 'RxCocoa', '6.6.0'
end

target 'MovieApp' do
  movie_pods
end

target 'MovieAppTests' do
  pod 'RxTest'
  inherit! :search_paths
  # Pods for testing
end

target 'MovieAppUITests' do
  # Pods for testing
end
