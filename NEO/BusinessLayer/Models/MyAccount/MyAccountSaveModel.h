//
//  MyAccountSaveModel.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
@class SaveData;

NS_ASSUME_NONNULL_BEGIN

@interface MyAccountDetailsSaveResponse : NSObject

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, assign) BOOL data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *userMsg;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
