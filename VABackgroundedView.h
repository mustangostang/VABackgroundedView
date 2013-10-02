//
//  VABackgroundedView.h
//  Chuckcha
//
//  Created by Vlad Andersen on 10/2/13.
//  Copyright (c) 2013 postrocketjump. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VABackgroundedView : UIView

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSString *backgroundImagePosition;

- (void) setBackgroundImageNamed: (NSString *) backgroundImageName;

@end
