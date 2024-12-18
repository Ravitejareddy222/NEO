//
//  PlaceOrderServices.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>
#import "PlaceOrderModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol PlaceOrderServicesProtocol <NSObject>

-(void) placeOrderData: params completion: (void (^)(PlaceOrderResponse *_Nullable response, NSError *_Nullable error))completion;

@end

@interface PlaceOrderServices : NSObject<PlaceOrderServicesProtocol>

@end

NS_ASSUME_NONNULL_END
