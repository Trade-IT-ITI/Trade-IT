import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductData } from 'src/app/models/productData';
import { ProductService } from 'src/app/services/product.service';
import { ProductsDetailsService } from 'src/app/services/products-details.service';

@Component({
  selector: 'app-produt-details',
  templateUrl: './produt-details.component.html',
  styleUrls: ['./produt-details.component.css']
})
export class ProdutDetailsComponent implements OnInit {
  id: number = 0;
  productDetails: ProductData | null = null

  constructor(private route: ActivatedRoute, private productService: ProductService) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => this.id = params['id'])
    this.productService.getById(this.id).subscribe(data => {
      this.productDetails = data
      console.log(this.productDetails)
    });
  }

}
