import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AddInstructionComponent } from 'src/app/component/Instruction/add-instruction/add-instruction.component';
import { AddCityComponent } from 'src/app/component/Location/City/add-city/add-city.component';
import { AddCategoryComponent } from 'src/app/component/Category/add-category/add-category.component';
import { AddSubcategoryComponent } from 'src/app/component/Subcategory/add-subcategory/add-subcategory.component';
import { AddAreaComponent } from 'src/app/component/Location/Area/add-area/add-area.component';
import { AddStatusComponent } from 'src/app/component/Status/add-status/add-status.component';

const routes: Routes = [
  {path:"category", component: AddCategoryComponent},
  {path:"subcategory", component: AddSubcategoryComponent},
  {path:"city", component: AddCityComponent},
  {path:"area", component: AddAreaComponent},
  {path:"instruction", component: AddInstructionComponent},
  {path:"status", component: AddStatusComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
