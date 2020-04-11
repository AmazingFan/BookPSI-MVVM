package com.yf.bookpsi.config;

public class AlipayConfig {
    public static String app_id = "2016102300747438";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key  = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCNyOa4/OF2gHvDpXjGWAllZQhfjSRf17gCyi2MJxsC8g3OwQkRM96978sVUyCcEiWCHw5T/yqZEqJ/kL12vd6uOYJMJ9NDxEOfMsYzzeZFqqxXTuSqqCbMZ9Wh3xSD9i7fHylMTDrbgRKvvaQq/Hulm7bxbFtJx10bNuNc+Y6wVMUc9q08f/1326yJaJOyBjnVgkyzbfrR53DynAmn01oOPaYXjO8YeUWV/HcoW/ei0LNTxsrQGbUvzs6gUMiMFcHFqx+uJ1lJT7JNC9qYnVk4lR3WI2hK7DoRyN/RAyfO0DcXy7/48lcYH+I7Apb9urvwEj6vmv4JHm4OkXV3mBC3AgMBAAECggEBAIEGXOfkwGwtWfNdxr2AafSKb4c8kuhhD4QCZlaPU6ZnjacjxVORR1bDO6UJQ7ijTtzN1CUeJK6t5ZB+r9u5x0X28ZrJ9xhJJ1xdQT7tVWr6eODu22ptoPkMWL14m1vHETpcSiGzkTAlklK5GgdAQmkffejPOXe3ZAQa++ak93OAHQthj6JpsvpZ3btT8KCESWEqjzCv9sVcMyZXw/rx4zPqMyo2jjGFTKKBvJCnJ9zc6+OfGnH3VqVjweJRpkBP3iOinyoX1OxXZtvzKnrQ+wuCUNF1uvrL1Nn5B9v5Ec0xT0zYKfWzhQCR8Ob+Tk8FDqPnUcmOMm7QFxwODVBTudkCgYEA74oaZs01cR8z48y7KvJ8hcCwyyaMUqZqIoqRMhKOqFVKtRSIqKCcygBxUtw969XhJzBY0P7PxkD2aiMpgEeOb7antHuINmiDXVoGhL10XemfIWOsV+OnBYhhyumlxxCkRLs0KMUojY1cc1S9CaIKsCYxeVSib+1jEoRGdpbgFSsCgYEAl4cheW8Xoh81qve+Vay4UOoJDb35W6wGJhWuwheAzkBPn+dCIw4IMmOvQ0dkfOzAq4+4fBKsSNuLZIKQYazU1Rs2sYTCLQDcmGDpsJup3mEVDcSveWDbsEx5u7beVGRpLmrUD1C/ZGKABH9ZhQIC+n1xFxSmv7MPvEZ0JWshRKUCgYEAhKUCF7k9BcZUkqm1X4Plxp88h1JyU/ZJQZVf781s5/RLKVkUj+RYzldOaacCNw0539ya4iioX81rZrzP53Q4gM4xsfTSKebYD6Khh3Ht9W9AKloqfoTW4W5zUMzvevtRK6pKqOT8nt4PuuHKyIHNz1tm/BwM01QuD3vmFRdZQP8CgYA/SDYYquap1HLrZe/dg/auBC+nx5EeUed3fFKxyHMIsB8Q3tnmHfQaZztI08YJzi5g9/LKDlpZSycZ4NU/lZiFL4pV9OXLObLnCIJQOZJlxxGt4FiQTn0xUZ79YE/V2uF6ey74/nYQDHr+ZdkTDVYFGuJiC0Pgh32o2ZukDOul6QKBgB78Lw0gw/rdutYtGoHQDDwGNGNpLo5umHRU6n47B0i7RIW/2iUrheePyOOXPhH9RVQ7t291tjQhYrjZYValH+0RZQDpP4Shjw5AuUc7MpOFbSKzlL5XLYyR8d8qTh8Xhr9KUBTtfXUL3iYQri+VNzsTKUglkGNq0NZPH9u4dtcX";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjcjmuPzhdoB7w6V4xlgJZWUIX40kX9e4AsotjCcbAvINzsEJETPeve/LFVMgnBIlgh8OU/8qmRKif5C9dr3erjmCTCfTQ8RDnzLGM83mRaqsV07kqqgmzGfVod8Ug/Yu3x8pTEw624ESr72kKvx7pZu28WxbScddGzbjXPmOsFTFHPatPH/9d9usiWiTsgY51YJMs2360edw8pwJp9NaDj2mF4zvGHlFlfx3KFv3otCzU8bK0Bm1L87OoFDIjBXBxasfridZSU+yTQvamJ1ZOJUd1iNoSuw6Ecjf0QMnztA3F8u/+PJXGB/iOwKW/bq78BI+r5r+CR5uDpF1d5gQtwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://www.baidu.com";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/index/stock";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
}

