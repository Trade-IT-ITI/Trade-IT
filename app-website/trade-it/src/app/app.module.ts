import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarComponent } from './app-layout/navbar/navbar.component';
import { NavbarCategoriesComponent } from './app-layout/navbar-categories/navbar-categories.component';
import { HomeComponent } from './app-pages/home/home.component';
import { SliderComponent } from './app-pages/slider/slider.component';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { ProductsComponent } from './app-pages/products/products.component';
import { DurationPipe } from './pipes/duration.pipe';
import { FooterComponent } from './app-layout/footer/footer.component';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { PagesNavComponent } from './app-layout/pages-nav/pages-nav.component';

const routes: Routes = [
  { path: '', component: HomeComponent }
]

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    NavbarCategoriesComponent,
    HomeComponent,
    SliderComponent,
    ProductsComponent,
    DurationPipe,
    FooterComponent,
    PagesNavComponent,

  ],
  imports: [
    BrowserModule,
    NoopAnimationsModule,
    HttpClientModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
