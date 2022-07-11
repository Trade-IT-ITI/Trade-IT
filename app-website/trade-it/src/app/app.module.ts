import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { NavbarComponent } from './app-layout/navbar/navbar.component';
import { NavbarCategoriesComponent } from './app-layout/navbar-categories/navbar-categories.component';
import { HomeComponent } from './app-pages/home/home.component';
import { SliderComponent } from './app-pages/slider/slider.component';
import { ProductsComponent } from './app-pages/products/products.component';
import { DurationPipe } from './pipes/duration.pipe';
import { FooterComponent } from './app-layout/footer/footer.component';
import { PagesNavComponent } from './app-layout/pages-nav/pages-nav.component';
import { SearchComponent } from './app-pages/search/search.component';
import { NgxSliderModule } from '@angular-slider/ngx-slider';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'search', component: SearchComponent },
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
    SearchComponent,
  ],
  imports: [
    BrowserModule,
    NoopAnimationsModule,
    HttpClientModule,
    FormsModule,
    NgxSliderModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
