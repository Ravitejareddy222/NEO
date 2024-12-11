//
//  AddToCartViewModel.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>
#import "AddToCartServices.h"

@class AddToCartResponseHandler;

typedef void (^ AddToCartSuccessBlock)(void);
typedef void (^ AddToCartFailureBlock)(NSString * _Nullable errorMessage);


NS_ASSUME_NONNULL_BEGIN

@interface AddToCartViewModel : NSObject

@property (nonatomic, strong) AddToCartSuccessBlock addToCartSuccessful;
@property (nonatomic, strong) AddToCartFailureBlock addToCartFailure;

-(void) addToCart: (NSNumber *)productId quantity: (long) quantity;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, strong) id<AddToCartServicesProtocol> addToCartProtocol;

@end

NS_ASSUME_NONNULL_END
