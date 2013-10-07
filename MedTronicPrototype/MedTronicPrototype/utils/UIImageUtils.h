//
//  UIImageUtils.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageUtils : NSObject
+ (UIImage*)image:(UIImage*)image tintedWithLinearGradientColors:(NSArray *)colorsArr scale:(CGFloat)scale size:(CGSize)size;
+ (UIImage*)image:(UIImage*)image clearRect:(CGRect)rect;
+ (UIImage*)image:(UIImage*)image clipWithRadius:(CGFloat)r;
+ (UIImage*)image:(UIImage*)image clipWithTransparentRect:(CGRect)rect;
+ (CALayer*)gradientLayerWithColors:(UIColor *)color;
+ (CALayer*)lightningBottomLayerForBounds:(CGRect)bounds;
@end
