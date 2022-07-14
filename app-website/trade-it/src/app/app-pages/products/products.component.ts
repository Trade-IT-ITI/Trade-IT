import { HttpParams } from '@angular/common/http';
import { Component, Input, OnChanges, OnInit } from '@angular/core';
import { ProductsData } from 'src/app/models/productsData';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit, OnChanges {

  @Input() productCol: { 'colLg': number, 'colMd': number, 'colSm': number, 'col': number } = { colLg: 0, colMd: 0, colSm: 0, col: 0 }
  @Input() queryParams: HttpParams = new HttpParams();

  productsData: ProductsData = { products: [], productsCount: 0 };
  itemsNumber: number = 10;
  pageNumber: number = 1;
  productsTotalCount: number = 0;

  isLoading: boolean = false;
  productColClass: string = '';
  constructor(private productService: ProductService) {

  }

  ngOnInit(): void {
    this.productColClass = `col-lg-${this.productCol.colLg} col-md-${this.productCol.colMd} col-sm-${this.productCol.colSm} col-${this.productCol.col}`;
  }

  ngOnChanges(): void {
    this.loadData()
  }

  private loadData() {
    if (!this.queryParams.has('pageNumber'))
      this.queryParams = this.queryParams.append('pageNumber', this.pageNumber);
    else
      this.queryParams = this.queryParams.set('pageNumber', this.pageNumber);

    if (!this.queryParams.has('pageCapacity'))
      this.queryParams = this.queryParams.append('pageCapacity', this.itemsNumber);
    else
      this.queryParams = this.queryParams.set('pageCapacity', this.itemsNumber);

    this.getData();
  }

  private getData() {
    this.isLoading = true;
    this.productService.getall(this.queryParams).subscribe(data => {
      this.productsData = data;
      this.isLoading = false;
    })
  }

  paginationChanged(pageData: { pageNumber: number, itemsPerPage: number }) {
    this.pageNumber = pageData.pageNumber;
    this.itemsNumber = pageData.itemsPerPage;
    this.loadData()
  }
}
