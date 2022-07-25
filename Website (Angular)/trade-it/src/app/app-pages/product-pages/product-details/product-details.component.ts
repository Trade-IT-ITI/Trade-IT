import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {
  id: number = 0;
  productDetails: any | null = null;
  isSold: boolean = false;
  imgIndex: number = 0;
  isRequestDetailsVisible: boolean = false;

  constructor(private route: ActivatedRoute, private productService: ProductService) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => this.id = params['id'])
    this.productService.getById(this.id).subscribe(data => {
      this.productDetails = data;
      this.isSold = (this.productDetails.status == 'Sold')
    });
    this.productService.increaseViewCount(this.id).subscribe(() => { })
  }
  onChooseImage(index: number) {
    this.imgIndex = index
  }
  onRequest() {
    this.isRequestDetailsVisible = true;
    this.productService.increaseRequestCount(this.id).subscribe(() => { })
  }
}
