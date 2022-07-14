import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule ,HTTP_INTERCEPTORS} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AddCategoryComponent } from './Category/add-category/add-category.component';
import { SidebarComponent } from './Layout/sidebar/sidebar.component';
import { AddSubcategoryComponent } from './Category/add-subcategory/add-subcategory.component';
import { AddCityComponent } from './Location/City/add-city/add-city.component';
import { AddAreaComponent } from './Location/Area/add-area/add-area.component';


@NgModule({
  declarations: [
    AppComponent,
    AddCategoryComponent,
    SidebarComponent,
    AddSubcategoryComponent,
    AddCityComponent,
    AddAreaComponent
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
