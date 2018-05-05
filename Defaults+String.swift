//
// SwiftyUserDefaults
//
// Copyright (c) 2015-2018 Radosław Pietruszewski, Łukasz Mróz
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Quick
import Nimble
@testable import SwiftyUserDefaults

final class DefaultsStringSpec: QuickSpec {

    override func spec() {
        var defaults: UserDefaults!

        given("string") {
            beforeEach {
                defaults = UserDefaults()
                defaults.cleanObjects()
            }

            then("create a key without default value") {
                let key = DefaultsKey<String>("test")
                expect(key._key) == "test"
                expect(key.defaultValue) == String.defaultValue
            }

            then("create an array key without default value") {
                let key = DefaultsKey<[String]>("test")
                expect(key._key) == "test"
                expect(key.defaultValue) == [String].defaultValue
            }

            then("create a key with default value") {
                let key = DefaultsKey<String>("test", defaultValue: "default")
                expect(key._key) == "test"
                expect(key.defaultValue) == "default"
            }

            then("create an array key with default value") {
                let key = DefaultsKey<[String]>("test", defaultValue: ["test1", "test1"])
                expect(key._key) == "test"
                expect(key.defaultValue) == ["test1", "test1"]
            }

            then("get a default value") {
                let key = DefaultsKey<String>("test")
                let value = defaults[key]
                expect(value) == key.defaultValue
            }

            then("get a custom-default value") {
                let key = DefaultsKey<String>("test", defaultValue: "default")
                let value = defaults[key]
                expect(value) == "default"
            }

            then("save a value") {
                let key = DefaultsKey<String>("test")
                let expectedValue = "custom value"
                defaults[key] = expectedValue

                let value = defaults[key]

                expect(value) == expectedValue
            }

            then("save a value for key with default custom value") {
                let key = DefaultsKey<String>("test", defaultValue: "default value")
                let expectedValue = "custom value"
                defaults[key] = expectedValue

                let value = defaults[key]

                expect(value) == expectedValue
            }
        }
    }
}
