//
//  AddToCartModel.h
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddToCartResponse : NSObject
@property (nonatomic, nullable, strong) NSNumber *status;
@property (nonatomic, assign) BOOL data;
@property (nonatomic, nullable, strong) NSNumber *totalCart;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic, nullable, strong) NSString *userMsg;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
