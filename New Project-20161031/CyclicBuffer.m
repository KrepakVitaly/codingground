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
- (id)init:(int)size{
    if ( (self = [super init]) ) 
    {
      isEmpty = YES;
      isFull = NO;
      buf_size = size;
      head = 0;
      tail = 0;
      buffer = [NSMutableArray arrayWithCapacity:size];
      return self;
    }
    else
      return nil;
}

- (void)print{
    NSLog(@"asdf");
}

- (void)push:(int)x {
    //  NSLog(@"push");
    //  int prev_head = head;
     buf_size += 1;
     [buffer insertObject:[NSNumber numberWithInteger:x] atIndex:head];
     isEmpty = NO;
     if (head == buf_size-1)
       head = 0;
     else
       head += 1;
     if (head == tail)
       isFull = YES;
    //  NSLog(@"head_prev = %d    head = %d", prev_head, head);
     return;
}

- (int)pop {
    NSLog(@"pop");
    int prev_tail = tail;
    isFull = NO;
    buf_size -= 1;
    if (tail != 0)
      tail -= 1;
    else
      tail = buf_size - 1;
    if (head == tail)
       isEmpty = YES;
    NSLog(@"prev_tail = %d  tail = %d  head = %d  buf_size = %d", prev_tail, tail, head, buf_size);
    NSInteger popx = [[buffer objectAtIndex:prev_tail] intValue]; 
    return (int) popx;
}

@end
