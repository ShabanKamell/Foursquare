# Foursquare

Foursquare app represents a real world app example. it provides a fairly complex set of functionalities. 
It's a suitable showcase for all the advantages that SwiftUI, Combine, and modular architecture bring.
It has all features that would make it a modular, scalable, testable and maintainable app.

## App Logic

- The app displays the list of nearby venues from **Foursquare** Places API.
- If there's no network connection, the data will be fetched from `CoreData` which saved in the last time.

## Stack:
- [ ] SwiftUI
- [ ] Combine
- [ ] Async/Await
- [ ] MVVM
- [ ] Modular architecture

## Modular Architecture

 <img src="https://github.com/ShabanKamell/Foursquare/blob/main/blob/Modular%20Architecture.jpg?raw=true" height="600">


## README

Each module has its own `README.md` file that documents the module.

## Important Notes

- [ ] To compile the app and get it working, you have to add the following struct in `Data/Data`
and don't forget to add your **Foursquare token**.

```swift
struct FoursquareToken {
    static let token = "TOKEN_HERE"
}
```

- [ ] In Data/DataTests, there's a very simple example demonstrates how we can test repos.

### 🛡 License
<details>
    <summary>
        Click to reveal License
    </summary>

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
