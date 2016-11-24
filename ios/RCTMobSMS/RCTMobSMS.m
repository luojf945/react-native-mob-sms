//
//  RCTQiYu.m
//  RCTQiYu
//
//  Created by JackYu on 16/8/30.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "RCTMobSMS.h"
#import "SMS_SDK/SMSSDK.h"
#import "RCTConvert.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"


@interface RCTMobSMS ()

@property (nonatomic, strong) NSString *unreadCountEventName;

@end



@implementation RCTMobSMS

@synthesize bridge=_bridge;

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(registerApp:(NSString*)appKey withSecret:(NSString*)appSecret) {
    [SMSSDK registerApp:appKey withSecret:appSecret];
}


RCT_EXPORT_METHOD(getVerificationCodeByMethod:(NSInteger)method
                  phoneNumber:(NSString *)phoneNumber
                  zone:(NSString *)zone
                  customIdentifier:(NSString *)customIdentifier
                  //                  result:(RCTResponseErrorBlock)result) {
                  callback:(RCTResponseErrorBlock)callback) {
    
    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethod)method
                            phoneNumber:phoneNumber
                                   zone:zone
                       customIdentifier:customIdentifier
                                 result:^(NSError *error) {
                                     callback(error);
                                 }];
}



RCT_EXPORT_METHOD(commitVerificationCode:(NSString *)code
                  phoneNumber:(NSString *)phoneNumber
                  zone:(NSString *)zone
                  //                  result:(SMSCommitCodeResultHandler)result) {
                  callback:(RCTResponseErrorBlock)callback) {
    
    [SMSSDK commitVerificationCode:code
                       phoneNumber:phoneNumber
                              zone:zone
                            result:^(SMSSDKUserInfo *userInfo, NSError *error) {
                                callback(error);
                            }];
}



@end
