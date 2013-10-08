//
//  UIImageUtils.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UIImageUtils.h"

@implementation UIImageUtils

+ (CALayer*)lightningBottomLayerForBounds:(CGRect)bounds {
    UIColor *outerColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    UIColor *innerColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.endPoint = CGPointMake(0.5f, 0.0f);
    layer.startPoint = CGPointMake(0.5f, 1.0f);
    layer.frame = bounds;
    layer.colors = @[(id)outerColor.CGColor, (id)outerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor];
    layer.locations = @[@0.10, @0.20, @0.30, @0.40f];
    return layer;
}

/**
 *
 usage: set this shape as a views layer mask
 */
+ (CALayer*)clipLayerForBounds:(CGRect)bounds withCornerRadius:(CGFloat)cornerRadius {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                  byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight
                                                        cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    return shape;
}

+ (UIImage*)image:(UIImage*)image clipWithRadius:(CGFloat)r {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [[UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointZero, image.size}
                                cornerRadius:r] addClip];
    [image drawInRect:(CGRect){CGPointZero, image.size}];
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage*)image:(UIImage*)image clipWithTransparentRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(ctx, kCGBlendModeDifference);
    CGContextBeginTransparencyLayer(ctx, NULL);
    {
        CGContextSetFillColor(ctx, CGColorGetComponents([UIColor redColor].CGColor));
        
        CGContextAddPath(ctx, [UIBezierPath bezierPathWithRect:CGRectMake(0,100,image.size.width,image.size.height)].CGPath);
        CGContextFillPath(ctx);
        // the above two lines could instead be CGContextDrawImage()
        // or whatever else you're using to clear
    }
    CGContextEndTransparencyLayer(ctx);
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}



+ (CALayer*)gradientLayerWithColors:(UIColor *)color {
    
//    [ownerLayer.sublayers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        *stop = ([obj isKindOfClass:[CAGradientLayer class]]);
//        if (*stop){
//            [((CAGradientLayer*)obj) removeFromSuperlayer];
//        }
//    }];
//    
    CAGradientLayer *layer = [CAGradientLayer layer];
    
    layer.colors = [NSArray arrayWithObjects:
                    (id)[color CGColor],
                    (id)[[UIColor colorWithRed:1.0f
                                         green:1.0f
                                          blue:1.0f
                                         alpha:1.0f] CGColor],
                    nil];
    
    layer.locations = [NSArray arrayWithObjects:
                       [NSNumber numberWithFloat:0.0f],
                       [NSNumber numberWithFloat:0.5f],
                       nil];
    
    return layer;
//    layer.frame = ownerLayer.bounds;
}



@end
