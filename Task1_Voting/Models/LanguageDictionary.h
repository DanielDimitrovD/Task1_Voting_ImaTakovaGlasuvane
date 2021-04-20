//
//  LanguageDictionary.h
//  Task1_Voting
//
//  Created by A-Team Intern on 20.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanguageDictionary : NSObject {
    NSDictionary *sharedInstance;
}

@property (nonatomic, retain) NSDictionary *sharedInstance;
+ (id)sharedLanguageDictionary;
@end

NS_ASSUME_NONNULL_END
