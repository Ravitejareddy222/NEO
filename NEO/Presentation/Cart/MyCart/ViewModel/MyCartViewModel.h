//
//  MyCartViewModel.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <Foundation/Foundation.h>
#import "MyCartServices.h"
#import "MyCartModel.h"

@class MyCartResponseHandler;

typedef void (^MyCartSuccessBlock)(void);
typedef void (^MyCartFailureBlock)(NSString *_Nullable errorMessage);

NS_ASSUME_NONNULL_BEGIN

@interface MyCartViewModel : NSObject

@property (nonatomic, strong) MyCartSuccessBlock myCartDetailsFetchSuccessful;
@property (nonatomic, strong) MyCartFailureBlock myCartDetailsFetchFailure;

@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) NSArray<MyCartData*> *myCartData;

-(void) getCartList;

@property (nonatomic, strong) id<MyCartServicesProtocol> myCartProtocol;

@end

NS_ASSUME_NONNULL_END
