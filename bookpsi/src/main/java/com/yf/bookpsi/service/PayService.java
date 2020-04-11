package com.yf.bookpsi.service;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.yf.bookpsi.config.AlipayConfig;
import com.yf.bookpsi.pojo.Orders;
import com.yf.bookpsi.util.SerialNumber;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Service
public class PayService {

    public String aliPay(int id) throws IOException, AlipayApiException {

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest aliPayRequest = new AlipayTradePagePayRequest();

        aliPayRequest.setReturnUrl(AlipayConfig.return_url);
        aliPayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，后台可以写一个工具类生成一个订单号，必填
        String order_number = new String(String.valueOf(id));
        //String order_number = new String("5553222252");
        //付款金额，从前台获取，必填
        //String total_amount = String.valueOf(orders.getValue());
        String total_amount = new String("300");
        //订单名称，必填
        String subject = new String("图书采购");
        aliPayRequest.setBizContent("{\"out_trade_no\":\"" + order_number + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求
        String result = null;

            result = alipayClient.pageExecute(aliPayRequest).getBody();

        //输出
        //out.println(result);
        return result;
       // out.write(result);
        //log.info("返回结果={}",result);
    }

    public String aliPaytest(Integer number,Integer snumber) throws IOException, AlipayApiException {

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest aliPayRequest = new AlipayTradePagePayRequest();

        aliPayRequest.setReturnUrl(AlipayConfig.return_url);
        aliPayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，后台可以写一个工具类生成一个订单号，必填
        //String order_number = new String(String.valueOf(number1));
        String order_number = new String(String.valueOf(snumber));
        System.out.println("订单号是"+snumber);
        //付款金额，从前台获取，必填
        //String total_amount = new String(String.valueOf(number));
        String total_amount = new String(String.valueOf(number));
        System.out.println("价格是"+number);
        //订单名称，必填
        String subject = new String("图书采购订单支付");
        aliPayRequest.setBizContent("{\"out_trade_no\":\"" + order_number + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求
        String result = null;

        result = alipayClient.pageExecute(aliPayRequest).getBody();

        //输出
        //out.println(result);
        return result;
        // out.write(result);
        //log.info("返回结果={}",result);
    }
}
