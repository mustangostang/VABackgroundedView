//
//  VABackgroundedView.m
//  Chuckcha
//
//  Created by Vlad Andersen on 10/2/13.
//  Copyright (c) 2013 postrocketjump. All rights reserved.
//

#import "VABackgroundedView.h"

@interface VABackgroundedView ()

@property (nonatomic, strong) UIImageView  *underlyingBackgroundImageView;

@end


@implementation VABackgroundedView

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setBackgroundImageNamed: (NSString *) backgroundImageName
{
    [self setBackgroundImage: [UIImage imageNamed: backgroundImageName]];
}

- (void) setup
{
    if (![self underlyingBackgroundImageView]) {
        self.underlyingBackgroundImageView = [[UIImageView alloc] initWithFrame: [self bounds]];
        [self addSubview: _underlyingBackgroundImageView];
        [self sendSubviewToBack: _underlyingBackgroundImageView];
    }
}

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
    _underlyingBackgroundImageView.image = backgroundImage;
    [_underlyingBackgroundImageView sizeToFit];
    [self updateFrame];
}

- (void) setBackgroundImagePosition:(NSString *)backgroundImagePosition
{
    _backgroundImagePosition = backgroundImagePosition;
    NSDictionary *mappings = @{ @"": @"0% 0%", @"top": @"0% 0%", @"top left": @"0% 0%", @"top right": @"100% 0%",
                                @"center": @"50% 50%", @"top center": @"50% 0%", @"bottom center": @"50% 100%",
                                @"bottom": @"0% 100%", @"bottom center": @"@50% 100%", @"bottom right": @"100% 100%" };
    
    for (NSString* m in mappings) {
        if ([backgroundImagePosition isEqualToString: m]) _backgroundImagePosition = mappings[m];
    }
    
    [self updateFrame];
}

- (void) updateFrame
{
    CGRect underlyingFrame = _underlyingBackgroundImageView.frame;
    underlyingFrame.origin = self.frame.origin;
    underlyingFrame.size = _underlyingBackgroundImageView.image.size;

    NSArray* position = [_backgroundImagePosition componentsSeparatedByString: @" "];
  
    NSString *xPosition = [position objectAtIndex: 0];
    while (true) {
        if ([xPosition hasSuffix: @"%"]) {
            underlyingFrame.origin.x = round((self.frame.size.width - underlyingFrame.size.width) / 100 * [xPosition floatValue]);
            break;
        }
        underlyingFrame.origin.x = [xPosition intValue];
        break;
    }
    
    
    NSString *yPosition = [position objectAtIndex: 1];
    while (true) {
        if ([yPosition hasSuffix: @"%"]) {
            underlyingFrame.origin.y = round((self.frame.size.height - underlyingFrame.size.height) / 100 * [yPosition floatValue]);
            break;
        }
        underlyingFrame.origin.y = [yPosition intValue];
        break;
    }
    
    self.underlyingBackgroundImageView.frame = underlyingFrame;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrame];
}


@end
