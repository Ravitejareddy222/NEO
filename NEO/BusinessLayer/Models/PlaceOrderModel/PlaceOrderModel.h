//
//  PlaceOrderModel.h
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlaceOrderResponse : NSObject
@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
