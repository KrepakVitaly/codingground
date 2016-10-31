// Разработать программу сортировки целочисленного массива в соответствии 
// с поставленными требованиями. 
//  
//  Общий алгоритм работы программы: 
//   - Чтение входного файла. 
//   - Поочередное преобразование строки чисел в «массив». 
//     Определенный вид «массива» жестко задан в индивидуальном задании. 
//   - Сортировка каждого «массива». (метод сортировки – блочная (циклический буфер)) 
//   - Запись отсортированного «массива» в строку выходного файла. 
 
//  По окончании работы программа выводит в консоль:
//   - время работы в миллисекундах, 
//   - среднюю длину строки 
//   - и количество обработанных строк. 
//   -  перевод строки (“n”)
// Никакой другой текстовой или числовой информации, или единиц измерения не выводится.

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//   NSLog (@"-----------------------------------------------------------------");
   NSDate *date = [NSDate date];

   NSString* fileName = @"filename.txt";
   NSString *fileString = [NSString stringWithContentsOfFile: fileName];
   
   NSArray *lines = [fileString componentsSeparatedByString:@"\n"];    
   
   NSMutableArray *block_x = [[[NSMutableArray alloc] init] autorelease];
   NSMutableArray *new_lines = [[[NSMutableArray alloc] init] autorelease];

   // Разбор файла построчно
   int proc_line_count = 0;
   int total_str_length = 0;
   
   for(NSString *element in lines)
   {  
      [block_x removeAllObjects];
    //   NSLog (@"String processing");
      // Читаем строку целых чисел, разделенных пробелами и формируем массив чисел
      NSArray *readed = [element componentsSeparatedByString: @" "];
      
      for(NSString* string in readed)
      {
        NSNumber* numberWithInt =  [NSNumber numberWithInt:[string integerValue]]; 
        [block_x addObject:numberWithInt];
        // NSLog(@"%d",  [numberWithInt integerValue]);
      }
    
      //Упорядочиваем массив
      NSArray *sorted_Array = [block_x sortedArrayUsingSelector:@selector(compare:)];
      
    //   NSLog (@"Sorting String processing");
    //   for(NSNumber* num in sorted_Array)
    //   {
    //     NSLog(@"%d",  [num integerValue]);
    //   }
    
    //Выводим массив в строку
    [new_lines addObject:[sorted_Array componentsJoinedByString:@" "]];
    // NSLog (@"%@", [new_lines objectAtIndex:0]);
    proc_line_count += 1;
    total_str_length += [element length];
   }
//   NSLog (@"-----------------------------------------------------------------");
   
   NSString *new_fileString = [new_lines componentsJoinedByString:@"\n"];

   NSData *fileContents = [new_fileString dataUsingEncoding:NSUTF8StringEncoding];
   [[NSFileManager defaultManager] createFileAtPath:@"./new_filename.txt"
                                   contents:fileContents
                                   attributes:nil];


   double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
   NSLog (@"%f ms", timePassed_ms);
   NSLog (@"%d", proc_line_count);
   double average_length = ((float) total_str_length)/((float) proc_line_count);
   NSLog (@"%f", average_length);
   NSLog (@"\n");
   
   [pool drain];
   return 0;
}
