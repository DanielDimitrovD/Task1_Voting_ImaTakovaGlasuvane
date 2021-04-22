//
//  LanguageDictionary.m
//  Task1_Voting
//
//  Created by A-Team Intern on 20.04.21.
//

#import "LanguageDictionary.h"

@interface LanguageDictionary()
@property (strong, nonatomic) NSDictionary *bulgarianTranslationDictionary;
@property (strong, nonatomic) NSDictionary *turkishTranslationDictionary;
@property (assign, nonatomic) EnumLanguage currentLanguage;
@end

@implementation LanguageDictionary

+ (instancetype)sharedLanguageDictionary {
    static LanguageDictionary *sharedLanguageDictionary = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
      sharedLanguageDictionary = [[self alloc] init];
    });
    
    return sharedLanguageDictionary;
}

- (instancetype)init {
    if (self) {
        
        self.bulgarianTranslationDictionary = @{
                                @"Bulgarian National Movement" : @"ВМРО",
                                @"We, the citizens" : @"Ние, гражданите",
                                @"Bulgarian National Union" : @"Български национален съюз - БНД" ,
                                @"Bulgarian Socialist Party" : @"БСП за България" ,
                                @"Revival" : @"Възраждане" ,
                                @"Alternative for Bulgarian Revival" : @"АБВ" ,
                                @"Attack" : @"Атака",
                                @"Conservative Union of The Far Right" : @"Консервативно обединение на десницата",
                                @"Movement for Rights and Freedoms" : @"ДПС",
                                @"Bulgarian Progressive Line" : @"Българска прогресивна линия",
                                @"Democratic Bulgaria" : @"Демократична България",
                                @"Revival of the Homeland" : @"Възраждане на Отечеството",
                                @"Movement \"Together for change\"" : @"Движение \"Заедно за промяната\"",
                                @"Bulgarian National Union" : @"Българско национално обединение - БНО",
                                @"Nation" : @"Партия \"Нация\"",
                                @"Moral, Initiative, Patriotism" : @"МИР",
                                @"Citizens from the Protest" : @"Граждани от Протеста",
                                @"Stand up! Get out!" : @"Изправи се! Мутри вън!",
                                @"People's Voice" : @"Глас Народен",
                                @"Movement of the non-party candidates" : @"Движение на непартийните кандидати",
                                @"Republicans for Bulgaria" : @"Републиканци за България",
                                @"The Right" : @"Партия \"Правото\"",
                                @"Prosperity-Unification-Building" : @"Благоденствие-Обединение-Градивност",
                                @"Patriotic Coalition - WILL and NFSB" : @"Патриотична коалиция - ВОЛЯ и НФСБ",
                                @"Green Party of Bulgaria" : @"Партия на Зелените",
                                @"Society for New Bulgaria" : @"Общество за Нова България",
                                @"Bulgarian Union for Direct Democracy" : @"Български съюз за директна демокрация",
                                @"GERB-SDS" : @"ГЕРБ-СДС",
                                @"There are such people" : @"Има такъв народ",
                                @"Direct Democracy" : @"Пряка демокрация",
                                @"Accept" : @"Потвърди",
                                @"Decline" : @"Отказ",
                                @"Vote" : @"Гласуване",
                                @"Back" : @"Назад",
                                @"Language" : @"Език",
                                @"Change language" : @"Смяна на езика" ,
                                @"Please choose a language from the options" : @"Моля изберете език от наличните" ,
                                @"English" : @"Английски" ,
                                @"Bulgarian" : @"Български" ,
                                @"Turkish" : @"Турски",
                                @"Legal voting confirmation" : @"Потвърждение за навършено пълнолетие",
                                @"Confirm that you are atleast 18 years old to vote!" : @"Потвърдете, че сте навършили 18 години за да може да гласувате!"
        };
        
        self.turkishTranslationDictionary = @{
                                @"Bulgarian National Movement" : @"Bulgar ulusal hareketi",
                                @"We, the citizens" : @"Biz vatandaşlar",
                                @"Bulgarian National Union" : @"Bulgar Ulusal Birliği" ,
                                @"Bulgarian Socialist Party" : @"Bulgar Sosyalist Partisi" ,
                                @"Revival" : @"Canlanma" ,
                                @"Alternative for Bulgarian Revival" : @"Bulgar Uyanışı için bir alternatif" ,
                                @"Attack" : @"Saldırı",
                                @"Conservative Union of The Far Right" : @"Hakkın muhafazakar birleşmesiД",
                                @"Movement for Rights and Freedoms" : @"Haklar ve Özgürlükler Hareketi",
                                @"Bulgarian Progressive Line" : @"Bulgar ilerici çizgisi",
                                @"Democratic Bulgaria" : @"Demokratik Bulgaristan",
                                @"Revival of the Homeland" : @"Anavatanın canlanması",
                                @"Movement \"Together for change\"" : @"Değişim için Birlikte Hareketi",
                                @"Bulgarian National Union" : @"Bulgar Ulusal Birleşmesi",
                                @"Nation" : @"Ulus",
                                @"Moral, Initiative, Patriotism" : @"Ahlak Girişimi Yurtseverlik",
                                @"Citizens from the Protest" : @"Protesto Vatandaşları",
                                @"Stand up! Get out!" : @"Ayağa kalk! Defol!",
                                @"People's Voice" : @"Vox Populi",
                                @"Movement of the non-party candidates" : @"Parti dışı adayların hareketi",
                                @"Republicans for Bulgaria" : @"Bulgaristan için Cumhuriyetçiler",
                                @"The Right" : @"Doğru Parti",
                                @"Prosperity-Unification-Building" : @"Refah-Birlik-İnşa Etme",
                                @"Patriotic Coalition - WILL and NFSB" : @"Vatanseverlik Koalisyonu - WILL ve NFSB",
                                @"Green Party of Bulgaria" : @"Yeşil Parti",
                                @"Society for New Bulgaria" : @"Yeni Bulgaristan Topluluğu",
                                @"Bulgarian Union for Direct Democracy" : @"Bulgar Doğrudan Demokrasi Birliği",
                                @"GERB-SDS" : @"ГЕРБ-СДС",
                                @"There are such people" : @"Böyle insanlar var",
                                @"Direct Democracy" : @"Doğrudan demokrasi",
                                @"Accept" : @"Кabullenmek",
                                @"Decline" : @"Azalma",
                                @"Vote" : @"Oy",
                                @"Back" : @"Geri",
                                @"Language" : @"Dil",
                                @"Change language" : @"Dili değiştir" ,
                                @"Please choose a language from the options" : @"Lütfen seçeneklerden bir dil seçin" ,
                                @"English" : @"İngilizce" ,
                                @"Bulgarian" : @"Bulgarca" ,
                                @"Turkish" : @"Türk",
                                @"Legal voting confirmation" : @"Yasal oylama onayı",
                                @"Confirm that you are atleast 18 years old to vote!" : @"Oy vermek için en az 18 yaşında olduğunuzu onaylayın!"
        };
        
        self.currentLanguage = EnumLanguageEnglish;
    }
    
    return self;
}

- (NSString *)stringForKey:(NSString *)englishWord {
    
    if (self.currentLanguage == EnumLanguageBulgarian) {
        return self.bulgarianTranslationDictionary[englishWord];
    } else if (self.currentLanguage == EnumLanguageTurkish) {
        return self.turkishTranslationDictionary[englishWord];
    } else {
        return englishWord;
    }
}

- (void)setLanguage:(EnumLanguage)language {
    self.currentLanguage = language;
}

@end
