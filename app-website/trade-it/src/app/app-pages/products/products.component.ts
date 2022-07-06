import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/models/product';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  products: Product[] = [];
  constructor(private productService: ProductService) {
  }

  ngOnInit(): void {
    let params: HttpParams = new HttpParams();
    params = params.append('expand', 'City');
    params = params.append('expand', 'Area');
    params = params.append('expand', 'ProductImages');
    this.productService.getall(params).subscribe(data => {
      this.products = data;
      console.log(data);
    })
  }

}
