import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddCategoryComponent } from './Category/add-category/add-category.component';
import { AddSubcategoryComponent } from './Category/add-subcategory/add-subcategory.component';

const routes: Routes = [
  {path:"category", component: AddCategoryComponent},
  {path:"subcategory", component: AddSubcategoryComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
