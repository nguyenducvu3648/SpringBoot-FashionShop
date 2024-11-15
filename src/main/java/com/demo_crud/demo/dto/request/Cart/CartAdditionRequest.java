package com.demo_crud.demo.dto.request.Cart;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartAdditionRequest {
    String cartId;
    String productId;
    int quantity;
}