/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <AsyncDisplayKit/ASControlNode.h>

typedef NS_ENUM(NSUInteger, ASImageNodeTint) {
  ASImageNodeTintNormal = 0,
  ASImageNodeTintGreyscale,
};

typedef UIImage *(^asimagenode_modification_block_t)(UIImage *);

// FIXME: This class should not derive from ASControlNode once ASButtonNode is implemented.
@interface ASImageNode : ASControlNode

@property (atomic, retain) UIImage *image; // The node will efficiently display stretchable images by using the layer's contentsCenter property.
                                              // Non-stretchable images work too, of course.

// This is a simple API if you want to tint the image
@property (nonatomic, assign) ASImageNodeTint tint;

#pragma mark - Cropping
//! @abstract Indicates whether efficient cropping of the receiver is enabled. Defaults to YES. See -setCropEnabled:recropImmediately:inBounds: for more information.
@property (nonatomic, assign, getter=isCropEnabled) BOOL cropEnabled;

/**
 @abstract Enables or disables efficient cropping.
 @param cropEnabled YES to efficiently crop the receiver's contents such that contents outside of its bounds are not included; NO otherwise.
 @param recropImmediately If the receiver has an image, YES to redisplay the receiver immediately; NO otherwise.
 @param cropBounds The bounds into which the receiver will be cropped. Useful if bounds are to change in response to cropping (but have not yet done so).
 @discussion Efficient cropping is only performed when the receiver's view's contentMode is UIViewContentModeScaleAspectFill. By default, cropping is enabled. The crop alignment may be controlled via cropAlignmentFactor.
 */
- (void)setCropEnabled:(BOOL)cropEnabled recropImmediately:(BOOL)recropImmediately inBounds:(CGRect)cropBounds;

/**
 @abstract A value that controls how the receiver's efficient cropping is aligned.
 @discussion This value defines a rectangle that is to be featured by the receiver. The rectangle is specified as a "unit rectangle," using percentages of the source image's width and height, e.g. CGRectMake(0.5, 0, 0.5, 1.0) will feature the full right half a photo. If the cropRect is empty, the content mode of the receiver will be used to determine its dimensions, and only the cropRect's origin will be used for positioning. The default value of this property is CGRectMake(0.5, 0.5, 0.0, 0.0).
 */
@property (nonatomic, readwrite, assign) CGRect cropRect;

/**
 @abstract An optional block which can perform drawing operations on {@ref image} during the display phase.
 @discussion Can be used to add image effects (such as rounding, adding borders, or other pattern overlays) without extraneous display calls.
 */
@property (nonatomic, readwrite, copy) asimagenode_modification_block_t imageModificationBlock;

#pragma mark -
/**
 @abstract Marks the receiver as needing display and performs a block after display has finished.
 @param displayCompletionBlock The block to be performed after display has finished.
 @param canceled YES if display was prevented or canceled (via preventOrCancelDisplay); NO otherwise.
 @discussion displayCompletionBlock will be performed on the main-thread. If `preventOrCancelDisplay` is YES, `displayCompletionBlock` is will be performed immediately and `YES` will be passed for `canceled`.
 */
- (void)setNeedsDisplayWithCompletion:(void (^)(BOOL canceled))displayCompletionBlock;

@end
