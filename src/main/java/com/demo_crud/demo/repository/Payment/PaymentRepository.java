package com.demo_crud.demo.repository.Payment;

import com.demo_crud.demo.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, String> {
    Optional<Payment> findByTransactionId(String paymentId);
}
