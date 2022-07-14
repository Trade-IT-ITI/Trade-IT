import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddCityComponent } from './component/Location/City/add-city/add-city.component';
import { AddCategoryComponent } from './component/Category/add-category/add-category.component';
import { AddSubcategoryComponent } from './component/Subcategory/add-subcategory/add-subcategory.component';

const routes: Routes = [
  {path:"category", component: AddCategoryComponent},
  {path:"subcategory", component: AddSubcategoryComponent},
  {path:"city", component: AddCityComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
