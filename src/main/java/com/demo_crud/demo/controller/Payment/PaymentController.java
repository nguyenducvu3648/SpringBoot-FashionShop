package com.demo_crud.demo.controller.Payment;

import com.demo_crud.demo.dto.request.ApiResponse;


import com.demo_crud.demo.entity.Payment;
import com.demo_crud.demo.service.Payment.PaymentService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PaymentController {
    PaymentService paymentService;

    @PostMapping("/paypal")
    public ApiResponse<String> createPayPalPayment(HttpServletRequest request) {
        String approvalUrl = paymentService.createPayPalPayment(request);
        if (approvalUrl == null) {
            return ApiResponse.<String>builder()
                    .code(HttpStatus.BAD_REQUEST.value())
                    .message("Failed to create PayPal payment")
                    .build();
        }
        return ApiResponse.<String>builder()
                .code(HttpStatus.OK.value())
                .message("OK")
                .data(approvalUrl)
                .build();
    }

    @GetMapping("/paypal-callback")
    public ApiResponse<String> handlePayPalCallback(
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId) {
        try {
            Payment executedPayment = paymentService.executePayPalPayment(paymentId, payerId);
            if (executedPayment.getStatus() != null && executedPayment.getStatus().toString().equalsIgnoreCase("SUCCESS")) {
                return ApiResponse.<String>builder()
                        .code(HttpStatus.OK.value())
                        .message("Payment successful")
                        .data("http://localhost:3000/payment-success")
                        .build();
            } else {
                return ApiResponse.<String>builder()
                        .code(HttpStatus.BAD_REQUEST.value())
                        .message("Payment failed")
                        .data("http://localhost:3000/payment-failed")
                        .build();
            }
        } catch (Exception e) {
            return ApiResponse.<String>builder()
                    .code(HttpStatus.INTERNAL_SERVER_ERROR.value())
                    .message("Payment error: " + e.getMessage())
                    .data("http://localhost:3000/payment-error")
                    .build();
        }
    }

}
