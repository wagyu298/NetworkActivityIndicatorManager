// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

/*!
 @class SNASharedNetworkActivityIndicator
 @brief Shared manager for [UIApplication networkActivityIndicatorVisible].
 */
@interface SNASharedNetworkActivityIndicator : NSObject

/// @brief Enable networkActivityIndicatorVisible with sentinel object.
- (void)enableNetworkActivityIndicatorWithObject:(id <NSObject> _Nonnull)object;

/// @brief Disable networkActivityIndicatorVisible with sentinel object.
- (void)disableNetworkActivityIndicatorWithObject:(id <NSObject> _Nonnull)object;

/// @brief Returns shared networkActivityIndicatorVisible manager.
+ (instancetype _Nonnull)sharedIndicator;

@end
