
Pod::Spec.new do |spec|

  spec.name         = "Pagie"
  spec.version      = "1.0.1"
  spec.summary      = "This my framework called Pagie."
  spec.description  = "This is a framework that made by Ahmed Elserafy"

  spec.homepage     = "https://github.com/ahmedelserafy7/Pagie"
  spec.license      = "MIT"
  spec.author             = { "Ahmed Elserafy" => "ahmed.samer43@yahoo.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/ahmedelserafy7/Pagie.git", :tag => "1.0.1" }
  spec.source_files = "Pagie", "**/Source/**/*.swift"
  spec.swift_version = '5.0'

end

