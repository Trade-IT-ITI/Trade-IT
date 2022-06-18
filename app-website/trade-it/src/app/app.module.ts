import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarComponent } from './app-layout/navbar/navbar.component';
import { NavbarCategoriesComponent } from './app-layout/navbar-categories/navbar-categories.component';
import { HomeComponent } from './app-pages/home/home.component';
import { SliderComponent } from './app-pages/slider/slider.component';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    NavbarCategoriesComponent,
    HomeComponent,
    SliderComponent
  ],
  imports: [
    BrowserModule,
    NoopAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
