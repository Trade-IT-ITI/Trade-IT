import { HttpParams } from '@angular/common/http';
import { Component, OnInit, Output, EventEmitter, Input } from '@angular/core';
import { ProductsDetailsService } from 'src/app/services/products-details.service';

@Component({
  selector: 'app-pages-nav',
  templateUrl: './pages-nav.component.html',
  styleUrls: ['./pages-nav.component.css']
})
export class PagesNavComponent implements OnInit {
  @Output() changePaginagtionEvent: EventEmitter<{ pageNumber: number, itemsPerPage: number }>
    = new EventEmitter<{ pageNumber: number, itemsPerPage: number }>();

  itemsTotalCount: number = 1;
  itemsPerPage: number = 1;
  pageNumber: number = 1;
  totalPages: number = 1;

  constructor(private productDetailsService: ProductsDetailsService) {
  }

  ngOnInit(): void {
    let detailsParams: HttpParams = new HttpParams();
    detailsParams = detailsParams.append('fetchProductsCount', true);

    this.productDetailsService.getProductsDetails(detailsParams).subscribe(data => {
      if (data.productsCount != null) this.itemsTotalCount = data.productsCount;
      this.updateMaxPages();
    })
  }
  changeItemsNumber(target: any) {
    this.itemsPerPage = Number(<HTMLSelectElement>target.value);

    this.updateMaxPages();
    if (this.pageNumber > this.totalPages) {
      this.pageNumber = this.totalPages;
    }
    this.changePaginagtionEvent.emit({ pageNumber: this.pageNumber, itemsPerPage: this.itemsPerPage });
  }
  goBack() {
    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.changePaginagtionEvent.emit({ pageNumber: this.pageNumber, itemsPerPage: this.itemsPerPage });
    }
  }
  goForword() {
    if (this.pageNumber < this.totalPages) {
      this.pageNumber++;
      this.changePaginagtionEvent.emit({ pageNumber: this.pageNumber, itemsPerPage: this.itemsPerPage });
    }
  }
  updateMaxPages() {
    if (this.itemsTotalCount >= this.itemsPerPage)
      this.totalPages = this.itemsTotalCount / this.itemsPerPage;
    else
      this.totalPages = 1;
  }

}
