// CyclicBuffer.h
#import <Foundation/Foundation.h>

@interface CyclicBuffer : NSObject {
    @protected 
            int buf_size;
            int tail;
            int head;
            BOOL isEmpty;
            BOOL isFull;
            NSMutableArray * buffer;
    }

@property (readonly) int buf_size;
@property (readonly) int tail;
@property (readonly) int head;
@property (readonly) BOOL isEmpty;
@property (readonly) BOOL isFull;
@property (readonly) NSMutableArray * buffer;

- (id)init;
- (id)initWithNSMutableArray:(NSMutableArray *)array;
- (void)print;
 - (int)pop;
 - (void)push:(int)x;

@end
