//
//  UIImageUtils.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageUtils : NSObject
+ (UIImage*)image:(UIImage*)image clipWithRadius:(CGFloat)r;
+ (UIImage*)image:(UIImage*)image clipWithTransparentRect:(CGRect)rect;
+ (CALayer*)gradientLayerWithColors:(UIColor *)color;
+ (CALayer*)lightningBottomLayerForBounds:(CGRect)bounds;
+ (CALayer*)clipLayerForBounds:(CGRect)bounds withCornerRadius:(CGFloat)cornerRadius;
@end
