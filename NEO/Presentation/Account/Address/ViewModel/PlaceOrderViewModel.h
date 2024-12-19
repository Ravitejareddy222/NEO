//
//  AddressViewModel.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
#import "PlaceOrderServices.h"
#import "PlaceOrderModel.h"

@class PlaceOrderResponseHandler;

typedef void (^PlaceOrderSuccessBlock)(void);
typedef void (^PlaceOrderFailureBlock)(NSString *_Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface PlaceOrderViewModel : NSObject

@property (nonatomic, strong) PlaceOrderSuccessBlock placeOrderDetailsFetchSuccessful;
@property (nonatomic, strong) PlaceOrderFailureBlock placeOrderDetailsFetchFailure;

@property (nonatomic, strong) NSMutableDictionary *params;

-(void) placeOrder: (NSString *)selectedAddress;

@property (nonatomic, strong) id<PlaceOrderServicesProtocol> placeOrderProtocol;

@property (nonatomic, nullable, strong) NSNumber *status;



@end

NS_ASSUME_NONNULL_END
