# iOS 14 Widget Example

This is an example project which demonstrates a bug(?) with the new iOS 14 WidgetKit Extension.

It is unable to reliably render on device or simulator on the first try. Deleting the widget from the homescreen and placing it again does however make it render as expected.

## To reproduce

1. Build and run the project on a physical device or simulator.

2. Open the app to make sure the widgets are initialized for the homescreen.

3. Tap and hold on the homescreen and place the medium widget anywhere you'd like.

4. Tap the widget to pick one of the two presets. Either 'salted bread' (working) or 'premium bread' (broken).

	4.1 When using `working`, the text should render on the widget properly and reliably.
	4.2 When using `broken`, the text will not render on the widget on the first try. Deleting the widget and placing it again may get it to work.

I'm unsure why the `broken` widget is not rendering as expected.

## Fake data
This project uses `Data/fakeData.swift` to define the configuration for both example widgets.

## Rendering
The UI can be found inside `WidgetExtension/Medium/MediumWidgetUI.swift`. It contains a simple `forEach` to loop over the data inside `entry.ingredients`.


## [Demo video](https://i.imgur.com/ugSPC8z.mp4)
