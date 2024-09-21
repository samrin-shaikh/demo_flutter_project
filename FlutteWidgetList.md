# Flutter Widgets Guide

## Layout Widgets
1. **Container**
    - A versatile widget for layout, styling, and alignment.
2. **Column & Row**
    - Used for arranging widgets vertically (Column) or horizontally (Row).
3. **Stack**
    - Overlaps widgets on top of each other.
4. **Padding**
    - Adds padding around a widget.
5. **Align**
    - Aligns child widgets within their parent.
6. **SizedBox**
    - A box with a fixed size to add space between widgets.
7. **Expanded and Flexible**
    - Used within rows or columns to expand and fill available space.
8. **Wrap**
    - Arranges child widgets in multiple rows or columns when space is limited.
9. **AspectRatio**
    - Forces the child widget to have a specific aspect ratio.
10. **FittedBox**
    - Scales and fits a child widget within its parent, useful for maintaining proportion across screen sizes.
11. **Spacer**
    - Creates adjustable space between widgets in **Row** and **Column**.

## Content Display Widgets
12. **Text**
    - Displays text on the screen with various styling options.
13. **RichText**
    - Displays text with mixed styles (e.g., different fonts, sizes, colors).
14. **Image**
    - Displays an image from assets, network, or memory.
15. **Icon**
    - Displays a material design icon.
16. **Card**
    - A material design card with elevation and rounded corners.

## Input Widgets
17. **TextField**
    - An input widget for text entry.
18. **Checkbox, Radio, and Switch**
    - Interactive widgets for selecting or toggling options.
19. **Slider**
    - A widget for selecting a value from a range.
20. **Form and FormField**
    - Used for building forms and validating user input.

## Button Widgets
21. **ElevatedButton**
    - A button with elevation.
22. **TextButton**
    - A button without background.
23. **IconButton**
    - A button with an icon.
24. **FloatingActionButton**
    - A circular button that floats above content.

## Navigation Widgets
25. **Navigator**
    - Manages app navigation and routing between different screens.
26. **TabBar & TabBarView**
    - Creates a tabbed interface with swipeable views.
27. **BottomNavigationBar**
    - A bar at the bottom of the app for navigation between different screens.
28. **Drawer**
    - A side navigation menu.
29. **PageView**
    - A scrollable view that allows users to swipe between different pages.

## Scrollable Widgets
30. **ListView**
    - Displays a scrollable list of widgets.
31. **GridView**
    - Displays widgets in a grid format.
32. **CustomScrollView**
    - A scrollable area that can contain various types of slivers (scrollable elements), including custom scroll effects.
33. **SliverList and SliverGrid**
    - Efficiently renders large lists or grids as part of a **CustomScrollView**.
34. **ReorderableListView**
    - A list where items can be reordered by dragging.

## App Structure Widgets
35. **MaterialApp**
    - The root widget for any material design app. Provides default themes, navigation, and localization.
36. **Scaffold**
    - Provides a structure for app pages, including app bar, floating action button, etc.
37. **AppBar**
    - A toolbar for the app that typically contains a title and actions.
38. **SliverAppBar**
    - Creates an app bar that can collapse and expand as the user scrolls.
39. **SafeArea**
    - Ensures that content is displayed within the safe area of the screen (i.e., not under the notch, status bar, etc.).

## Styling and Decoration Widgets
40. **Theme & ThemeData**
    - Defines the color scheme, fonts, and overall appearance of the app.
41. **Color**
    - Used for defining colors for widgets (e.g., background, text, etc.).
42. **Typography**
    - Customizes fonts and text styles in the app, including **GoogleFonts** for using custom fonts.
43. **DecoratedBox**
    - Provides decoration like background color, image, border, and shadows to a child widget.
44. **BoxDecoration**
    - A powerful decoration widget used inside **Container** for adding gradients, borders, and rounded corners.
45. **ShapeDecoration**
    - Allows creating custom shapes and shadows for widgets.
46. **Divider**
    - Adds a horizontal or vertical divider between widgets.

## Gesture and Interaction Widgets
47. **GestureDetector**
    - Detects gestures such as taps, swipes, and drags.
48. **InkWell**
    - Provides material design ripple effects on touch.
49. **Draggable, DragTarget, and LongPressDraggable**
    - Widgets that allow dragging and dropping functionality.

## Animation Widgets
50. **AnimatedContainer**
    - For smooth size, color, and shape transitions.
51. **AnimatedOpacity**
    - For fading animations.
52. **Hero**
    - Enables smooth transitions between routes with shared elements.
53. **AnimatedCrossFade**
    - Cross-fades between two widgets with an animation.
54. **AnimatedBuilder**
    - Allows for complex animations in a clean and efficient way by rebuilding only the animated parts.
55. **PositionedTransition & SlideTransition**
    - Widgets for moving UI elements with smooth animations.
56. **AnimatedPositioned**
    - Animates the position of a widget within a **Stack**.

## Transformation Widgets
57. **Transform**
    - Applies transformations such as scaling, rotating, and translating a widget.
58. **RotatedBox**
    - Rotates the widget by multiples of 90 degrees.
59. **Opacity**
    - Controls the transparency of a widget.

## Clipping Widgets
60. **ClipRRect**
    - Clips a child widget with rounded corners or custom shapes.
61. **ClipPath**
    - Clips a widget using a custom shape (e.g., waves, triangles).
62. **ClipOval**
    - Clips a widget into an oval or circle shape.

## Feedback Widgets
63. **AlertDialog**
    - Displays modal dialogs with options such as confirm and cancel.
64. **SnackBar**
    - Displays brief messages at the bottom of the screen, often used for feedback.
65. **Tooltip**
    - Displays a tooltip (hint) when a user long-presses or hovers over a widget.

## Responsive Design Widgets
66. **LayoutBuilder**
    - Builds widgets based on the constraints of the parent widget, useful for responsive design.
67. **MediaQuery**
    - Retrieves the screen size, orientation, and other device attributes to build responsive layouts.

## Performance Optimization Widgets
68. **RepaintBoundary**
    - Used for optimizing the performance of child widgets that don't need to repaint often.

## Custom Painting Widgets
69. **CustomPaint**
    - Enables custom drawing on the canvas, useful for creating complex shapes or visual effects.

## Platform-Specific Widgets
70. **Cupertino Widgets**
    - Widgets styled to look like iOS components (e.g., **CupertinoButton**, **CupertinoNavigationBar**).

## Miscellaneous Widgets
71. **Positioned**
    - Used within a **Stack** to position widgets relative to their parent.
72. **Ink**
    - Displays ink effects (e.g., ripple) when touching a button or any other clickable widget.
73. **BackdropFilter**
    - Applies a filter to the background, often used to create a blurred background effect.
74. **FlexibleSpaceBar**
    - Creates a flexible app bar that can have backgrounds, titles, and expanded headers that resize based on scrolling.
75. **FutureBuilder & StreamBuilder**
    - Builds widgets based on asynchronous data (Future or Stream).