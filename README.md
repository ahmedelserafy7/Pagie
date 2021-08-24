# Pagie

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <img src="https://img.shields.io/badge/version-1.0-blue.svg" />
    <img src="https://img.shields.io/cocoapods/l/MyCocoapodsLibrary.svg" />
    <img src="https://img.shields.io/cocoapods/p/MyCocoapodsLibrary.svg?style=flat" alt="Platform" />
</p>


<p align="center">
  <img src="https://i.imgur.com/fuZA4pI.gif" width="480" height="400" alt="pagie1">
</a>

Welcome to Pagie, a flexible library that helps you navigate between pages using gestures.

## Installation

You can use [CocoaPods](https://cocoapods.org) by adding the following line to your `Podfile`:

```ruby
pod 'Pagie'
```

## Usage

1. First thing first, all you have to do is to import it:

```swift
import Pagie
```
2. Rename your `UIViewController` superclass, and set it to `PagieHome`.

```swift
class ViewController: PagieHome
```

3. Fill your pages information by by creating a new instance of `Page` type, and use the initializer to set the initial value of stored properties `title`, `subtitle`, and `imageName`, and set them to `self.pages`.
```swift
let page1 = Page(title: "Discover great events happening in your city", subtitle: "Find events by category and browse list of trending events everyday.", imageName: "page1")
let page2 = Page(title: "Maximize the value of every event you attend", subtitle: "Stay updated with event details, meet other attendees and get live announcements about important updates.", imageName: "page2")
let page3 = Page(title: "Make the most out of every event", subtitle: "View updated agenda, sessions details and speakers from your phone.", imageName: "page3")
let page4 = Page(title: "Network like a pro!", subtitle: "Join the event's community, like-minded people and shake hands through the app to keep track of your connections.", imageName: "page4")

let pages: [Page] = [page1, page2, page3, page4]
self.pages = pages

// Define how many dots you like:
pageControl.numberOfPages = self.pages.count
```

### Note:
 - Don't forget to add your images to `assets`

## Demo
<img src= "https://i.imgur.com/ZvCA7ID.gif" height="560" alt="repetition">

## Powerful Customization
Since your app is up and running, you may need to configure, customize, and add your own page.

Customize your page control indicator color:

```swift
pageControl.pageIndicatorTintColor = .gray
```
Customize your "current" page control indicator color:

```swift
pageControl.currentPageIndicatorTintColor = .magenta
```
Change your button background color:

```swift
getStartedButton.backgroundColor = .cyan
```
Rename your button name:

```swift
getStartedButton.setTitle("Sign up", for: .normal)
```
Customize your button width and height:

```swift
customizeButton(width: 100, height: 100)
```
Remove your button:

```swift
getStartedButton.removeFromSuperview()
```
Handle getStartedButton method:

```swift
override func handleGetStartedButton() {
    print("Hello world!")
}
```

Setup your login page:

1. Declare your `loginId` identifier:
```swift
fileprivate let myLoginId = "myLoginId"
```
2. Register a `UICollectionViewCell` subclass for use with your collection view, so that new cells are dequeued and re-use automatically by the system:
```swift
collectionView.register(MyLoginCell.self, forCellWithReuseIdentifier: myLoginId)
```
3. Customize your login view cell in code:
```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item != pages.count else {
            guard let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: myLoginId, for: indexPath) as? MyLoginCell else { return UICollectionViewCell() }
            return loginCell
        }
        
        return setupPageCell(by: collectionView, and: indexPath)
    }
```
4.  Create your own custom `UICollectionViewCell` subclass:
```swift
import MyPageControl
class MyLoginCell: LoginCell {
    override func setupViews() {
        self.backgroundColor = .blue
    }
}
```

Additional sample examples can be found in [`/PagieExample/ViewController`](https://github.com/ahmedelserafy7/Pagie/blob/master/PagieExample/PagieExample/ViewController.swift), and [`/PagieExample/MyLoginCell`](https://github.com/ahmedelserafy7/Pagie/blob/master/PagieExample/PagieExample/MyLoginCell.swift).

### Note: 
Start out simple, and customize when needed.

---

## Contributing

Having trouble working with Pagie? Found a typo in the documentation? Interested in adding a feature or [fixing a bug](https://github.com/ahmedelserafy7/Pagie/issues)? Then by all means [submit an issue](https://github.com/ahmedelserafy7/Pagie/issues/new) or [pull request](https://help.github.com/articles/using-pull-requests/). If this is your first pull request, it may be helpful to read up on the [GitHub Flow](https://guides.github.com/introduction/flow/) first.

**Please keep this in mind when requesting features and/or submitting pull requests:**
- Pagie is developed completely in the open, and your contributions are more than welcome.
- Pagie has been designed as a base for you to customize and fit your page's unique needs. 
- It’s highly recommended that you spend a few minutes familiarizing yourself with its documentation and internal implementation, so that you’ll be ready to tackle any issues or edge cases that you might encounter.

### Pull Requests

When submitting a pull request:

1. Clone the repo.
2. Create a branch off of `master` and give it a meaningful name (e.g. `my-awesome-new-feature`).
3. Open a pull request on GitHub and describe the feature or fix.

---

## Credits

### Creator
**Ahmed Elserafy**
- <ahmed.samer43@yahoo.com>

**Be the next one**
