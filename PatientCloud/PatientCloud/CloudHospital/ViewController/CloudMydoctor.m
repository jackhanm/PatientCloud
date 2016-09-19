//
//  CloudMydoctor.m
//  PatientCloud
//
//  Created by yuhao on 16/4/26.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudMydoctor.h"
#import "JKAFNetTool.h"
#import "AFNetworking.h"
@implementation CloudMydoctor
- (void)viewDidLoad
{
      [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];
    NSLog(@"111");
    
    
    NSDictionary *parameters = @{@"regid" : @"", //诊断号
                                 
                                 @"alert" : @"YUHAO",//
                                 @"sound" : @"",
                                 @"tag": @"",
                                 @"category" : @""
                                 };
    
    NSString *str = @"http://wx.yunjiaopian.net/app/index.php/Home/index/iospatientpush";
    
//        NSString *str = @"http://wx.yunjiaopian.net/test/index.php/home/Report/applydiagnosis";
        NSString *urlstr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlstr];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
       request.HTTPMethod = @"POST";
         [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        NSDictionary *parameters = @{@"consult_code" : @"1898888",
//                                     @"CONSULT_PATIENTID" : @"1",
//                                        @"consult_region" : @"1",
//                                        @"consult_hospitalid" : @"1",
//                                        @"consult_divison" : @"1",
//                                        @"CONSULT_TYPE" : @"1",
//                                        @"CONSULT_MEMO" : @"1",
//                                        @"consult_symptoms" : @"1",
//                                        @"consult_purpose" : @"1",
//                                        @"CONSULT_USERID" : @"1",
//                                        @"consult_src" : @"1"
//                                                                        };
//    
    
       NSData *data =    [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPBody = data;
    
        NSURLSession *senssion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];
        NSURLSessionDataTask * PostT =  [senssion dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            id result = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", result);
        }];
        
        [PostT resume];
//
//    [JKAFNetTool PostNetWithURL:urlString body:nil bodyStyle:JKrequestJSON headFile:parameters responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
//          NSLog(@"请求成功，服务器返回的信息%@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//          NSLog(@"请求失败,服务器返回的信息%@",error);     }];
    


//
//    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
//    managers.responseSerializer = [AFJSONResponseSerializer serializer];
//     [managers.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
//    //进行POST请求
//    
//    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
//    
//            
//            
//            
//        
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"请求失败,服务器返回的信息%@",error);     }];


    
}
@end
