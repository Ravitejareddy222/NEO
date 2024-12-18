//
//  DeleteAndEditCartViewModel.h
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import <Foundation/Foundation.h>
#import "DeleteAndEditCartServices.h"

@class DeleteEditResponseHandler;

typedef void (^EditCartSuccessBlock)(void);
typedef void (^EditCartFailureBlock)(NSString *_Nullable errorMessage);

typedef void (^DeleteCartSuccessBlock)(void);
typedef void (^DeleteCartFailureBlock)(NSString *_Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface DeleteAndEditCartViewModel : NSObject

@property (nonatomic, strong) EditCartSuccessBlock editCartSuccessful;
@property (nonatomic, strong) EditCartFailureBlock editCartFailure;

@property (nonatomic, strong) DeleteCartSuccessBlock deleteCartSuccessful;
@property (nonatomic, strong) DeleteCartFailureBlock deleteCartFailure;


@property (nonatomic, strong) NSMutableDictionary *params;

-(void) deleteCart: (NSNumber *)productId;
-(void) editCart: (NSNumber *)productId quantity: (NSNumber *)quantity;

@property (nonatomic, strong) id<DeleteAndEditCartServicesProtocol> deleteEditProtocol;



@end

NS_ASSUME_NONNULL_END
