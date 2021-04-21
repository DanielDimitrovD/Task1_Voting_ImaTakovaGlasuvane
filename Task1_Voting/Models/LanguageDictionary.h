//
//  LanguageDictionary.h
//  Task1_Voting
//
//  Created by A-Team Intern on 20.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LanguageType) {
    ENGLISH = 0,
    BULGARIAN = 1,
    TURKISH = 2
};

@interface LanguageDictionary : NSObject
+ (instancetype)sharedLanguageDictionary;
- (NSString *)stringForKey:(NSString *)englishWord;
- (void)setLanguage:(LanguageType)language;
@end

NS_ASSUME_NONNULL_END
