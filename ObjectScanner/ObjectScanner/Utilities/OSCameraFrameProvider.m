//
//  OSCameraFrameProvider.m
//  ObjectScanner
//
//  Created by Ismail Bozkurt on 18/07/2015.
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Ismail Bozkurt
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "OSCameraFrameProvider.h"

@interface OSCameraFrameProvider()

@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation OSCameraFrameProvider

#pragma mark - Lifeycle

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _images = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Utilities

+ (NSString *)stringForFile:(NSString *)fileName extension:(NSString *)extension
{
    NSString *resourceFileName = fileName;
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:resourceFileName ofType:extension];
    NSError *error;
    
    NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:&error];

    return fileString;
}

+ (UIImage *)imageForFilePrefix:(NSString *)filePrefix
{
    NSString *imageName = filePrefix;
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
    
    //if you want to read images from csv file uncomment below.
//    NSString *resourceFileName = [NSString stringWithFormat:@"%@", filePrefix];
//    NSString *fileString = [self stringForFile:resourceFileName extension:@"png"];
//    if (!fileString) {
//        NSLog(@"Error reading file.");
//    }
//    
//    NSArray *channels = [fileString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n;"]];
//    
//    unsigned c = (unsigned)(kOSCameraFrameProviderWidth*kOSCameraFrameProviderHeight * 4);//file only contains r,g and b data alpha is always 1
//    uint8_t *bytes = malloc(sizeof(*bytes) * c);//
//    
//    unsigned i;
//    for (i = 0; i < kOSCameraFrameProviderWidth*kOSCameraFrameProviderHeight; i++)
//    {
//        unsigned ind = 4*i;
//        unsigned dataInd = 3*i;
//        //r
//        NSString *str = [channels objectAtIndex:dataInd];
//        int byte = [str intValue];
//        bytes[ind + 2] = (uint8_t)byte;
//        
//        //g
//        str = [channels objectAtIndex:dataInd+1];
//        byte = [str intValue];
//        bytes[ind+1] = (uint8_t)byte;
//        
//        //b
//        str = [channels objectAtIndex:dataInd+2];
//        byte = [str intValue];
//        bytes[ind] = (uint8_t)byte;
//        
//        //a
//        bytes[ind+3] = (uint8_t)255;
//    }
//    
//    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, bytes, c * 4, NULL);
//
//    int bitsPerComponent = 8;
//    int bitsPerPixel = 32;
//    int bytesPerRow = 4*kOSCameraFrameProviderWidth;
//    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
//    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault |kCGImageAlphaLast;
//    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
//    CGImageRef imageRef = CGImageCreate(kOSCameraFrameProviderWidth,
//                                        kOSCameraFrameProviderHeight,
//                                        bitsPerComponent,
//                                        bitsPerPixel,
//                                        bytesPerRow,
//                                        colorSpaceRef,
//                                        bitmapInfo,
//                                        provider,
//                                        NULL,
//                                        NO,
//                                        renderingIntent);
//    
//    /*I get the current dimensions displayed here */
//    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
//    CGDataProviderRelease(provider);
//    CGColorSpaceRelease(colorSpaceRef);
//    return newImage;
}

@end
