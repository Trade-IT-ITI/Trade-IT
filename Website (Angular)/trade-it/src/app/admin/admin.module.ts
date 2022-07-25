import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AdminRoutingModule } from './admin.routing';

import { AdminComponent } from 'src/app/admin/admin.component';
import { AddCategoryComponent } from 'src/app/admin/component/Category/add-category/add-category.component';
import { SidebarComponent } from 'src/app/admin/Layout/sidebar/sidebar.component';
import { AddSubcategoryComponent } from 'src/app/admin/component/Subcategory/add-subcategory/add-subcategory.component';
import { AddCityComponent } from 'src/app/admin/component/Location/City/add-city/add-city.component';
import { AddAreaComponent } from 'src/app/admin/component/Location/Area/add-area/add-area.component';
import { AddInstructionComponent } from 'src/app/admin/component/Instruction/add-instruction/add-instruction.component';
import { AddStatusComponent } from 'src/app/admin/component/Status/add-status/add-status.component';
import { RouterModule } from '@angular/router';
import { CategoryInstructionComponent } from './component/category-instruction/category-instruction.component';



@NgModule({
  declarations: [
    AdminComponent,
    SidebarComponent,
    AddCategoryComponent,
    AddSubcategoryComponent,
    AddCityComponent,
    AddAreaComponent,
    AddInstructionComponent,
    AddStatusComponent,
    CategoryInstructionComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    FormsModule,
    RouterModule
  ],
  exports: [
    AdminComponent,
    SidebarComponent,
    AddCategoryComponent,
    AddSubcategoryComponent,
    AddCityComponent,
    AddAreaComponent,
    AddInstructionComponent,
    AddStatusComponent
  ],
})
export class AdminModule { }
