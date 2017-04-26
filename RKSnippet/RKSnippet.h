#ifndef RKSnippet_h
#define RKSnippet_h

@interface RKSnippet : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *highlight;
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSNumber *linenos;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSNumber *style;

@end

#endif /* RKSnippet_h */
