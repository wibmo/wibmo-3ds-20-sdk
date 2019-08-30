# Wibmo3ds SDK 
The SDK is designed as per the specification of EMVCO 3-D Secure Protocol and Core Functions Specification version 2.1.0                      
**You need an license key from Wibmo Inc. to use the SDK in your apps.**

Contact us at [ios@wibmo.com](ios@wibmo.com) for obtaining license key.

Wibmo3ds SDK is certified by EMVCO which can be found at _[EMVCO Certification](https://www.emvco.com/wp-content/uploads/approved_products/uploaded/loa/3DS_LOA_SDK_WIBM_020100_00128_23Apr19.pdf)_

## Integration
Steps to integrate the Wibmo3ds SDK with your iOS application.

### Important 
You must have a Wibmo Inc issued license key to use the SDK.

### System Requirements
* Swift 5.0+
* Xcode 10.1+
* iOS Deployment Target 10.0+

### Adding Wibmo3ds SDK as dependency to iOS Application

#### Cocoapods
* In your project's podfile include under your app target ``` pod 'Wibmo3ds’, '~> 1.0.3' ``` .
* Then pod install.

**An example in ``` AppDelegate ``` implementation is shared below, but app makers can call it as per there convenience. Just make sure Wibmo3ds.shared.initialize... is called only once per app launch.** 

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?

        fileprivate func setupWibmo3ds() throws {

            let licenceKey = "eyJ4NWMiOlsiTUlJRGhEQ0NBbXlnQXdJQkFnSUVYUU9NV0RBTkJna3Foa2lHOXcwQkFRc0ZBRENCZ3pFTE1Ba0dBMVVFQmhNQ1NVNHhFakFRQmdOVkJBZ01DVXRoY201aGRHRnJZVEVTTUJBR0ExVUVCd3dKUW1WdVoyRnNkWEoxTVE0d0RBWURWUVFLREFWM2FXSnRiekVVTUJJR0ExVUVDd3dMUlc1bmFXNWxaWEpwYm1jeEpqQWtCZ05WQkFNTUhYZHBZbTF2TFhOMFlXZHBibWN0YzJSckxXbHZjeTFzYVdObGJuTmxNQjRYRFRFNU1EWXhOREV5TURBeU5Gb1hEVEkwTURZeE5ERXlNREF5TkZvd2dZTXhDekFKQmdOVkJBWVRBa2xPTVJJd0VBWURWUVFJREFsTFlYSnVZWFJoYTJFeEVqQVFCZ05WQkFjTUNVSmxibWRoYkhWeWRURU9NQXdHQTFVRUNnd0ZkMmxpYlc4eEZEQVNCZ05WQkFzTUMwVnVaMmx1WldWeWFXNW5NU1l3SkFZRFZRUUREQjEzYVdKdGJ5MXpkR0ZuYVc1bkxYTmtheTFwYjNNdGJHbGpaVzV6WlRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBSnZ6cTAxY2FwK2hwNk96UzVhV2I4K3QxZjM5SldYWjZoNFh4clc3UjFORSt6emFZTWtqY1Y3WXIwTk15Wmx4bWhXTStMcFBGY001NzRNMUc4dkRNMjYvd21CMnBJSkNhSDJobnQ5RnNrZks1YXhmZlc2YXIzRWxzaGd5UCtSalhEcER5RHFRV0QrOGpIam1oTGZaWlhNelZjdGJuOEp3WUV5VUVuV3VvSjYyczRzZXNFV3VpSzZzbm0vQ2s4TEhMUEdZb0dGbXN4MDNrdXhST25nZVo3RWErOEwrMmFieG1VT0ZBREZhaGgrYjZoU2ZqTlRKbFZnSmpNbERLWHg3eWRtZUdlM0hHRmhmYWlDcnM2YzRGdWxoa1pwRnByMDlkRHpqOFNRY29yc2xVdzZzTmdHSlVSN3FSNDlTV3gwbGoxRWJtZ3BuUlJIMEVIdVgvclBFLzNNQ0F3RUFBVEFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBTHBMelhuUThMWE9CUC9YSjdjM3RaQWpuTkdCTzl1SXNlZlpHWlhjN1BURkdrbmI4ZmpKMVZERER5Ni9pbzBvY0J1aGFscGNvVkNrY3hpeEpRTlR1aENlaWp1djVKMGUxaFB4SEZIVENMUEc2eTdwZkRsYTNUdUlmL0E0NTN4c0cwVkFuQXVXcTNmb0x2d3FwR1h5OE9PVFdMK2xpSnYvS1pJVXRTaE1NenhVN1ViYnJsaFZCMHFTOERsUW9XdDFPUWZoSEdOMWFpT2Jjei9IUzRwR3hkK1M4dmtqMzdWWFY4TzQwKzJlQ2hVNkNNS1d3bkpOamJJQkhCN2t0T1hrWklrNVhpa2ppckRzSUNhckRrQndwS3YwUjZMclBvK2RKcXJ3enJOR0ZBVEJzNmtRSEJXc1hYNG1NSjFjYUY1cWdXV0o5Rjl5MndsVjdod3FlM2FMeGt3PT0iXSwiYWxnIjoiUFMyNTYifQ.eyJpc3N1ZXIiOiJ3d3cud2libW8uY29tIiwiaXNzdWVkVG8iOiJQYXkgVSIsImRhdGVPZklzc3VlIjoiMjAxOS0wNy0wOVQxMDoyMjoyMCswMDowMCIsImV4cGlyeURhdGUiOiIyMDIxLTA5LTA3VDAwOjAwOjAwKzAwOjAwIn0.LAUNllkls4ty2WRTvJ23QFM9GxaF_Xx8uUhIWyfWeWJgsDCwO94eNIc0ra0lhdKHT9W7ztu4gB7ssc7AJl9l9rOhCg3e4vYnlQnRtXSCtpCzbSJaTWFbGF6vOtsxoym8mJe4EYDkNgO4reW5lh0tn7nekSt8S_9NdlbYvi1I3Hbo-CLtozaTenPRp3LnA-rgT8ezZZl1f8jtjOerxwwrCOsJBrAVZSmUrVY_nMTsQdkKE4peSFBvNWs9_kD9SMz2ua77q-Deai__WFcKKrusgOk5ntAQ0cyHRAsHefUpMXadNVrcUYlkYJ9er51He8_Mr4475EELJlxyQxkm25POkw"
            let rsaKeyValueMaster = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr/O0BfXWngO9OJDBsqdR5U2h28jrX6Y+LlblTBaYeT2tW7+ca3YzTFXA8duVUwdlWxl3JZCOOeL1feVP6g0TNOHVCkCnirVDLkcozod4aSkNvx+929aDr1ithqhruf0skBc2sMZGBBCNpso6XGzyAf2uZ2+9DvXoKIUYgcr7PQmL2Y0awyQN7KCRcusaotYNz2mOPrL/hAv6hTexkNrQKzFcPwCuc6kN6aNjD+p2CJ51/5p02SNS70nPOmwmg63j6f3n7xVykQ56kNc1l5B5xOpeHJmqk3+hyF1dF/47rQmMFicN41QSvZ5AZJKgWlIn2VQROMkEHkF9ZBRLx1nFTwIDAQAB"+".rsa"
            let ecKeyValueVisa = "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEYktbLuAv0v52erE5LPscomKaOmQsvevxzOyn9k4sF1hqpBc5kUygzxA9Jl0R/2dTuk8ka7UCujk36xeUsLVpWA=="+".ec"

            let masterDirectoryServerId = "B012345678"
            let visaDirectoryServerId = "A000000003"
            let configParams = ConfigParameters()
            try configParams.addParam(nil, "Wibmo_License", licenceKey)
            try configParams.addParam(nil, masterDirectoryServerId, rsaKeyValueMaster)
            try configParams.addParam(nil, visaDirectoryServerId, ecKeyValueVisa)
            try Wibmo3ds.shared.initialize(nil, configParams, nil, nil)

        }

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            do {
             try setupWibmo3ds()
            } catch {
                //TODO: Implement Error Handling
            }
            return true
        }
    }
```

**To initiate a transaction** 
```swift
    func btnPayTapped() {
        do {
            try setupWibmo3ds()
            let masterDirectoryServerId = "B012345678"
            let transaction = try Wibmo3ds.shared.createTransaction(masterDirectoryServerId, "2.1.0")
            let authenticationRequestParameters = transaction?.getAuthenticationRequestParameters()

            //TODO: Use <authenticationRequestParameters> to create Areq, and send Areq request

            let progressView = try transaction?.getProgressView()
            //TODO: Show progress view on the UI till Ares is not received.

            if true {
                //Success (Frictionless)
                transaction?.close()
            } 
            else {
                //Challenge

                let challengeParameters = ChallengeParameters(a3DSServerTransactionID: "a3DSServerTransactionID", acsTransactionID: "acsTransactionID", acsRefNumber: "acsRefNumber", acsSignedContent: "acsSignedContent", threeDSServerTransactionID: "threeDSServerTransactionID", acsRenderingType: .text)
                try transaction?.doChallenge(challengeParameters, self, 5) //5 minutes
            }

        } catch {
            //TODO: Implement Error Handling
            //transaction?.close()
        }
    }
```

**Note:** 
UI Customization to match the 3D-Secure UI to your app theme is available as per the 3DS 2.0 Protocol, which is not covered as part of this documentaion. 

For further queries write to us at [ios@wibmo.com](ios@wibmo.com)
