import { HttpParams } from '@angular/common/http';
import { Component, Output, OnInit, EventEmitter } from '@angular/core';
import { Router } from '@angular/router';
import { category } from 'src/app/models/category';
import { CategoyService } from '../../services/categoy.service';


@Component({
  selector: 'app-navbar-categories',
  templateUrl: './navbar-categories.component.html',
  styleUrls: ['./navbar-categories.component.css']
})
export class NavbarCategoriesComponent implements OnInit {
  categories: category[] = [];
  @Output() toggle: EventEmitter<boolean> = new EventEmitter<boolean>();
  constructor(private categoryService: CategoyService, private router: Router) {
  }

  ngOnInit(): void {
    let params: HttpParams = new HttpParams();
    params = params.append('expand', 'Subcategories');
    this.categoryService.getall(params).subscribe(data => {
      this.categories = data
    });
  }

  onClickCategory(category: any) {
    this.router.navigate(['/search'], { queryParams: { 'category': category } })
    this.toggle.emit(false);
  }
  onClickSubcategory(category: any, subcategory: any) {
    this.router.navigate(['/search'], { queryParams: { 'category': category, 'subcategory': subcategory } })
    this.toggle.emit(false);
  }
}
