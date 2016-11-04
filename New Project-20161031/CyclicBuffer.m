// CyclicBuffer.m
#import "CyclicBuffer.h"

@implementation CyclicBuffer{
        // Private instance variables
}

@synthesize buf_size;
@synthesize tail;
@synthesize head;
@synthesize isEmpty;
@synthesize isFull;
@synthesize buffer;

- (id)initWithNSMutableArray:(NSMutableArray *)array {
    if ( (self = [super init]) ) 
    {
      buffer = [array copy];
      tail = [buffer count] - 1;
      buf_size = [buffer count];
      head = 0;
      isEmpty = NO;
      return self;
    } else
        return nil;
}
- (id)init{
    if ( (self = [super init]) ) 
    {
      isEmpty = YES;
      isFull = NO;
      head = 0;
      tail = 0;
      buffer = [[NSMutableArray alloc] init];
      return self;
    }
    else
      return nil;
}

- (void)print{
    NSLog(@"asdf");
}

- (void)push:(int)x {
     [buffer insertObject:[NSNumber numberWithInteger:x] atIndex:head];
     isEmpty = NO;
     if (head == buf_size-1)
       head = 0;
     else
       head += 1;
     if (head == tail)
       isFull = YES;
     return;
}

- (int)pop {
    isFull = NO;
    NSInteger popx = [[buffer objectAtIndex:tail] intValue]; 
    if (tail != 0)
      tail -= 1;
    else
      tail = buf_size - 1;
    if (head == tail)
       isEmpty = YES;
    return (int) popx;
}

@end
