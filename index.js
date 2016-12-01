"use strict";
//index.js
import React, {
  NativeEventEmitter,
  NativeModules
} from 'react-native';
import promisify from 'es6-promisify';
import { EventEmitter } from 'events';

const {MobSMS} = NativeModules;
// Event emitter to dispatch request and response from WeChat.
const emitter = new EventEmitter();

const smsNativeEvent = new NativeEventEmitter(MobSMS);  //创建自定义事件接口

let smsListener = smsNativeEvent.addListener('mobSMSEvent', (resp) => {
  emitter.emit(resp.type, resp);
});  //对应了原生端的名字

/**
 * @method registerApp
 * @param {String} appid - the app id
 * @return {Promise}
 */
export function registerApp(appKey, appSecret) {
  // let nativeFunc = MobSMS.registerApp;
  // if (!nativeFunc) {
  //   return undefined;
  // }
  // const promisified = promisify(nativeFunc, translateError);
  // return (...args) => {
  //   if (isAppRegistered) {
  //     return Promise.reject(new Error('App is already registered.'));
  //   }
  //   isAppRegistered = true;
  //   return promisified(...args);
  // };
  MobSMS.registerApp(appKey, appSecret)
};

export function getVerificationCode(phoneNumber,zone,customIdentifier) {
  return new Promise((resolve, reject) => {
    MobSMS.getVerificationCodeByMethod(0,phoneNumber,zone,customIdentifier,() => {});
    emitter.once('getVerificationCode.Resp', (resp) => {
      
      //TODO 调用reject，会触发root has been cancelled 异常，
      // if (result == '0') {
      //   console.info("resolve:")
      //   resolve(resp);
      // } else {
      //   console.info("reject:")
      //   reject(resp);
      // }

      resolve(resp)
    });
  });
}

export function commitVerificationCode(code,phoneNumber,zone) {
  return new Promise((resolve, reject) => {
    MobSMS.commitVerificationCode(code,phoneNumber,zone,() => {});
    emitter.once('commitVerificationCode.Resp', (resp) => {

      //TODO 调用reject，会触发root has been cancelled 异常，
      // if (result == '0') {
      //   resolve(resp);
      // } else {
      //   console.info("reject:")
      //   reject(result);
      // }

      resolve(resp)
    });
  });
}
