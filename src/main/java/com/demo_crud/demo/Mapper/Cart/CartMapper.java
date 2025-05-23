package com.demo_crud.demo.Mapper.Cart;

import com.demo_crud.demo.dto.response.Cart.CartItemResponse;
import com.demo_crud.demo.dto.response.Cart.CartResponse;
import com.demo_crud.demo.dto.response.ProductResponse.ProductResponse;
import com.demo_crud.demo.entity.Cart;
import com.demo_crud.demo.entity.CartItem;
import com.demo_crud.demo.entity.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CartMapper {

    @Mapping(target = "cartId", source = "id")
    @Mapping(target = "cartItems", source = "cartItems")
    @Mapping(target = "totalAmount", expression = "java(cart.getCartItems().stream().mapToDouble(CartItem::getTotalPrice).sum())")
    @Mapping(target = "user", source = "user.username")
    CartResponse toCartResponse(Cart cart);

    @Mapping(target = "cartItemId", source = "id")
    @Mapping(target = "productResponse", source = "product")
    @Mapping(target = "totalPrice", expression = "java(cartItem.getQuantity() * cartItem.getProduct().getPrice())")
    CartItemResponse toCartItemResponse(CartItem cartItem);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "name", source = "name")
    @Mapping(target = "price", source = "price")
    @Mapping(target = "description", source = "description")
    @Mapping(target = "releaseDate", source = "releaseDate")
    @Mapping(target = "imageUrl", source = "imageUrl")
    ProductResponse toProductResponse(Product product);

}
