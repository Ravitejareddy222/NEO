//
//  DeleteAndEditCartServices.h
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import <Foundation/Foundation.h>
#import "DeleteAndEditCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DeleteAndEditCartServicesProtocol <NSObject>

-(void) saveEditCart: params completion: (void (^)(EditCartResponse *_Nullable response, NSError *_Nullable error))completion;

-(void) saveDeleteCart: params completion: (void (^)(DeleteCartResponse *_Nullable response, NSError *_Nullable error))completion;


@end

@interface DeleteAndEditCartServices : NSObject<DeleteAndEditCartServicesProtocol>

@end



NS_ASSUME_NONNULL_END
