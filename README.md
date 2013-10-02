VABackgroundedView
==================

*An UIView subclass with a drop-in no-repeat background image.*

It's not great at all to have a separate UIImageView to support a no-repeat background image 
(as opposed to `backgroundColor = [UIColor colorWithPatternImage: (UIImage *)]`). It's becoming even worse with positions.

How about this?

```
VABackgroundedView *view = [[VABackgroundedView alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
view.backgroundImage = [UIImage imageNamed: @"background"];
view.backgroundImagePosition = @"bottom right";
```

Even better, you can do this in Interface Builder directly:

![Interface Builder][1]

Enjoy! This project uses ARC and is developed for iOS7.

[1]: interface-builder.png
