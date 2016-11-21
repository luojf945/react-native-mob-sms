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


@interface RCTMobSMS ()<MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSString *unreadCountEventName;

@end



@implementation RCTMobSMS

@synthesize bridge=_bridge;

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(toast:(NSString*)toast) {
}


RCT_EXPORT_METHOD(setUrlClickWithEventName:(NSString*)EventName) {

}







@end
