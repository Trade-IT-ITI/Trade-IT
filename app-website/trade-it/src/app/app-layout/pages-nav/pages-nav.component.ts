import { Component, OnInit, Output, EventEmitter, Input, OnChanges, SimpleChange, SimpleChanges } from '@angular/core';

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

  isNextEnable: boolean = true;
  isPreviousEnable: boolean = true;

  constructor() {
  }

  ngOnChanges() {
    if (this.itemsTotalCount > 0) {
      this.updateNav();
    }
  }

  ngOnInit(): void {
  }

  goBack() {
    if (this.isPreviousEnable) {
      this.pageNumber--;
      this.isNextEnable = this.pageNumber < this.totalPages;
      this.isPreviousEnable = this.pageNumber > 1;
      this.emitChanges();
    }
  }

  goForword() {
    if (this.isNextEnable) {
      this.pageNumber++;
      this.isNextEnable = this.pageNumber < this.totalPages;
      this.isPreviousEnable = this.pageNumber > 1;
      this.emitChanges();
    }
  }

  updateNav() {
    if (this.itemsTotalCount >= this.itemsPerPage)
      this.totalPages = this.itemsTotalCount / this.itemsPerPage;
    else
      this.totalPages = 1;

    if (this.pageNumber > this.totalPages) {
      this.pageNumber = this.totalPages;
    }
    this.isNextEnable = this.pageNumber < this.totalPages;
    this.isPreviousEnable = this.pageNumber > 1;
  }

  emitChanges() {
    this.changePaginagtionEvent.emit({ pageNumber: this.pageNumber, itemsPerPage: this.itemsPerPage });
  }

  onSelectItemsPerPage() {
    this.updateNav();
    this.emitChanges();
  }
}
