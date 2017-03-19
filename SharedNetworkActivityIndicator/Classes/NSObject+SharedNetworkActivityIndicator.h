// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

/*!
 @brief Protocol to provide per object access to
 [UIApplication networkActivityIndicatorVisible] instance.
 */
@interface NSObject (SharedNetworkActivityIndicator)

/// @brief Access to networkActivityIndicatorVisible.
@property (nonatomic,
           getter=sna_networkActivityIndicatorVisible,
           setter=sna_setNetworkActivityIndicatorVisible:) BOOL sna_networkActivityIndicatorVisible;

@end
