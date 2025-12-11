package com.demo_crud.demo.service.Payment;

import com.demo_crud.demo.Enum.PaymentMethod;
import com.demo_crud.demo.Enum.PaymentStatus;
import com.demo_crud.demo.entity.Order;
import com.demo_crud.demo.repository.Order.OrderRepository;
import com.demo_crud.demo.repository.Payment.PaymentRepository;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PaymentService {
    APIContext apiContext;

    PaymentRepository paymentRepository;

    OrderRepository orderRepository;

    private final String successUrl = "http://localhost:8080/payment/paypal-callback";
    private final String cancelUrl = "http://localhost:3000/payment-failed";

    public String createPayPalPayment(HttpServletRequest request) {
        try {
            String orderId = request.getParameter("orderId");

            Order order = orderRepository.findById(orderId)
                    .orElseThrow(() -> new RuntimeException("Order not found"));

            Amount amount = new Amount();
            amount.setCurrency("USD");
            amount.setTotal(String.format("%.2f", order.getTotalAmount()));

            Transaction transaction = new Transaction();
            transaction.setDescription("Payment for Order #" + order.getId());
            transaction.setAmount(amount);

            Payer payer = new Payer();
            payer.setPaymentMethod("paypal");

            com.paypal.api.payments.Payment paypalPayment = new com.paypal.api.payments.Payment();
            paypalPayment.setIntent("sale");
            paypalPayment.setPayer(payer);
            paypalPayment.setTransactions(List.of(transaction));

            RedirectUrls redirectUrls = new RedirectUrls();
            redirectUrls.setCancelUrl(cancelUrl);
            redirectUrls.setReturnUrl(successUrl);
            paypalPayment.setRedirectUrls(redirectUrls);

            com.paypal.api.payments.Payment createdPayment = paypalPayment.create(apiContext);

            // Lưu vào DB
            com.demo_crud.demo.entity.Payment paymentEntity = new com.demo_crud.demo.entity.Payment();
            paymentEntity.setOrder(order);
            paymentEntity.setAmount(order.getTotalAmount());
            paymentEntity.setPaymentMethod(PaymentMethod.PAYPAL);
            paymentEntity.setStatus(PaymentStatus.PENDING);
            paymentEntity.setTransactionId(createdPayment.getId());

            paymentRepository.save(paymentEntity);
            
            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return link.getHref();
                }
            }

        } catch (Exception e) {
            log.error("Error executing PayPal payment", e);
        }

        return null;
    }

    public com.demo_crud.demo.entity.Payment executePayPalPayment(String paymentId, String payerId) {
        try {
            com.paypal.api.payments.Payment paypalPayment = new com.paypal.api.payments.Payment();
            paypalPayment.setId(paymentId);

            PaymentExecution paymentExecution = new PaymentExecution();
            paymentExecution.setPayerId(payerId);

            com.paypal.api.payments.Payment executedPayment =
                    paypalPayment.execute(apiContext, paymentExecution);

            Optional<com.demo_crud.demo.entity.Payment> optional =
                    paymentRepository.findByTransactionId(paymentId);

            if (optional.isPresent()) {
                com.demo_crud.demo.entity.Payment paymentEntity = optional.get();

                if ("approved".equalsIgnoreCase(executedPayment.getState())) {
                    paymentEntity.setStatus(PaymentStatus.SUCCESS);
                    paymentEntity.setPaidAt(LocalDateTime.now());
                } else {
                    paymentEntity.setStatus(PaymentStatus.FAILED);
                }

                return paymentRepository.save(paymentEntity);
            } else {
                throw new RuntimeException("Payment entity not found for transactionId = " + paymentId);
            }

        } catch (PayPalRESTException e) {
            log.error("Error executing PayPal payment", e);
            throw new RuntimeException("Error executing PayPal payment", e);
        }
    }
}
