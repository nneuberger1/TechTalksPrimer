# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TechTalksPrimer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TechTalksPrimer

   
    ################################
    # Swifter Swift - collection of over 500 native Swift extensions
    #      see: http://swifterswift.com/docs/ 

    pod 'SwifterSwift'

    ################################
    # Amazon Centric Libraries

    $awsVersion = '~> 2.12.0'

    pod 'AWSIoT', $awsVersion
    pod 'AWSCore', $awsVersion
    pod 'AWSCognitoIdentityProvider', $awsVersion
    pod 'AWSDynamoDB', $awsVersion

    ################################


  target 'TechTalksPrimerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TechTalksPrimerUITests' do
    # Pods for testing
  end

end
