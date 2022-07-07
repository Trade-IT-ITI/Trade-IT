import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/models/product';
import { ProductService } from 'src/app/services/product.service';
import { ProductsDetailsService } from 'src/app/services/products-details.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {

  products: Product[] = [];
  itemsNumber: number = 1;
  pageNumber: number = 1;
  productsTotalCount: number = 0;
  constructor(private productService: ProductService) {

  }

  ngOnInit(): void {
    this.loadData()
  }

  private loadData() {
    let params: HttpParams = new HttpParams();
    params = params.append('expand', 'City');
    params = params.append('expand', 'Area');
    params = params.append('expand', 'ProductImages');
    params = params.append('pageNumber', this.pageNumber);
    params = params.append('pageCapacity', this.itemsNumber);
    this.productService.getall(params).subscribe(data => {
      this.products = data;
    })
  }

  paginationChanged(pageData: { pageNumber: number, itemsPerPage: number }) {
    this.pageNumber = pageData.pageNumber;
    this.itemsNumber = pageData.itemsPerPage;
    this.loadData()
  }
}
