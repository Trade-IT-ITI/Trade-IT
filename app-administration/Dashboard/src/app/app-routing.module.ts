import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AddInstructionComponent } from 'src/app/component/Instruction/add-instruction/add-instruction.component';
import { AddCityComponent } from 'src/app/component/Location/City/add-city/add-city.component';
import { AddCategoryComponent } from 'src/app/component/Category/add-category/add-category.component';
import { AddSubcategoryComponent } from 'src/app/component/Subcategory/add-subcategory/add-subcategory.component';
import { AddAreaComponent } from 'src/app/component/Location/Area/add-area/add-area.component';

const routes: Routes = [
  {path:"category", component: AddCategoryComponent},
  {path:"subcategory", component: AddSubcategoryComponent},
  {path:"city", component: AddCityComponent},
  {path:"area", component: AddAreaComponent},
  {path:"instruction", component: AddInstructionComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
