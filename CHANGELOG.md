## 0.5.0

* Update `chopper` to latest 8.x version - **breaking**, `AutogramAuthenticator` and the generated
  `Autogram` client expose `chopper` 8 types
* Raise minimum Dart SDK to 3.3.4
* Update API schema - documentation only, no API changes
* Add `bin/example.dart` with the end-to-end document signing flow

## 0.4.5

* Parsing title from HTML error body as exception message

## 0.4.4

* Update API scheme to v0.4.0
* "Document Validation" API returns non-nullable type

## 0.4.3

* Fix "Document Validation" API - returning nullable type

## 0.4.2

* Update API client - Document Validation

## 0.4.1

* Implement `generateEncryptionKey()` and `generateAsymmetricKeyPair()` helpers
* Update API client - prepare functions:
  * to get Document signing parameters
  * to register Device
  * to register Device integration
* Limit `chopper` version and increase `json_annotation` version

## 0.4.0

* Allow dynamic "Encryption Key" value.
* Update service docs.

## 0.3.0

* Implement functions for listing and deleting device integrations

## 0.2.0

* Implement functions for document validation
* Implement functions for device registration to receive Push notifications

## 0.1.0

* Implement all necessary functions for document visualisation and signing. 
* Implement simple error response parser.

## 0.0.1

* Add REST API client methods in `IAutogramService`.
