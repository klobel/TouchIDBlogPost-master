

#import <Foundation/Foundation.h>

@interface PITouchIDManager : NSObject

+ (void)authenticateUserWithSuccess:(void (^)(BOOL result))successBlock
                            failure:(void (^)(NSError *error))failureBlock;

@end
