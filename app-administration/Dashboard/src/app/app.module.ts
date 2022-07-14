import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule ,HTTP_INTERCEPTORS} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AddCategoryComponent } from './component/Category/add-category/add-category.component';
import { SidebarComponent } from './Layout/sidebar/sidebar.component';
import { AddSubcategoryComponent } from './component/Subcategory/add-subcategory/add-subcategory.component';
import { AddCityComponent } from './component/Location/City/add-city/add-city.component';
import { AddAreaComponent } from './component/Location/Area/add-area/add-area.component';
import { AddInstructionComponent } from './component/Instruction/add-instruction/add-instruction.component';


@NgModule({
  declarations: [
    AppComponent,
    AddCategoryComponent,
    SidebarComponent,
    AddSubcategoryComponent,
    AddCityComponent,
    AddAreaComponent,
    AddInstructionComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
