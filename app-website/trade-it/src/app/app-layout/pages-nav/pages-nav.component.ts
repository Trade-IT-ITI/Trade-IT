import { HttpParams } from '@angular/common/http';
import { Component, OnInit, Output, EventEmitter, Input, OnChanges } from '@angular/core';
import { ProductsDetailsService } from 'src/app/services/products-details.service';

@Component({
  selector: 'app-pages-nav',
  templateUrl: './pages-nav.component.html',
  styleUrls: ['./pages-nav.component.css']
})
export class PagesNavComponent implements OnInit, OnChanges {
  @Output() changePaginagtionEvent: EventEmitter<{ pageNumber: number, itemsPerPage: number }>
    = new EventEmitter<{ pageNumber: number, itemsPerPage: number }>();
  @Input() itemsTotalCount: number = 0;

  itemsPerPage: number = 10;
  pageNumber: number = 1;
  totalPages: number = 1;

  constructor() {
  }

  ngOnChanges() {
    if (this.itemsTotalCount > 0)
      this.updateNav()
  }
  ngOnInit(): void {
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
  updateNav() {
    debugger;

    if (this.itemsTotalCount >= this.itemsPerPage)
      this.totalPages = this.itemsTotalCount / this.itemsPerPage;
    else
      this.totalPages = 1;

    if (this.pageNumber > this.totalPages) {
      this.pageNumber = this.totalPages;
    }

    this.changePaginagtionEvent.emit({ pageNumber: this.pageNumber, itemsPerPage: this.itemsPerPage });
  }
}
