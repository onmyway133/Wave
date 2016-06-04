# Wave
Chainable animations in Swift

[![CI Status](http://img.shields.io/travis/onmyway133/Wave.svg?style=flat)](https://travis-ci.org/onmyway133/Wave)
[![Version](https://img.shields.io/cocoapods/v/Wave.svg?style=flat)](http://cocoadocs.org/docsets/Wave)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Wave.svg?style=flat)](http://cocoadocs.org/docsets/Wave)
[![Platform](https://img.shields.io/cocoapods/p/Wave.svg?style=flat)](http://cocoadocs.org/docsets/Wave)

![](Screenshots/Banner.png)

## Features

- Declarative
- Run animations in sequence
- Run animations in parallel
- Support UIView and Core Animation animations
- Extensible
- Prefer composition over extensions

![](Screenshots/wave.gif)

### What is the chain

- A chain is a series of actions
- Every action in a chain runs in sequence
- An action knows how to do its job, and run next actions in the chain
- A chain is like a pull signal, it does not do the job until you call `run`

```swift
public protocol Action {

  init()
  func run(nextActions: [Action])
}
```
- Available actions
  - Wait: just delay
  - Custom: your custom code goes here
  - Log: `print` using `Custom`
  - View.Action: UIView animations
  - Layer.Action: Core Animation animations

**Example**: fade out, wait, fade in, log

```swift
Chain<View.Action>()
  .add(ViewBasicAnimation().view(box1).fadeOut())
  .thenLog("done fade out")
  .thenWait(1)
  .then()
  .add(ViewBasicAnimation().view(box1).fadeIn())
  .thenLog("done fade in")
  .run()
```

### What can we do with the chain

- Define a chain

```swift
let chain = Chain<View.Action>()
```

- Add an action to a chain

```swift
var wait = Wait()
wait.interval = 2

var custom = Custom()
custom.block = {
  print("wave")
}

chain.then(wait).then(custom)
```

- Switch the chain type. Since each action in a chain can do different things, the autocompletes and compilers shine when we're using the correct chain type

**Example** manipulating with layer action, then with view action

```swift
chain
  .then()
  .add(LayerSpringAnimation())
  .then(Chain<View.Action>())
  .add(ViewKeyframeAnimation())
```

- Run the chain

```swift
chain.run()
```

### Predefined animations with Ride

- Prefer composition over extensions
- Declare only `wave` on `UIView`, which returns a `Ride` for convenient animations

Available predefined rides

```swift
box1.wave.flipX().run()
```

- shake
- pop
- morph
- squeeze
- wobble
- swing
- flipX
- flipY
- flash

### UIView animation

- `View.Action` maintains a list of UIView animations, which can be run in parallel
- Each animation can be associated with a `UIView`, or be assigned `UIView` from `View.Action` automatically when it is inited
- `View.Action` completes when the longest animation completes

**Example** using view from `View.Action`, move and change background at the same time

```swift
Chain<View.Action>()
  .view(box2)
  .add(ViewBasicAnimation().fadeOut().moveX(20))
  .add(ViewBasicAnimation().changeBackground(UIColor.blueColor()))
  .run()
```

Supported animations

- ViewBasicAnimation:  UIView animation
- ViewKeyframeAnimation: UIView keyframe animation
- ViewSpringAnimation: UIView spring animation
- ViewSystemAnimation: UIView system animation
- ViewTransitionAnimation: UIView from/to transition animation

**Example** fade out 3 boxes at the same time, then fade in 3 boxes at the same time

```swift
Chain<View.Action>()
  .add(ViewBasicAnimation().view(box1).fadeOut())
  .add(ViewBasicAnimation().view(box2).fadeOut())
  .add(ViewBasicAnimation().view(box3).fadeOut())
  .then()
  .add(ViewBasicAnimation().view(box1).fadeIn())
  .add(ViewBasicAnimation().view(box2).fadeIn())
  .add(ViewBasicAnimation().view(box3).fadeIn())
  .run()
```

**Example** move down 2 times, then move left, then a custom spring animation

```swift
Chain<View.Action>()
  .add(ViewBasicAnimation()
    .view(box3)
    .moveY(100)
    .delay(2)
    .duration(3)
    .repeatCount(2)
    .options([UIViewAnimationOptions.CurveEaseIn]))
  .then()
  .add(ViewBasicAnimation().view(box2).moveX(-10))
  .then()
  .add(ViewSpringAnimation()
    .block {
      self.counter = (self.counter + 1) % 4
      box1.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4) * CGFloat(self.counter))
    })
  .run()
```

Available predefined UIView configurations

- move
- translate
- scale
- zoom
- rotate
- fade
- changeColor

### CALayer animation

Supported animations

- LayerBasicAnimation:  CALayer basic animation
- LayerKeyframeAnimation: CALayer keyframe animation
- LayerSpringAnimation: CALayer spring animation (available on iOS 9+)
- LayerTransitionAnimation: CALayer transition animation

Available Core Animation configurations

- move
- translate
- scale
- zoom
- rotate
- fade
- coolConfig: set the duration to 0.5 and use `EaseIn` timing function, which is cool

**Example** swing with layer, then move with view

```swift
box1.wave.swing()
  .then(Chain<View.Action>())
  .add(ViewBasicAnimation().view(box1).moveX(10))
  .then()
  .add(ViewBasicAnimation().view(box1).moveY(10))
  .run()
```

Useful types

- Layer.CalculationMode
- Layer.RotationMode
- Layer.FillMode
- Layer.TimingFunction

## Installation

**Wave** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Wave'
```

**Wave** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/Wave"
```

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **Wave**, check the [CONTRIBUTING](https://github.com/onmyway133/Wave/blob/master/CONTRIBUTING.md) file for more info.

## License

**Wave** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Wave/blob/master/LICENSE.md) file for more info.
