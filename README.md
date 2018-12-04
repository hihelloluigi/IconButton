# IconButton

[![CI Status](https://img.shields.io/travis/d30161ee00f0e6adad3b886b1bfd0d064d7933f2/IconButton.svg?style=flat)](https://travis-ci.org/d30161ee00f0e6adad3b886b1bfd0d064d7933f2/IconButton)
[![Version](https://img.shields.io/cocoapods/v/IconButton.svg?style=flat)](https://cocoapods.org/pods/IconButton)
[![License](https://img.shields.io/cocoapods/l/IconButton.svg?style=flat)](https://cocoapods.org/pods/IconButton)
[![Platform](https://img.shields.io/cocoapods/p/IconButton.svg?style=flat)](https://cocoapods.org/pods/IconButton)

## Getting Started

### Storyboard
- Go to **main.storyboard** and add a **blank UIBUtton**
- Open the **Identity Inspector** and type '**IconButton**' the '**class**' field
- Make sure you have '**IconButton**' selected in '**Module**' field
- Switch to the **Attributes Inspector** and **configure** it as you like. 

![CardViewStoryboard](https://github.com/mo3bius/IconButton/blob/master/Images/Storyboard_example.png)

## Example

A small example of a normal iOS button and what you can do with the library.

<div class="row">
    <div class="column">
        <img src="https://github.com/mo3bius/IconButton/blob/master/Images/button_FB_classic.png" alt="Classic" style="width:100%">
    </div>
    <div class="column">
        <img src="https://github.com/mo3bius/IconButton/blob/master/Images/button_FB_custom.png" alt="Custom" style="width:100%">
    </div>
</div>


## Customization

```swift
var clickAlphaComponent: CGFloat
var title: String?
var titleColor: UIColor?
var image: UIImage?
var imageTintColor: UIColor?
var isCircle: Bool
var cornerRadius: CGFloat
var borderWidth: CGFloat
var borderColor: UIColor
var shadowRadius: CGFloat
var shadowOpacity: CGFloat
var shadowOffSet: CGFloat
var shadowColor: UIColor
```

## Prerequisites

- **Xcode 9.0** or newer
- **Swift 4.0**

## Installation

### Cocoapods
```
use_frameworks!
pod 'IconButton'
```


## Author

Luigi Aiello, luigiaiello97@gmail.com

## License

IconButton is available under the MIT license. See the LICENSE file for more info.
