import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddCategoryComponent } from './component/Category/add-category/add-category.component';
import { AddInstructionComponent } from './component/Instruction/add-instruction/add-instruction.component';
import { AddAreaComponent } from './component/Location/Area/add-area/add-area.component';
import { AddCityComponent } from './component/Location/City/add-city/add-city.component';
import { AddStatusComponent } from './component/Status/add-status/add-status.component';
import { AddSubcategoryComponent } from './component/Subcategory/add-subcategory/add-subcategory.component';

const routes: Routes = [
  
  {path:"category/add", component: AddCategoryComponent},
  {path:"subcategory/add", component: AddSubcategoryComponent},
  {path:"city/add", component: AddCityComponent},
  {path:"area/add", component: AddAreaComponent},
  {path:"instruction/add", component: AddInstructionComponent},
  {path:"status/add", component: AddStatusComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
