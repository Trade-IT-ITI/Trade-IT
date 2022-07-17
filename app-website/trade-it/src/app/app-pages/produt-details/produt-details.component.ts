import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-produt-details',
  templateUrl: './produt-details.component.html',
  styleUrls: ['./produt-details.component.css']
})
export class ProdutDetailsComponent implements OnInit {
  id: number = 0;
  productDetails: any = {}
  isSold: boolean = false;
  imgIndex: number = 0;

  constructor(private route: ActivatedRoute, private productService: ProductService) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => this.id = params['id'])
    this.productService.getById(this.id).subscribe(data => {
      this.productDetails = data;
      this.isSold = (this.productDetails.status == 'Sold')
    });
  }
  onChooseImage(index: number) {
    this.imgIndex = index
  }
}
